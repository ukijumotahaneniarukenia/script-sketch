#!/usr/bin/env python3
import time

import sys
import os

import re
import datetime

import shutil

import getpass

root_url_xpath_dict = {
    'https://www.gskw.net/': {
        '/html/body/div[2]/section/section/div[1]/div[2]/form/label/input': '検索ボックス'
        , '/html/body/div[2]/section/section/div[1]/div[2]/form/input[2]': '検索ボタン'
        , '/html/body/div[2]/section/section/div[3]/form/div/input':'csv取得ボタン'
    }
}

search_keyword_joiner = "%20"

suffix = ".csv"

ors = "\n"

ofs = "-"

prefix = "suggest"

dtm = datetime.datetime.today().strftime("%Y-%m-%dT%H-%M-%S")

user = getpass.getuser()

src=os.path.expanduser('~'+user)+'/'+'Downloads'+'/'+'keyword.csv'

dst=os.getcwd()

wait_time_seconds=45

def usage():
    filename = re.sub(".*/", "", __file__)
    usage_message = """
Usage:

  PRE: pip3 install --user selenium

       which chrome
       /usr/local/src/chrome-linux/chrome

       which chromedriver
       /usr/local/src/chromedriver_linux64/chromedriver

  CMD: time echo みかん | {filename}

""".format(filename=filename)

    print(usage_message)
    sys.exit(0)

def get_suggest(search_keyword_list):

    from selenium import webdriver
    from selenium.webdriver.chrome.options import Options

    search_keyword = search_keyword_joiner.join(*search_keyword_list)

    options = webdriver.ChromeOptions()
    options.add_argument('--headless')
    options.add_argument('/usr/local/src/chromedriver_linux64/chromedriver')
    options.add_argument('/usr/local/src/chrome-linux/chrome')
    driver = webdriver.Chrome(options=options)

    print(search_keyword)

    for root_url, xpath_dict in root_url_xpath_dict.items():

        site_name = "_".join(re.findall(r'(?<=//).*?(?=/)', root_url)[0].split(".")[::-1])

        output_file_name = dst + '/' + prefix + ofs + site_name + ofs + search_keyword + ofs + dtm + suffix

        print(output_file_name)

        driver.get(root_url)

        time.sleep(wait_time_seconds) #TODO レンダラ完了するまで待つ

        print("初期表示が完了しました")

        for xpath,xpath_description in xpath_dict.items():
            if xpath_description == "検索ボックス":
                search_box=driver.find_element_by_xpath(xpath)
                search_box.send_keys(search_keyword)
            if xpath_description == "検索ボタン":
                search_button=driver.find_element_by_xpath(xpath)
                search_button.click()

                print(xpath_description+"を押下しました")

                time.sleep(wait_time_seconds) #TODO レスポンス返ってくるまで待つ

                print("レンダリングが完了しました")

            if xpath_description == "csv取得ボタン":
                search_button=driver.find_element_by_xpath(xpath)
                search_button.click()

                print(xpath_description+"を押下しました")

                time.sleep(wait_time_seconds) #TODO ダウンロードが完了するまで待つ

                print("ダウンロードが完了しました")

    shutil.copy2(src,output_file_name)

    os.remove(src)

    driver.quit()

def main():
    try:
        if (len(sys.argv[1:])) == 0:
            # パイプ経由引数の場合
            args_via_pipe = list(map(lambda x: x.strip().split(), sys.stdin.readlines()))
            get_suggest(args_via_pipe)
        else:
            # コマンドライン経由引数の場合
            usage()
    except KeyboardInterrupt:
        usage()

if __name__ == "__main__":
    main()
