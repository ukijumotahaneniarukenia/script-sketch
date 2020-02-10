import sqlite3
import sys
from os import path

#TODOヒアドキュメントで変数を使用したい
def usage():
  usage='''
Usage:
  $python3 20001-sqlite3とpython3を使って辞書構築.py pages.db 20001-sqlite3とpython3を使って辞書構築.sql NTT_DoCoMo
  $echo pages.db 20001-sqlite3とpython3を使って辞書構築.sql NTT_DoCoMo | python3 20001-sqlite3とpython3を使って辞書構築.py
'''
  print(usage)
  sys.exit(0)

def read_sql_text(sql_file_path):
  with open('./'+sql_file_path) as f:
    sql_txt=f.read()
    return sql_txt

def create_conn(tgt_db):
  return (sqlite3.connect(tgt_db))

def create_dict(conn,sql_txt):
  return (dict(conn.execute(sql_txt).fetchall()))

def select_tgt(conn,tgt_dict,tgt_str):
  return [(conn),(tgt_dict[tgt_str])]

def destroy_conn(conn):
  conn.close()

#TODO複数の検索ワードに対応したい
def main():
  rt=""
  try:
    if (len(sys.argv[1:]))==0:
      #パイプ経由引数の場合
      #改行を取り除く
      stdin=list(map(lambda x:x.strip(),sys.stdin.readlines()))[0].split()
      rt=select_tgt(create_conn(stdin[0]),create_dict(create_conn(stdin[0]),read_sql_text(stdin[1])),stdin[2])
    else:
      #コマンドライン経由引数の場合
      #先頭要素のファイル名を除く
      stdin=sys.argv[1:]
      rt=select_tgt(create_conn(stdin[0]),create_dict(create_conn(stdin[0]),read_sql_text(stdin[1])),stdin[2])
  except KeyboardInterrupt:
    usage()
  else:
    return rt[1]
  finally:
    destroy_conn(rt[0])

print(main())
