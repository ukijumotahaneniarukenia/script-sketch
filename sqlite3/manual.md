# 環境構築

window function
https://www.sqlite.org/windowfunctions.html#aggwinfunc

core function
https://www.sqlite.org/lang_corefunc.html


https://qiita.com/edo_m18/items/b9765ff3313d5a13f82f

https://qiita.com/argama147/items/2f636a2f4fd76f6ce130

鬼車の正規表現使ってみようかな
ダイナミックライブラリリンクファイル読み込めばいけそう

https://code-examples.net/en/q/4d62f1

Sql 正規表現使う

https://youtu.be/PxMW-2aBQSQ

https://stackoverflow.com/questions/38877856/replace-a-part-of-a-string-with-regexp-in-sqlite3

ダンプして、リードする

https://www.dbonline.jp/sqlite/sqlite_command/index9.html

https://www.dbonline.jp/sqlite/sqlite_command/index10.html


正規表現使うには
https://shobon.hatenablog.com/entry/2018/02/14/204350


GLOB句とか

https://www.dbonline.jp/sqlite/




標準出力のみりダイレクト
```
tee log 2>&1
```

標準エラー出力もりダイレクト
```
>log 2>&1
```

```
[sqlite💞ceacf3fb0808 (土 10月 26 01:08:28) ~/script_scratch/sqlite]$./mk_test_tbl.sh | tee log
/tmp/tmp.OTS4vdIPyZ/1435.sql
drop table test_tbl;
create table test_tbl(	col1   text,col2   text,col3   text,col4   text,col5   text,col6   text,col7   text,col8   text,col9   text,col10   text	);
/usr/local/bin/sqlite3 testdb < /tmp/tmp.OTS4vdIPyZ/1435.sql
/usr/local/bin/sqlite3 -separator , testdb ".import data.csv test_tbl "
Error: near line 1: no such table: test_tbl
Run Time: real 0.000 user 0.000202 sys 0.000000
Run Time: real 0.007 user 0.000478 sys 0.000000
[sqlite💞ceacf3fb0808 (土 10月 26 01:08:34) ~/script_scratch/sqlite]$ll
total 24
-rwxrwxr-x. 1 sqlite sqlite  500 10月 25 23:06 data.csv
-rw-rw-r--. 1 sqlite sqlite  426 10月 26 01:08 log
-rwxr-xr-x. 1 root   root    105 10月 25 23:06 mk_data.sh
-rwxr-xr-x. 1 root   root    706 10月 26 01:08 mk_test_tbl.sh
-rw-r--r--. 1 sqlite sqlite 8192 10月 26 01:08 testdb
[sqlite💞ceacf3fb0808 (土 10月 26 01:09:04) ~/script_scratch/sqlite]$sqlite testdb
-- Loading resources from /home/sqlite/.sqliterc
SQLite version 3.30.0 2019-10-04 15:03:17
Enter ".help" for usage hints.
sqlite>>>select * from sqlite_master;
type        name        tbl_name    rootpage    sql                                                                                                                                              
----------  ----------  ----------  ----------  --------------------------------------------------------------------------------------------------------------------                             
table       test_tbl    test_tbl    2           CREATE TABLE test_tbl(	col1   text,col2   text,col3   text,col4   text,col5   text,col6   text,col7   text,col8   text,col9   text,col10   text	)
Run Time: real 0.000 user 0.000000 sys 0.000255
sqlite>>>.tables
test_tbl
sqlite>>>select * from test_tbl;
col1        col2        col3        col4        col5        col6        col7        col8        col9        col10     
----------  ----------  ----------  ----------  ----------  ----------  ----------  ----------  ----------  ----------
JQad        Awmd        HmsJ        Yctw        CARk        gYpX        fwET        kWxB        WnBI        nETN      
gFNb        gzOC        JRxK        BhGJ        lggL        aqfb        Rabv        vMYq        GAUC        bvgV      
bwtb        axyZ        omkO        fXem        TSaJ        PMOO        YuTs        KGQn        HeyA        UIvV      
QAvI        njRe        eXpr        uUqS        UMuh        IsGv        rFgm        DOEe        qDHm        WabL      
GmDz        DRIU        nxbg        oyZy        inEJ        PiWu        ZAXD        sfRI        VdAM        YIsQ      
Zcmh        RofA        dziO        mKbj        ppIO        TorD        iTFi        vTLM        Fxwo        IAAX      
zRDr        eHWu        AkiO        wIkL        qtEN        LNqb        FtRO        ztRh        ilAZ        cxwn      
JXzV        Mylx        GsBP        duTO        LTXz        fIKe        byok        FnkS        gCBS        oFXE      
pZAV        LSxY        dMXK        OJAv        HHlq        lzAU        FzgX        BKIP        QslR        epdC      
HIdg        MpxC        WSou        YjDq        VZpM        saeN        wCLV        WqAf        hMnH        xyyJ      
Run Time: real 0.000 user 0.000132 sys 0.000000
```
