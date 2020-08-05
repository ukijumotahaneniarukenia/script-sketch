import urllib.error
import urllib.request

import socket
import socks
from bs4 import BeautifulSoup

#ダミーのIPが返却されてきた
#https://qiita.com/Michinosuke/items/81f4b893bb1406162ab3
socks.set_default_proxy(socks.PROXY_TYPE_SOCKS5, '127.0.0.1', 9050)
socket.socket = socks.socksocket


# URLからHTMLを返す
def fetch_html(url):
    res = urllib.request.urlopen(url)
    return BeautifulSoup(res, 'html.parser')


# 現在のグローバルIPアドレスを返す
def show_global_ip():
    html = fetch_html('http://checkip.dyndns.com/')
    return html.body.text.split(': ')[1]


# Torを使っているかを返す
def is_tor():
    html = fetch_html('https://check.torproject.org/')
    return html.find('h1')['class'][0] != 'off'


print('You are using tor.' if is_tor() else 'You are not using tor.')
print('Current IP address is ' + show_global_ip())
