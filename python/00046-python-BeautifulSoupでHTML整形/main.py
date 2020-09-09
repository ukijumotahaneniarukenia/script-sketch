#!/usr/bin/env python3

import bs4
import csv

# スクレイピング対象のhtmlファイルからリンク(aタグ)テキストを抽出
#soup = bs4.BeautifulSoup(open('sample.html'), 'html.parser')

# スクレイピング対象のhtmlファイルからリンク(aタグ)テキストを抽出
soup = bs4.BeautifulSoup(open('test-big.html'), 'html.parser')
#links = [link.text for link in soup.find_all('a')]
#
#print(links)
#https://www.it-swarm.dev/ja/python/beautifulsoup%E3%81%A7%E3%82%B9%E3%82%AF%E3%83%AA%E3%83%97%E3%83%88%E3%82%BF%E3%82%B0%E3%82%92%E5%89%8A%E9%99%A4%E3%81%A7%E3%81%8D%E3%81%BE%E3%81%99%E3%81%8B%EF%BC%9F/971300784/
soup.i.decompose()

aaa = [x.extract() for x in soup.findAll('script')]

print(aaa)



# リンクテキストをCSVファイルに出力。ファイルがない場合は新規作成
#with open("output_sample.csv", "w") as f:
#    writer = csv.writer(f, lineterminator='\n')
#    writer.writerow(links)
