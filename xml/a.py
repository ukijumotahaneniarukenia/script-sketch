#!/usr/bin/env python3

from xml.etree import ElementTree

tree = ElementTree.parse("in.kml")

#名前空間の再定義
ElementTree.register_namespace('', 'http://earth.google.com/kml/2.0')

for node in tree.findall(".//hoge:PolyStyle/hoge:color", namespaces={ 'hoge' : 'http://earth.google.com/kml/2.0' } ):
    # 内容書き換え
    node.text="AA001122"


tree.write("out.kml","UTF-8",True)
