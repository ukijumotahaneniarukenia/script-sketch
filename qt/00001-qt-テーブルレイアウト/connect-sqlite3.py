#!/usr/bin/env python3

import sqlite3
import sys
import os

def usage():
  filename=__file__
  usage="""
Usage:
IN:  echo testdb test.sql JJJ | {filename}
OUT:
""".format(filename=filename)

  print(usage)
  sys.exit(0)

def XXX(args):
    rt=[];
    tgt_db='testdb'
    script_filepath='test.sql'
    conn=sqlite3.connect(tgt_db)
    with open(script_filepath) as f:
      sql_txt=f.read()
    row_cnt=len(conn.execute(sql_txt).fetchall())
    #for i,row in enumerate(conn.execute('select name from pragma_table_info(\'test_tbl\')').fetchall()):
    #    rt.append([row_cnt,i,row[0]])
    for i,row in enumerate(conn.execute(sql_txt).fetchall()):
      for j,dat in enumerate(row):
        rt.append([i,j,dat])
    conn.close()
    return rt

def XXXXXXXXXXXXXXXXXXXX(args):
  tgt_db=args[0]
  script_filepath=args[1]
  search_word=args[2]
  conn=sqlite3.connect(tgt_db)
  with open(script_filepath) as f:
    sql_txt=f.read()
  row_cnt=len(conn.execute(sql_txt).fetchall())
  col_cnt=len(conn.execute(sql_txt).fetchall()[0])
  for i,row in enumerate(conn.execute('select name from PRAGMA_table_info(\'test_tbl\')').fetchall()):
      print(i,row[0])
  print(row_cnt,col_cnt)
  #for i,row in enumerate(conn.execute(sql_txt).fetchall()):
  #  for j,col in enumerate(row):
  #    print(i,j,col)
  conn.close()

def main():
  rt=""
  try:
    if (len(sys.argv[1:]))==0:
      #パイプ経由引数の場合
      args=list(map(lambda x:x.strip(),sys.stdin.readlines()))[0].split()
      rt=XXX(args)
      print(rt)
      print(min(rt),max(rt))
    else:
      #コマンドライン経由引数の場合
      usage()
  except KeyboardInterrupt:
    usage()

if __name__=="__main__":
  main()
