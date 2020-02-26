#!/usr/bin/env ruby

def usage
  f = File.basename(__FILE__)
  puts <<~EOF
Usage:
  IN :  printf "%s\\n" {a..j} | xargs -n3 | ./#{f} or ./#{f} "$(printf "%s\\n" {a..j} | xargs -n3)"
  OUT:
EOF
  return 0
end

if ARGV.length > 0
  cmd_args = [ *ARGV ]
  stdin = cmd_args[0].split(/\n/)
  puts stdin
  puts "コマンドライン引数"
elsif FileTest.pipe?(STDIN)
  pipe_args = STDIN.readlines.map { |line| line.chomp }
  puts pipe_args
  puts "パイプ経由引数"
else
  usage
end
