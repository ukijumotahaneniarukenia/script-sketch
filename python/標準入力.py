#!/usr/bin/env python3
import sys

def usage():
  filename=__file__
  usage="""
Usage:
IN:  echo うんこ | xargs -n1 | {filename}
OUT:
""".format(filename=filename)

  print(usage)
  sys.exit(0)

def mock(args):
  for e in args:
      print(e)

def main():
  try:
    if (len(sys.argv[1:]))==0:#パイプ経由引数の場合
      #print(list(map(lambda x:x.strip(),sys.stdin.readlines())))
      args=list(map(lambda x:x.strip(),sys.stdin.readlines()))[0].split()
      mock(args)
    else:#コマンドライン経由引数の場合
      usage()
  except KeyboardInterrupt:
    usage()

if __name__=="__main__":
  main()
  sys.exit(0)
