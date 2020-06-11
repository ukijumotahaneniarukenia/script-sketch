input = "caffelatte"

#ptn=""
ptn="\\B"

search_word_list = input.split(/#{ptn}/)

reg = search_word_list.map {|s| Regexp.new(s)}

p reg #[/a/, /c/, /e/, /f/, /l/, /t/]

p input.scan(Regexp.union(*reg)) #["c", "a", "f", "f", "e", "l", "a", "t", "t", "e"]

p input.scan(Regexp.union(*reg)).group_by(& :itself).map{|k,v| [k, v.size]}.to_h
