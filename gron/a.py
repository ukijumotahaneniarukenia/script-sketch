import sys
from os import path
import pandas as pd
import re

def usage():
  usage='''
Usage:
'''
  print(usage)
  sys.exit(0)

def cnv_tgt_file_to_str(tgt_file_path):
  with open('./'+tgt_file_path) as f:
    tgt_txt=f.read()
    return '\n'.join(filter(None,list(map(lambda x:x.strip(),tgt_txt.split('\n')))))#末尾の空白行の削除

def cnv_tgt_file_to_data_frame(tgt_file_path):
    return pd.read_table(tgt_file_path,header=None).rename(columns={0:"tgt"})#単一列で読込

def cleansing_data_frame(rcv_df):
    #各列に対してレコードごとに複数の正規表現パタンを繰り返し適用したい
    grp=rcv_df.apply(lambda x: re.sub('json\[([0-9]{1,}).*', r'\1', str(x['tgt'])), axis=1)
    col=rcv_df.apply(lambda x: re.sub('(.* )=', r'\1', str(x['tgt'])), axis=1)
    #https://note.nkmk.me/python-pandas-dataframe-series-conversion/
    return pd.DataFrame({'grp':grp,'col':col})

def main():
  try:
    if (len(sys.argv[1:]))==0:
      #パイプ経由引数の場合
      stdin=list(map(lambda x:x.strip(),sys.stdin.readlines()))#末尾の改行文字の削除
      #print(cnv_tgt_file_to_str(stdin[0]))
      tgt_df=cnv_tgt_file_to_data_frame(stdin[0])
      print(cleansing_data_frame(tgt_df))
    else:
      #コマンドライン経由引数の場合
      stdin=sys.argv[1:]
      #print(cnv_tgt_file_to_str(stdin[0]))
      tgt_df=cnv_tgt_file_to_data_frame(stdin[0])
      print(cleansing_data_frame(tgt_df))
  except KeyboardInterrupt:
    usage()

main()
