#!/usr/bin/env python3
import time

import sys
import os

import re
import datetime

import shutil

import getpass

from selenium import webdriver
from selenium.webdriver.chrome.options import Options

SITE_NAME = 'サイト名'

TITLE_NAME = 'タイトル名'

UPDATE_DATE = '更新日付'

UPDATE_TIME = '更新時分'

UPDATE_DATE_TIME = '更新日時'

#インデックス位置が変化するDOMのうち一つ上のDOMを選択するようにする

#取得したい項目単位に正規表現を設定してもいいか特に日付関連項目

#ページャがあるかないか

#ファイルから読み込むようにする
#２次元配列をdict in dict listに変更する

SITE_URL_XPATH_DICT_LIST = {
    'https://www.nikkei.com/technology/ai/': [
                               {
                                   SITE_NAME : '日経新聞'
                               }
                               ,{
                                   TITLE_NAME : '/html/body/div[9]/div/div/div/div[3]/div[2]/h3/a/span'
                               }
                               ,{
                                   UPDATE_DATE : '/html/body/div[9]/div/div/div/div[3]/h2[1]/span'
                               }
                               ,{
                                   UPDATE_TIME : '/html/body/div[9]/div/div/div/div[3]/div[2]/div[2]/span'
                               }
                             ]
    ,'https://mainichi.jp/technology/': [
                               {
                                   SITE_NAME : '毎日新聞'
                               }
                               ,{
                                   TITLE_NAME : '/html/body/div[2]/div[1]/div[1]/div/div[2]/ul/li[1]/article/a/h2'
                               }
                               ,{
                                   UPDATE_DATE_TIME : '/html/body/div[2]/div[1]/div[1]/div/div[2]/ul/li[1]/article/time'
                                }
                             ]
}

PREFIX = 'category'
SUFFIX = '.tsv'

FILE_NAME = 'crawl-result'

ORS = '\n'

OFS = '-'

DTM = datetime.datetime.today().strftime('%Y-%m-%dT%H-%M-%S')

DST = os.getcwd() #実行ディレクトリ

WAIT_TIME_SECONDS=45

def usage():
    filename = re.sub('.*/', '', __file__)
    usage_message = '''
Usage:
  PRE: pip3 install --user selenium

       which chrome
       /usr/local/src/chrome-linux/chrome

       which chromedriver
       /usr/local/src/chromedriver_linux64/chromedriver

'''.format(filename=filename)

    print(usage_message)
    sys.exit(0)

def main():

    #preprocess
    options = webdriver.ChromeOptions()
#    options.add_argument('--headless') #コマンドライン引数上でデバッグモードとして指定できるようにする
    options.add_argument('/usr/local/src/chromedriver_linux64/chromedriver')
    options.add_argument('/usr/local/src/chrome-linux/chrome')
    driver = webdriver.Chrome(options=options)

    for site_url,xpath_dict_list in SITE_URL_XPATH_DICT_LIST.items():

        site_name = '_'.join(re.findall(r'(?<=//).*?(?=/)', site_url)[0].split('.')[::-1])

        output_file_name = DST + '/' + PREFIX + OFS + site_name + OFS + DTM + SUFFIX

        print(output_file_name)

        for xpath_dict in xpath_dict_list:

            print(site_url)

            driver.get(site_url)

            time.sleep(WAIT_TIME_SECONDS) #レンダラ完了するまで待つ

            if SITE_NAME in xpath_dict:

                #各取得内容に応じて関数化して前処理メイン処理後処理に工程を分ける

                pass


            if list(xpath_dict.keys())[0] == TITLE_NAME:

                #各取得内容に応じて関数化して前処理メイン処理後処理に工程を分ける

                pass


            if list(xpath_dict.keys())[0] == UPDATE_DATE:

                #各取得内容に応じて関数化して前処理メイン処理後処理に工程を分ける

                pass


            if list(xpath_dict.keys())[0] == UPDATE_TIME:

                #各取得内容に応じて関数化して前処理メイン処理後処理に工程を分ける

                pass

            if list(xpath_dict.keys())[0] == UPDATE_DATE_TIME:

                #各取得内容に応じて関数化して前処理メイン処理後処理に工程を分ける

                pass


            print(site_name,site_url,xpath_dict,list(xpath_dict.keys())[0],sep='\t')


            print('初期表示が完了しました')

    driver.quit()


if __name__ == '__main__':
    main()
