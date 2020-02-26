#!/usr/bin/env ruby

def usage
  puts <<~EOF
Usage:
  IN :
  OUT:
EOF
  return 0
end

if ARGV.length > 0
  addresses = [ *ARGV ]
  puts addresses[1]
  puts "コマンドライン引数"
elsif FileTest.pipe?(STDIN)
  addresses = STDIN.readlines.map { |line| line.chomp }
  puts addresses
  puts "パイプ経由引数"
else
  usage
end
