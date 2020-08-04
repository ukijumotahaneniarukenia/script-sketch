#!/usr/bin/env python3
import time
from selenium import webdriver
from selenium.webdriver.chrome.options import Options

import sys
import os

import re
import datetime

root_url_xpath_dict = {
    'https://www.gskw.net/': {
        '/html/body/div[2]/section/section/div[1]/div[2]/form/label/input': '検索ボックス'
        , '/html/body/div[2]/section/section/div[1]/div[2]/form/input[2]': '検索ボタン'
    }
}

search_keyword_joiner = "%20"

suffix = ".txt"

ors = "\n"

ofs = "-"

prefix = "suggest"

dtm = datetime.datetime.today().strftime("%Y-%m-%dT%H-%M-%S")


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
    search_keyword = search_keyword_joiner.join(*search_keyword_list)

    options = webdriver.ChromeOptions()
    options.add_argument('--headless')
    # options.add_argument('/usr/local/src/chromedriver_linux64/chromedriver')
    # options.add_argument('/usr/local/src/chrome-linux/chrome')
    driver = webdriver.Chrome(options=options)

    print(search_keyword)

    # for root_url, xpath_dict in root_url_xpath_dict.items():
    #     site_name = "_".join(re.findall(r'(?<=//).*?(?=/)', root_url)[0].split(".")[::-1])
    #
    #     output_file_name = prefix + ofs + root_url + ofs + search_keyword + site_name + ofs + dtm + suffix
    #
    #     driver.get(root_url)
    #
    #     # for xpath in xpath_dict.keys():
    #     #  print(root_url,xpath)
    #
    #     time.sleep(10)
    #
    #     # txt=driver.find_element_by_xpath(xpath).text
    #
    #     # with open(output_file_name, mode='w') as f:
    #     #  f.write(txt)
    #     #  f.write(ors)

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
