#!/usr/bin/env ruby

#ロケール抜くやつ
#$ find -type f | grep lib | grep locale | grep -v address | while read f;do grep -q address: $f;[ $? -eq 0 ]&&echo $f;done | ruby -F/ -anle 'puts $F[$F.size-1].sub(/\.yml/,"")'|sort |uniq|xargs


#https://github.com/faker-ruby/faker
require 'faker'

def usage
  f = File.basename(__FILE__)
  puts <<~EOF
Usage:

LOCALE:ar bg ca-CAT da-DK de de-AT de-CH ee en-AU en-CA en-GB en-IND en-MS en-NEP en-NG en-NZ en-PAK en-SG en-UG en-US en-ZA en-au-ocker es es-MX fi-FI fr fr-CA fr-CH he hy id it ja ko lv nb-NO nl pl pt pt-BR ru sk sv tr uk vi zh-CN zh-TW

  IN : echo en-US 20 | #{f}
  OUT:

  or

  IN : #{f} ja 20
  OUT:
EOF
  return 0
end

def generate(ary)
  Faker::Config.locale=ary[0]

  [*1..ary[1].to_i].map do|e|
    puts Faker::Name.name#氏名
    # puts Faker::Internet::HTTP.status_code(group: :information)
  end
end

if ARGV.length > 0
  cmd_args = [ *ARGV ]

  if cmd_args.size != 2
    usage
  end

  generate(cmd_args)

elsif FileTest.pipe?(STDIN)

  pipe_args = STDIN.readlines.map{|e|e.split(/\s+/)}.flatten

  generate(pipe_args)
else
  usage
end
