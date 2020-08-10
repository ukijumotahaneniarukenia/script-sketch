package main

import (
	"bufio"
	"io"
	"io/ioutil"
	"log"
	"os"
	"strconv"
	"strings"

	"github.com/bluele/mecab-golang"
)

//https://qiita.com/ogady/items/78b40aa8780edf234c5f#%E5%BD%A2%E6%85%8B%E7%B4%A0%E8%A7%A3%E6%9E%90%E3%82%92%E8%A1%8C%E3%81%86

func getWordCnt(text string) (map[string]int, error) {

	wordMap := make(map[string]int) //keyが文字列でvalueが数値のマップコンストラクタを生成

	m, err := mecab.New("-Owakati") //コンストラクタのオプションに分かち書きを指定
	if err != nil {
		log.Fatal(err)
		panic(err)
	}
	defer m.Destroy() //メモリ解放

	tagger, err := m.NewTagger()
	if err != nil {
		log.Fatal(err)
		panic(err)
	}
	defer tagger.Destroy()

	lattice, err := m.NewLattice(text)
	if err != nil {
		log.Fatal(err)
		panic(err)
	}
	defer lattice.Destroy()

	node := tagger.ParseToNode(lattice)

	//ここが文法になれてないおかげでよくイメージできん
	//無限ループだと思われ
	for {
		features := strings.Split(node.Feature(), ",")
		if features[0] == "名詞" {
			wordMap[node.Surface()]++ //perlのあれと一緒
			// fmt.Println(fmt.Sprintf("%s %s", node.Surface(), node.Feature()))
		}
		if node.Next() != nil {
			//ライブラリ依存だから、直感的じゃyないけど、無限ループの終了条件
			break
		}
	}

	return wordMap, nil
}

//https://qiita.com/tchnkmr/items/b686adc4a7e144d48755

func main() {

	colSeparator := "\t"
	rowSeparator := "\n"

	inputFileName := "2093.txt"

	titleName := "ドグラ・マグラ"
	prefix := "NNN"
	suffix := ".tsv"
	separator := "-"
	outFileName := prefix + separator + titleName + separator + suffix

	b, err := ioutil.ReadFile(inputFileName) //一括読み込み
	if err != nil {
		log.Fatal(err)
		panic(err)
	}
	lines := string(b) //バイト配列を文字列に変換

	rt, err := getWordCnt(lines)
	if err != nil {
		log.Fatal(err)
		panic(err)
	}

	// ファイル作成
	outFile, err := os.Create(outFileName)
	if err != nil {
		log.Fatal(err)
		panic(err)
	}
	// ファイル遅延クローズ
	defer outFile.Close()

	//range便利
	//https://blog.y-yuki.net/entry/2017/04/26/000000
	for key, value := range rt {
		// fmt.Printf("%s\t%d\n", key, value)
		// ファイル書き込み

		//https://golang.org/pkg/strconv/
		tee := io.TeeReader(strings.NewReader(key+colSeparator+strconv.Itoa(value)+rowSeparator), outFile)
		s := bufio.NewScanner(tee)
		for s.Scan() {
			//バッファーからスキャンできなくなるまでfor文回さないと、書き込まれない
		}
		if err := s.Err(); err != nil {
			log.Fatal(err)
			panic(err)
		}
	}

}
