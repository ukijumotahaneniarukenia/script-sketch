#!/usr/bin/env ruby

def usage
  f = File.basename(__FILE__)
  puts <<~EOF
Usage:
  IN : echo test{,2}.csv | ./#{f} or ./#{f} 2
  OUT:
EOF
  return 0
end

def mock(ary)
  p ary[0]
  p "===="
  p ary[1]
  return 0
end

if ARGV.length > 0
  cmd_args = [ *ARGV ]
  mock(cmd_args)
elsif FileTest.pipe?(STDIN)
  n = STDIN.readlines.map {|e|e.split(/\s{1,}/)}
  pipe_args = n.flatten
  mock(pipe_args)
else
  usage
end
