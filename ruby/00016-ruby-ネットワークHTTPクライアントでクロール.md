- REF
  - http://otn.hatenablog.jp/entry/20090509/p1

使用感

```
$cat input.txt | ruby -rnokogiri -e 'p Nokogiri::HTML.parse(readlines.join("\n")).css(".entry-title").map(&:text)'
$cat input.txt | ruby -rnokogiri -e 'p Nokogiri::HTML.parse(readlines.join("\n")).css(".entry-title").map(&:attributes)'
$cat input.txt | ruby -rnokogiri -e 'p Nokogiri::HTML.parse(readlines.join("\n")).css(".entry-title").map(&:attributes["id"])'
$cat input.txt | ruby -rnokogiri -e 'p Nokogiri::HTML.parse(readlines.join("\n")).css(".entry-title").map(&:attributes["name"])'
$cat input.txt | ruby -rnokogiri -e 'p Nokogiri::HTML.parse(readlines.join("\n")).css(".entry-title").map(&:attributes["value"])'
```

- CMD
  - 入力データ作成
```
echo "https://ukijumotahaneniarukenia.site/"{,page/{2..18}/} | ruby -ruri -rnet/http -anle '$F.map{|e|Net::HTTP.get_print(URI.parse(e))}'>input.txt
```


- CMD
  - リンクとタイトル取得

```
$cat input.txt | ruby -rnkf -rnokogiri -ruri -e 'a=Nokogiri::HTML.parse(readlines.join(" ").gsub(/\s{1,}/," ")).css("a").map{|e|e[:href]};b=a.grep(/^[^#]/).select{|e|true != e.nil?};c=b.map{|e|e.gsub(/#.*$/,"")}.uniq.sort;c.map{|e|printf("%s\t%s\n",NKF.nkf("-Ww",URI.unescape(e)),e)}'>done.tsv
```
