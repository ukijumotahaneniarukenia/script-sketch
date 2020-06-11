#https://gist.github.com/nashirox/38323d5b51063ede1d41

post = "さようなら"
pre = "halfＦｕｌｌ123１２３ひらがなｶﾀｶﾅﾀﾞカタカナダ"
p pre

pattern = "[０-９]+"
pre = pre.gsub(/#{pattern}/,post)
p pre

pattern = "[0-9]+"
pre = pre.gsub(/#{pattern}/,post)
p pre

pattern = "\\p{Hiragana}+"
pre = pre.gsub(/#{pattern}/,post)
p pre

pattern = "(?:\\p{Hiragana}|\\p{Katakana}|[ー－]|[一-龠々])+" #全角ひらがな、全角カタカナ、漢字（鬼車）
pre = pre.gsub(/#{pattern}/,post)
p pre
