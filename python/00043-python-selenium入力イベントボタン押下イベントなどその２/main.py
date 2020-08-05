#!/usr/bin/env python3
import time

import sys
import os

import re
import datetime

import shutil

import getpass

search_box_name="検索ボックス"
search_button_name="検索ボタン"
search_result_name="検索結果表示エリア"
radio_button_name="ラジオボタン"

root_url_xpath_dict = {
    'https://kouho.jp/':[
        {
          radio_button_name+'-Amazonサジェスト':'/html/body/div/main/div[1]/div/div[2]/form/label[1]'
          , radio_button_name+'-楽天サジェスト':'/html/body/div/main/div[1]/div/div[2]/form/label[2]'
          , radio_button_name+'-Bingサジェスト':'/html/body/div/main/div[1]/div/div[2]/form/label[3]'
          , radio_button_name+'-はてな連想語':'/html/body/div/main/div[1]/div/div[2]/form/label[4]'
          , radio_button_name+'-Twitter共起語':'/html/body/div/main/div[1]/div/div[2]/form/label[5]'
        }
        ,{
          search_box_name:'/html/body/div/main/div[1]/div/div[2]/form/input[6]'
          ,search_button_name:'/html/body/div/main/div[1]/div/div[2]/form/button'
          ,search_result_name:'/html/body/div/main/div[1]/div/div[3]/div/textarea'
        }
    ]
}

search_keyword_joiner = "%20"

suffix = ".txt"

ors = "\n"

ofs = "-"

prefix = "suggest"

dtm = datetime.datetime.today().strftime("%Y-%m-%dT%H-%M-%S")

wait_time_seconds=20

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

    for root_url, xpath_list in root_url_xpath_dict.items():

        site_name = "_".join(re.findall(r'(?<=//).*?(?=/)', root_url)[0].split(".")[::-1])

        driver.get(root_url)

        time.sleep(wait_time_seconds) #TODO レンダラ完了するまで待つ

        print("初期表示が完了しました")

        search_result=""
        output_file_name=""

        for non_search_event_description,non_search_event_xpath in xpath_list[0].items():

            if non_search_event_description.find(radio_button_name) != -1:
                radio_button=driver.find_element_by_xpath(non_search_event_xpath)
                radio_button.click()

                output_file_name=prefix+ofs+site_name+ofs+re.sub(radio_button_name+ofs,"",non_search_event_description)+ofs+search_keyword+ofs+dtm+suffix

                print(radio_button_name + "をクリックしました")

            print(root_url,output_file_name)

            search_box=driver.find_element_by_xpath(xpath_list[1][search_box_name])
            search_box.clear()
            search_box.send_keys(search_keyword)

            print(search_box_name + "に検索キーワードを入力しました")

            search_button=driver.find_element_by_xpath(xpath_list[1][search_button_name])
            search_button.click()

            print(search_button_name + "を押下しました")

            time.sleep(wait_time_seconds) #TODO レスポンス返ってくるまで待つ

            print("レンダリングが完了しました")

            search_result=driver.find_element_by_xpath(xpath_list[1][search_result_name]).text

            if len(search_result)==0:
              with open(output_file_name, mode='w') as f:
                  f.write(search_result)
            else:
              with open(output_file_name, mode='w') as f:
                  f.write(search_result)
                  f.write(ors)

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
