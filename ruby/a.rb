#!/usr/bin/env ruby

require 'active_support'
require 'active_support/core_ext'
ActiveSupport::XmlMini.backend = 'Nokogiri'

def usage
  f = File.basename(__FILE__)
  puts <<~EOF
Usage:
  IN : echo test.xml | #{f}
  MID: cat test.json | jq --stream -c
  OUT:
EOF
  return 0
end

def mock(ary)
  ary.map{|e|
    txt=Hash.from_xml(File.read(e)).to_json
    f=e.slice!(/.*(?=\.xml)/);
    File.open(f+".json","w") do |file|
      file.puts txt;
    end
  }
  return 0
end

if ARGV.length > 0
  usage
elsif FileTest.pipe?(STDIN)
  n = STDIN.readlines.map {|e|e.split(/\s{1,}/)}
  pipe_args = n.flatten
  mock(pipe_args)
else
  usage
end
