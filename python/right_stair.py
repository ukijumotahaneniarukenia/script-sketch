#!/usr/local/bin/python3.7
import sys

def usage():
    usage='''
Usage:
$echo \'\x5c\x5cU0001f4a\'{1..9} | xargs -n1 | ./right_stair.py 
$./right_stair.py \'\x5cU0001f4a\'{1..9}
'''
    print(usage)
    sys.exit(1)

def right_stair(rsv_args):
    for ind in range(len(rsv_args)):
        ele=rsv_args[len(rsv_args)-1]
        del rsv_args[len(rsv_args)-1]
        rsv_args.insert(0,ele)
        print(rsv_args)

def main():
  try:
    if (len(sys.argv[1:]))==0:
      #パイプ経由引数の場合
      #改行を取り除く
      stdin=list(map(lambda x:x.strip(),sys.stdin.readlines()))
      #ユニコード文字列をバイト型に変換してユニコードを文字に変換
      init_args=list(map(lambda x:x.encode().decode('unicode-escape'),stdin))
      right_stair(init_args)
    else:
      #コマンドライン経由引数の場合
      #先頭要素のファイル名を除く
      stdin=sys.argv[1:]
      #ユニコード文字列をバイト型に変換してユニコードを文字に変換
      init_args=list(map(lambda x:x.encode().decode('unicode-escape'),stdin))
      right_stair(init_args)
  except KeyboardInterrupt:
    usage()

main()
