require 'active_support/core_ext'
require 'open-uri'

hash = Hash.from_xml open('http://hoge.com/ext/data.xml').read
json = hash.to_json
