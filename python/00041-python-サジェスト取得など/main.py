#!/usr/bin/env python3
import time
from selenium import webdriver
from selenium.webdriver.chrome.options import Options

import sys
import os

import re
import datetime

root_url_xpath_dict={
        'https://goodkeyword.net/search.php?type=appsuggest&formquery=':'/html/body/div[7]/div[1]/div[4]/div/textarea'
        ,'https://goodkeyword.net/search.php?type=rakutensuggest&formquery=':'/html/body/div[7]/div[1]/div[4]/div/textarea'
        ,'https://goodkeyword.net/search.php?type=googlesuggest&formquery=':'/html/body/div[7]/div[1]/div[4]/div/textarea'
        ,'https://goodkeyword.net/search.php?formquery=':'/html/body/div[7]/div[3]/div[2]/div/div[1]/div/textarea'
        }

search_keyword_joiner="%20"

suffix=".txt"

ors="\n"

ofs="-"

prefix="suggest"

dtm=datetime.datetime.today().strftime("%Y-%m-%dT%H-%M-%S")


def usage():
  filename=__file__
  usage="""
Usage:

  PRE: pip3 install --user selenium

       which chrome
       /usr/local/src/chrome-linux/chrome

       which chromedriver
       /usr/local/src/chromedriver_linux64/chromedriver

  CMD: time echo みかん | {filename}

""".format(filename=filename)

  print(usage)
  sys.exit(0)

def get_suggest(search_keyword_list):

  search_keyword=search_keyword_joiner.join(*search_keyword_list)

  options = Options()
  options.binary_location = '/usr/local/src/chrome-linux/chrome'
  options.add_argument('--headless')
  driver = webdriver.Chrome(options=options)

  for root_url,xpath in root_url_xpath_dict.items():

    search_engine_name_list=re.findall(r'(?<=type=).*?(?=\&)', root_url)

    if len(search_engine_name_list)==0:
        search_engine_name = "googlebingsuggest"
    else:
        search_engine_name = search_engine_name_list[0]

    output_file_name=prefix+ofs+search_keyword+ofs+search_engine_name+ofs+dtm+suffix

    driver.get(root_url+search_keyword)

    time.sleep(10)

    txt=driver.find_element_by_xpath(xpath).text

    with open(output_file_name, mode='w') as f:
      f.write(txt)
      f.write(ors)

  driver.quit()

def main():
  try:
    if (len(sys.argv[1:]))==0:
      #パイプ経由引数の場合
      args_via_pipe=list(map(lambda x:x.strip().split(),sys.stdin.readlines()));
      get_suggest(args_via_pipe)
    else:
      #コマンドライン経由引数の場合
      usage()
  except KeyboardInterrupt:
    usage()

if __name__=="__main__":
  main()
