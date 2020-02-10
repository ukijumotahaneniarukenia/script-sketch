#!/usr/local/bin/ruby 

def usage(*rsv_args)
  #引数を配列として受け取る
  file=$0
  #https://qiita.com/raccy/items/1168c7e8849dedf70fa4#%E3%81%BE%E3%81%A8%E3%82%81-1
  init_args=rsv_args
  p init_args
  puts <<"EOS"
Usage:
$echo 1 10 2 | ruby #{file}

$ruby #{file} 1 14 3

EOS
exit 1
end

def print_func_info(*rsv_args)
  init_args=rsv_args
  func=init_args[0].to_s
  line=init_args[1].to_s
  foot_stamp=init_args[2].to_s
  #https://ref.xaio.jp/ruby/classes/fixnum/to_s
  #https://ref.xaio.jp/ruby/classes/symbol/to_s
  #p __method__.class
  #https://rubyist.g.hatena.ne.jp/muscovyduck/20080328/p1
  #p __LINE__.class
  #puts "["+foot_stamp+"]"+"FUNCTION:"+func+",LINE:"+line
  #https://qiita.com/scivola/items/1f6704f81aba18df9012
  #https://qiita.com/khotta/items/9233a9ffeae68b58d84f
  msg=msg.to_s+"\e[32m"
  msg=msg+"["+foot_stamp+"]"
  msg=msg+"\e[0m"
  msg=msg+"\e[33m"
  msg=msg+"FUNCTION:"+func
  msg=msg+"\e[0m"
  msg=msg+"\e[36m"
  msg=msg+",LINE:"+line
  msg=msg+"\e[0m"
  puts msg
end

def range_grp(rsv_args)
  init_args=rsv_args
  mn=init_args[0].to_i
  mx=init_args[1].to_i
  grp=init_args[2].to_i
  mn.upto(mx).each_slice(grp) do |s|
    p s
  end
end

def main(rsv_args)
  print_func_info(__method__,__LINE__,"START")
  #引数をスカラとしてそのまま受け取る
  init_args=rsv_args
  p init_args
  range_grp(init_args)
  print_func_info(__method__,__LINE__,"END")
end

def chk_args()
  print_func_info(__method__,__LINE__,"START")
  if ARGV.length > 0
    init_args = [ *ARGV ]
    p init_args#コマンドライン引数はスペース区切りで単一要素に展開されて格納される
    puts "コマンドライン引数"
    print_func_info(__method__,__LINE__,"END")
    return init_args
  elsif FileTest.pipe?(STDIN)
    init_args = STDIN.readlines.map { |line| line.chomp }
    p init_args[0]#パイプ経由は複数の引数をまとめて単一要素にグルーピングして格納している。なので、先頭要素をインデックス指定で取得
    puts "パイプ経由引数"
    #https://ref.xaio.jp/ruby/classes/string/split
    print_func_info(__method__,__LINE__,"END")
    return init_args[0].split(" ")
  else
    #https://www.xmisao.com/2014/03/29/how-to-get-the-name-of-calling-method-in-ruby.html
    usage("引数ないよ",__LINE__,__method__)
  end
  print_func_info(__method__,__LINE__,"END")
end

if __FILE__==$0
  print_func_info(__method__,__LINE__,"START")
  init_args_done=chk_args
  #https://ref.xaio.jp/ruby/classes/array/join
  p "init_args:"+init_args_done.join(",")
  main(init_args_done)
  print_func_info(__method__,__LINE__,"END")
end
