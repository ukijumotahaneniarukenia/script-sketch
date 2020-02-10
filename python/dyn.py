#!/usr/local/bin/python3.7

import pandas as pd
import random as rd
import datetime as dt
from itertools import product

#バッファーデータフレーム宣言
tmp_concat=pd.DataFrame({'tbl_name':[],'col_name':[]});

for i in ["rd","dt"]:
    #リスト変数名:tmp_list
    print('tmp_list='+str(eval('[x for x in dir(eval("'+i+'")) if x.startswith("__") ]')));
    print(exec('tmp_list='+str(eval('[x for x in dir(eval("'+i+'")) if x.startswith("__") ]'))));
    print(len(tmp_list))
    #一時カラム変数名:tmp_col_ライブラリ別名
    print('tmp_col_'+i+'=pd.DataFrame({\'id\':[i for i in range(len(tmp_list))],\'col_name\':'+str(eval('[x for x in dir(eval("'+i+'")) if x.startswith("__") ]'))+'})');
    print(exec('tmp_col_'+i+'=pd.DataFrame({\'id\':[i for i in range(len(tmp_list))],\'col_name\':'+str(eval('[x for x in dir(eval("'+i+'")) if x.startswith("__") ]'))+'})'));
    #一時テーブル変数名:tmp_tbl_ライブラリ別名
    print('tmp_tbl_'+i+'=pd.DataFrame({\'id\':[len([\''+i+'\'])],\'tbl_name\':\''+i+'\'})');
    print(exec('tmp_tbl_'+i+'=pd.DataFrame({\'id\':[len([\''+i+'\'])],\'tbl_name\':\''+i+'\'})'));
    print('pd.DataFrame(list(product('+'tmp_tbl_'+i+'[\'tbl_name\'],'+'tmp_col_'+i+'[\'col_name\'])),columns=[\'tbl_name\',\'col_name\'])');
    #テーブル変数名:tbl_ライブラリ別名
    print('tbl_'+i+'='+'pd.DataFrame(list(product('+'tmp_tbl_'+i+'[\'tbl_name\'],'+'tmp_col_'+i+'[\'col_name\'])),columns=[\'tbl_name\',\'col_name\'])');
    print(exec('tbl_'+i+'='+'pd.DataFrame(list(product('+'tmp_tbl_'+i+'[\'tbl_name\'],'+'tmp_col_'+i+'[\'col_name\'])),columns=[\'tbl_name\',\'col_name\'])'));
    #print(eval('tbl_'+i));
    #ライブラリ情報テーブルの作成
    print('tmp_concat=pd.concat([tmp_concat,'+'tbl_'+i+'])');
    print(exec('tmp_concat=pd.concat([tmp_concat,'+'tbl_'+i+'])'));
    print(eval('tmp_concat'));
    print("データフレーム"+"tbl_"+i+"の作成が完了 しました。😆");

#tmp_concatデータフレームをライブラリテーブルに登録
print(('lib_tbl=tmp_concat'));
print(exec('lib_tbl=tmp_concat'));
print(eval('lib_tbl'));
