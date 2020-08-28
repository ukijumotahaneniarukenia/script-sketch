```
$ dotnet add package UnicodeInformation --version 2.5.0



$ git clone https://github.com/GoldenCrystal/NetUnicodeInfo.git

$ cd NetUnicodeInfo


$ grep -A 1 ValueName System.Unicode/UnicodeCharInfo.cs|sed '/--/d' | sed -r 's/^\s+//g' | ruby -anle 'puts $F.join("@@@")' | xargs -n2 | grep -P '=>' | ruby -F'@@@' -anle 'puts $F[$F.find_index("=>")-1]'|sort


$ grep -A 1 ValueName System.Unicode/UnicodeCharInfo.cs|sed '/--/d' | sed -r 's/^\s+//g' | ruby -anle 'puts $F.join("@@@")' | xargs -n2 | grep -P '=>' | ruby -F'@@@' -anle 'puts $F[$F.find_index("=>")-1]'|sort|xargs -I@ echo 'Console.Write(charInfo.@);'

$ grep -A 1 ValueName System.Unicode/UnicodeCharInfo.cs|sed '/--/d' | sed -r 's/^\s+//g' | ruby -anle 'puts $F.join("@@@")' | xargs -n2 | grep -P '=>' | ruby -F'@@@' -anle 'puts $F[$F.find_index("=>")-1]'|sort|xargs -I@ bash -c "echo 'Console.Write(charInfo.@);';echo 'Console.Write(FS);'"
```
