#!/usr/bin/env python3
import sys;
import os

def usage():
  filename=__file__
  usage="""
Usage:
IN:  printf "%s\\n" 駆け出し エンジニア うんこ もりもり もりおうがい 3 | xargs -n1 | {filename}
OUT:

or

IN:  printf "%s\\n" 駆け出し エンジニア うんこ もりもり もりおうがい 3 | xargs -n3 | {filename}
OUT:
""".format(filename=filename)

  print(usage)
  sys.exit(0)

def pre_process(tgt):
  #引数リストを設定
  ngram=int(tgt[len(tgt)-1][len(tgt[len(tgt)-1])-1])
  if not str(ngram).isdigit() :
    #数字でない場合
    usage()
  if (len(sys.argv[1:]))!=0:
    #コマンドライン引数がある場合
    usage()
  #引数リストを除外
  lasttgt=tgt[len(tgt)-1]
  lasttgt=tgt[len(tgt)-1]
  del lasttgt[len(lasttgt)-1]
  return (ngram,tgt)

def sub_process(ngram,tgt):
  for row,ln in enumerate(tgt):
    for col in range(len(ln)):
      for idx in range(len(ln[col])):
        print(row,col,ln[col][idx:idx+ngram],ln[col])

def main():
  try:
    if (len(sys.argv[1:]))==0:
      #パイプ経由引数の場合
      tgt=list(map(lambda x:x.strip().split(),sys.stdin.readlines()));
      (ngram,tgt)=pre_process(tgt)
      sub_process(ngram,tgt)
    else:
      #コマンドライン経由引数の場合
      usage()
  except KeyboardInterrupt:
    usage()

if __name__=="__main__":
  main()
