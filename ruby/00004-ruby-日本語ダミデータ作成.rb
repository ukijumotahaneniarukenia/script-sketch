#!/usr/bin/env ruby

require 'faker'

Faker::Config.locale=:ja

#def usage
#  f = File.basename(__FILE__)
#  puts <<~EOF
#Usage:
#  IN : seq 10 | ./#{f} or ./#{f} 2
#  OUT:
#EOF
#  return 0
#end

def mock(ary)
  ary.map do|e|
    puts Faker::Lorem.sentence(word_count:e.to_i)
  end
end

if ARGV.length > 0
  cmd_args = [ *ARGV ]
  args = cmd_args[0].split(/\n/)
  mock(args)
elsif FileTest.pipe?(STDIN)
  pipe_args = STDIN.readlines.map { |line| line.chomp }
  mock(pipe_args)
else
  usage
end
