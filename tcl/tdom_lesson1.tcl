package require tdom

#属性がタグ名に含まれない
#タグで一意にならない
#json変換する際はタグで一意にしないと欠損する
#set xml {<agents>
#    <agent id="007">
#        <name type="first">James</name>
#        <name type="last">Bond</name>
#        <age>Still attractive</age>
#        <sex>Male</sex>
#    </agent>
#    <agent id="013">
#        <name type="first">Austin</name>
#        <name type="last">Powers</name>
#        <age>Depends on your timeline</age>
#        <sex>Yes, please</sex>
#    </agent>
#</agents>}

#set dom [dom parse $xml]
#puts $xml
#puts [$dom asJSON]

set xml_tag_uniq {<agents>
    <agent-id-007>
        <name-type-first>James</name-type-first>
        <name-type-last>Bond</name-type-last>
        <age>Still attractive</age>
        <sex>Male</sex>
    </agent-id-007>
    <agent-id-013>
        <name-type-first>Austin</name-type-first>
        <name-type-last>Powers</name-type-last>
        <age>Depends on your timeline</age>
        <sex>Yes, please</sex>
    </agent-id-013>
</agents>}

set dom [dom parse $xml_tag_uniq]
puts $xml_tag_uniq
puts [$dom asJSON]
