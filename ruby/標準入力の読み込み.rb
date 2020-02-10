#!/usr/local/bin/ruby

#$./標準入力の読み込み.rb aaa
#aaa
#コマンドライン引数
#$echo {a..c} | ./標準入力の読み込み.rb
#a b c
#パイプ経由引数
#$vi 標準入力の読み込み.rb
#$./標準入力の読み込み.rb
#Traceback (most recent call last):
#./標準入力の読み込み.rb:12:in `<main>': no data (RuntimeError)
#$vi 標準入力の読み込み.rb
#$./標準入力の読み込み.rb
#Traceback (most recent call last):
#./標準入力の読み込み.rb:12:in `<main>': 引数ないよ (RuntimeError)

#$cat src | ./標準入力の読み込み.rb
#a b c
#d e f
#パイプ経由引数
#$./標準入力の読み込み.rb src
#src
#コマンドライン引数
#$./標準入力の読み込み.rb $(cat src)
#a
#b
#c
#d
#e
#f
#コマンドライン引数
#$./標準入力の読み込み.rb "$(cat src)"
#a b c
#d e f
#コマンドライン引数

if ARGV.length > 0
    addresses = [ *ARGV ]
    puts addresses
    puts "コマンドライン引数"
elsif FileTest.pipe?(STDIN)
    addresses = STDIN.readlines.map { |line| line.chomp }
    puts addresses
    puts "パイプ経由引数"
else
    raise "引数ないよ"
end
