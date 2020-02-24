require 'active_support'
require 'active_support/core_ext'
ActiveSupport::XmlMini.backend = 'Nokogiri'

xml = <<EOM
<?xml version="1.0" encoding="UTF-8"?>
<items>
  <item id="123">
    <name>Andy</name>
    <age>21</age>
  </item>
  <item id="234">
    <name>Brian</name>
    <age>23</age>
  </item>
  <item id="345">
    <name>Charles</name>
    <age>19</age>
  </item>
</items>
EOM

json=Hash.from_xml(xml).to_json

puts json
