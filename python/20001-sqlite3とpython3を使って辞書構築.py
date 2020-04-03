#!/usr/bin/env python3

import sqlite3
import sys
import os

def usage():
  filename=__file__
  usage="""
Usage:
IN:  echo pages.db 20001-sqlite3とpython3を使って辞書構築.sql NTT_DoCoMo | {filename}
OUT:
""".format(filename=filename)

  print(usage)
  sys.exit(0)

def XXX(args):
  tgt_db=args[0]
  script_filepath=args[1]
  search_word=args[2]
  conn=sqlite3.connect(tgt_db)
  with open(script_filepath) as f:
    sql_txt=f.read()
  dict_tbl=dict(conn.execute(sql_txt).fetchall())
  return dict_tbl[search_word]
  conn.close()

def main():
  rt=""
  try:
    if (len(sys.argv[1:]))==0:
      #パイプ経由引数の場合
      args=list(map(lambda x:x.strip(),sys.stdin.readlines()))[0].split()
      rt=XXX(args)
      print(rt)
    else:
      #コマンドライン経由引数の場合
      usage()
  except KeyboardInterrupt:
    usage()

if __name__=="__main__":
  main()
