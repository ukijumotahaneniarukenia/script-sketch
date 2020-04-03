#!/usr/bin/env python3

import os
import sys

suffix=".done"

def usage():
  filename=__file__
  usage="""
Usage:
IN:  {filename} test-nlp.txt test.tsv
OUT:

or

IN:  ls test* | grep -v done | {filename}
OUT:
""".format(filename=filename)

  print(usage)
  sys.exit(0)

def submain(file_list):
  for e in file_list:
    if os.path.exists(e+suffix) :
      os.remove(e+suffix)
    with open(e,mode='r') as rf:
      with open(e+suffix,mode='w') as wf:
        for ln in rf.readlines():
          if ln.strip() != "":
            wf.write(ln.strip()+"\n")

def main():
  try:
    if (len(sys.argv[1:]))==0:
      #パイプ経由引数の場合
      file_list=list(map(lambda x:x.strip(),sys.stdin.readlines()))
      submain(file_list)
    else:
      #コマンドライン経由引数の場合
      file_list=list(sys.argv[1:])
      submain(file_list)
  except KeyboardInterrupt:
    usage()

if __name__=="__main__":
  main()
