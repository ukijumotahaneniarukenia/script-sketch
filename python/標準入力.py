#!/usr/local/bin/python3.7

#$seq 3 | ./標準入力.py
#https://codeday.me/jp/qa/20190124/156164.html
#https://note.nkmk.me/python-file-io-open-with/

#エラーハンドリング
#https://docs.python.org/ja/3/library/signal.html
#https://www.m3tech.blog/entry/python-snippets
import sys


def usage():
    usage="""
Usage:
$seq 2 | ./標準入力.py
start
['1', '2']
end
$seq 1 | ./標準入力.py
start
['1']
end
$./標準入力.py {a..c}
start
['a', 'b', 'c']
end
$./標準入力.py $(seq 2)
start
['1', '2']
end
$./標準入力.py "$(seq 2)"
start
['1\\n2']
end
$cat a | ./標準入力.py 
start
['1 2 3 4 5', '6 7 8 9 10']
end
$./標準入力.py $(cat a)
start
['1', '2', '3', '4', '5', '6', '7', '8', '9', '10']
end
$./標準入力.py "$(cat a)"
start
['1 2 3 4 5\\n6 7 8 9 10']
end

"""
    print(usage)
    post_process("end")
    sys.exit(1)

def pre_process(rsv_args):
    print(rsv_args)

def post_process(rsv_args):
    print(rsv_args)
    sys.exit(0)

def chk_args():
  try:
    if (len(sys.argv[1:]))==0:
      #パイプ経由引数の場合
      #改行を取り除く
      print(list(map(lambda x:x.strip(),sys.stdin.readlines())))
    else:
      #コマンドライン経由引数の場合
      #先頭要素のファイル名を除く
      print(sys.argv[1:])
  except KeyboardInterrupt:
    usage()

def main():
    chk_args()

if __name__=="__main__":
    pre_process("start")
    main()
    post_process("end")
