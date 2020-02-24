#!/usr/bin/env ruby

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
