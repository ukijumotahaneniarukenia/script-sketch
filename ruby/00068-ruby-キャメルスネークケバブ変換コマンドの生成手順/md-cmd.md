作業ディレクトリ

```
cd $HOME/script-cmd/ruby/2-5-1
```

マスタ作成
```
echo {downcamel,unkoMoriMori,upcamel,UnkoMoriMori,snake,unko_mori_mori,screamsnake,UNKO_MORI_MORI,kebab,unko-mori-mori,train,Unko-Mori-Mori} | xargs -n1 | xargs -n2 >master-list.txt
```

ディレクトリ作成
```
echo {downcamel,upcamel,snake,screamsnake,kebab,train} | ruby -anle 'puts *$F.permutation(2)'|xargs -n2|tr ' ' '2'| xargs -I@ mkdir -p @
```

テンプレート配備
```
echo {downcamel,upcamel,snake,screamsnake,kebab,train} | ruby -anle 'puts *$F.permutation(2)'|xargs -n2|tr ' ' '2'| xargs -I@ echo cp template.sh @/ | bash
```

リネーム

```
echo {downcamel,upcamel,snake,screamsnake,kebab,train} | ruby -anle 'puts *$F.permutation(2)'|xargs -n2|tr ' ' '2'| xargs -I@ echo mv @/template.sh @/@-ruby | bash
```

テーブルの作成
```
echo {downcamel,upcamel,snake,screamsnake,kebab,train} | ruby -anle 'puts *$F.permutation(2)'|xargs -n2|while read in out;do echo $in"2"$out;cat master-list.txt| grep ^$in|awk '$0=$2';cat master-list.txt| grep ^$out|awk '$0=$2';done |xargs -n3 | tr ' ' '\t'>cmd_name-in-out-cmd_str.tsv
```

置換
```
今回の自動生成
cat cmd-in-out-cmd_str.tsv | while read cmd_name in out cmd_str;do sed "s/INPUT_STR/$in/g;s/OUTPUT_STR/$out/g;s/CMD_STR/$cmd_str/g;" template.sh>$cmd_name/$cmd_name-ruby;done

前回までの自動生成（上書き）
cat cmd-in-out.tsv | while read cmd_name in out cmd_str;do sed "s/INPUT_STR/$in/g;s/OUTPUT_STR/$out/g;s/CMD_STR/$cmd_str/g;" template.sh | sponge $cmd_name/$cmd_name-ruby;done
```

チェックリスト作成
```
$ cat cmd_name-in-out-cmd_str.tsv  | awk '$0=$1' | xargs -I@ echo - [ ] @
```

- [ ] downcamel2upcamel
- [ ] downcamel2snake
- [ ] downcamel2screamsnake
- [ ] downcamel2kebab
- [ ] downcamel2train
- [ ] upcamel2downcamel
- [ ] upcamel2snake
- [ ] upcamel2screamsnake
- [ ] upcamel2kebab
- [ ] upcamel2train
- [ ] snake2downcamel
- [ ] snake2upcamel
- [ ] snake2screamsnake
- [ ] snake2kebab
- [ ] snake2train
- [ ] screamsnake2downcamel
- [ ] screamsnake2upcamel
- [ ] screamsnake2snake
- [ ] screamsnake2kebab
- [ ] screamsnake2train
- [ ] kebab2downcamel
- [ ] kebab2upcamel
- [ ] kebab2snake
- [ ] kebab2screamsnake
- [ ] kebab2train
- [ ] train2downcamel
- [ ] train2upcamel
- [ ] train2snake
- [ ] train2screamsnake
- [ ] train2kebab


実装など
差分実装

コマンド抽出
```
$ cat cmd_name-in-out-cmd_str.tsv | awk '{print $1,$2,$3}' OFS="\t" | while read cmd_name in out;do echo -e "$cmd_name\t$in\t$out"; sed -n 25p $cmd_name/$cmd_name-ruby|sed -r 's/echo\s+"\$\{STR\}"\s+\| //'|sed -r 's/^\s//g;s/^ //';done>cmd_name-in-out-cmd_str.txt
```

テーブル再作成
```
$ cat cmd_name-in-out-cmd_str.tsv | awk '{print $1}' | xargs -I@ grep -A1 -P ^@ cmd_name-in-out-cmd_str.txt|awk '{a+=NR%2}{b[a]=b[a]"\t"$0};END{for(e in b)print e,b[e]}'|sed 's/ \t/\t/'|sort -nk1|awk -v FS="\t" '{print $2,$3,$4,$5}' OFS="\t" | sponge cmd_name-in-out-cmd_str.tsv
```

後処理

アンパサンドが事故るので、一括置換

```
ag CMD_STR -l | grep -vP 'md-cmd.md|template.sh' | xargs perl -i -pe 's/CMD_STR/\&/'
```

2回目以降

パタンが増え次第上記のフローで自動生成

cmd_name-in-out-cmd_str.txtは残っているので、リカバレル

