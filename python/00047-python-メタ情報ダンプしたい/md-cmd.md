# pydump
クラスのメソッド情報などを出力するコマンド


```
import pandas as pd
import inspect
from inspect import signature

#ファンクションのリスト
function_name_list=[ e[0] for e in inspect.getmembers(inspect,inspect.isfunction)]

#先頭から2文字がisで始まるものを抽出
list(filter(lambda e:e[0:2]=='is',function_name_list))


#行を全て出力 １兆行
pd.set_option('display.max_rows',10000000)

#行番号付与したリスト作成
class_name_list=[e for e in enumerate([ e[0] for e in inspect.getmembers(inspect,inspect.isclass)])] #クラスの名前リスト
class_object_list=[e for e in enumerate([ e[1] for e in inspect.getmembers(inspect,inspect.isclass)])] #クラスの名前に紐づくオブジェクトリスト

#フレーム化 結合キーは先頭文字が大文字じゃないとだめぽい
class_name_dataframe=pd.DataFrame(class_name_list,columns=['Id','class_name_list'])
class_object_dataframe=pd.DataFrame(class_object_list,columns=['Id','class_object_list'])

#横に結合
pd.merge(class_name_dataframe,class_object_dataframe, how="inner" ,on="Id")


#行番号付与したリスト作成
function_name_list=[e for e in enumerate([ e[0] for e in inspect.getmembers(inspect,inspect.isfunction)])] #ファンクションの名前リスト
function_object_list=[e for e in enumerate([ e[1] for e in inspect.getmembers(inspect,inspect.isfunction)])] #ファンクションの名前に紐づくオブジェクトリスト

#フレーム化 結合キーは先頭文字が大文字じゃないとだめぽい
function_name_dataframe=pd.DataFrame(function_name_list,columns=['Id','function_name_list'])
function_object_dataframe=pd.DataFrame(function_object_list,columns=['Id','function_object_list'])

#横に結合
pd.merge(function_name_dataframe,function_object_dataframe, how="inner" ,on="Id")


#行番号付与したリスト作成
method_name_list=[e for e in enumerate([ e[0] for e in inspect.getmembers(inspect,inspect.ismethod)])] #メソッドの名前リスト
method_object_list=[e for e in enumerate([ e[1] for e in inspect.getmembers(inspect,inspect.ismethod)])] #メソッドの名前に紐づくオブジェクトリスト

#フレーム化 結合キーは先頭文字が大文字じゃないとだめぽい
method_name_dataframe=pd.DataFrame(method_name_list,columns=['Id','method_name_list'])
method_object_dataframe=pd.DataFrame(method_object_list,columns=['Id','method_object_list'])

#横に結合
pd.merge(method_name_dataframe,method_object_dataframe, how="inner" ,on="Id")


#行番号をキーにしたハッシュを作成
class_name_dict=dict([e for e in enumerate([ e[0] for e in inspect.getmembers(inspect,inspect.isclass)])])

#フレーム化 結合キーは先頭文字が大文字じゃないとだめぽい
class_name_dataframe_key=pd.DataFrame(list(class_name_dict.keys()),columns=['Id'])
class_name_dataframe_value=pd.DataFrame.from_dict(class_name_dict,orient='index',columns=['class_name_list'])

class_name_dataframe=pd.concat([class_name_dataframe_key, class_name_dataframe_value.reindex(class_name_dataframe_key.index)], axis=1)


#詳細な情報も取得

#行番号をキーにしたハッシュを作成
function_name_list=[e for e in enumerate([ e[0] for e in inspect.getmembers(inspect,inspect.isfunction)])] #ファンクションの名前リスト
function_args_list=[e for e in enumerate([ list(signature(e[1]).parameters) for e in inspect.getmembers(inspect,inspect.isfunction)])]

#フレーム化 結合キーは先頭文字が大文字じゃないとだめぽい
function_name_dataframe=pd.DataFrame(function_name_list,columns=['Id','function_name_list'])
function_args_dataframe=pd.DataFrame(function_args_list,columns=['Id','function_args_list'])

#横に結合
pd.merge(function_name_dataframe,function_args_dataframe, how="inner" ,on="Id")

```
