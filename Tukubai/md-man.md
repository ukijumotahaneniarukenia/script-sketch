- https://uec.usp-lab.com/JOURNAL/IMG/CODEREVIEW_VOL37.PDF

- https://uec.usp-lab.com/TUKUBAI_MAN/CGI/TUKUBAI_MAN.CGI?POMPA=LIST


１億件１分

```
$time ./00004-Tukubai-ダミーデータの作成.sh 100000000

real	0m59.911s
user	1m23.743s
sys	0m10.471s

$ls -lh done
-rw-r--r--. 1 kuraine kuraine 3.2G  5月 21 22:40 done


ヘッダ行込み
$grep -c '' done
100000001
```
