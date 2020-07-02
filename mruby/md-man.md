- https://www.xmisao.com/2016/08/12/mruby-cli.html

- https://qiita.com/ore_public/items/ea62c934839c5e2f87ef

これを頼りに進めれば小さく始められそう

- http://blog.matsumoto-r.jp/?p=3310

テンプレート作成

```
mkdir -p wrksp


cd wrksp


doc-ubuntu-18-04-vim (kuraine)  23:09:25  wrksp   mruby-cli -s app
  create  .gitignore
  create  mrbgem.rake
  create  build_config.rb
  create  Rakefile
  create  Dockerfile
  create  docker-compose.yml
  create  tools/
  create  tools/app/
  create  tools/app/app.c
  create  mrblib/
  create  mrblib/app.rb
  create  mrblib/app/
  create  mrblib/app/version.rb
  create  bintest/
  create  bintest/app.rb
  create  test/
  create  test/test_app.rb

doc-ubuntu-18-04-vim (kuraine)  23:10:55  wrksp   find
.
./app
./app/.gitignore
./app/docker-compose.yml
./app/mrblib
./app/mrblib/app.rb
./app/mrblib/app
./app/mrblib/app/version.rb
./app/Dockerfile
./app/bintest
./app/bintest/app.rb
./app/build_config.rb
./app/mrbgem.rake
./app/Rakefile
./app/test
./app/test/test_app.rb
./app/tools
./app/tools/app
./app/tools/app/app.c
```

外部ライブラリなし

```
$ cd wrksp
$ cat ./app/mrblib/app.rb
def __main__(argv)
  if argv[1] == "version"
    puts "v#{App::VERSION}"
  else
    puts "Hello World"
  end
end


$ cd app/

$ find -type f | grep bin/app
./mruby/bin/app
./mruby/build/x86_64-apple-darwin14/bin/app
./mruby/build/i686-w64-mingw32/bin/app.exe
./mruby/build/host/bin/app
./mruby/build/x86_64-pc-linux-gnu/bin/app
./mruby/build/x86_64-w64-mingw32/bin/app.exe
./mruby/build/i386-apple-darwin14/bin/app
./mruby/build/i686-pc-linux-gnu/bin/app


$ find -type f | grep bin/app | xargs -t -I@ bash -c 'echo && file @ && echo'
bash -c 'echo && file ./mruby/bin/app && echo' 

./mruby/bin/app: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, for GNU/Linux 2.6.24, BuildID[sha1]=91dd09d514cae25c75808e8f339e873bfd10beb9, with debug_info, not stripped

bash -c 'echo && file ./mruby/build/x86_64-apple-darwin14/bin/app && echo' 

./mruby/build/x86_64-apple-darwin14/bin/app: Mach-O 64-bit x86_64 executable, flags:<NOUNDEFS|DYLDLINK|TWOLEVEL>

bash -c 'echo && file ./mruby/build/i686-w64-mingw32/bin/app.exe && echo' 

./mruby/build/i686-w64-mingw32/bin/app.exe: PE32 executable (console) Intel 80386, for MS Windows

bash -c 'echo && file ./mruby/build/host/bin/app && echo' 

./mruby/build/host/bin/app: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, for GNU/Linux 2.6.24, BuildID[sha1]=91dd09d514cae25c75808e8f339e873bfd10beb9, with debug_info, not stripped

bash -c 'echo && file ./mruby/build/x86_64-pc-linux-gnu/bin/app && echo' 

./mruby/build/x86_64-pc-linux-gnu/bin/app: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, for GNU/Linux 2.6.24, BuildID[sha1]=94f6f26622c5545117454d364b6e8c4df7ecc16d, stripped

bash -c 'echo && file ./mruby/build/x86_64-w64-mingw32/bin/app.exe && echo' 

./mruby/build/x86_64-w64-mingw32/bin/app.exe: PE32+ executable (console) x86-64, for MS Windows

bash -c 'echo && file ./mruby/build/i386-apple-darwin14/bin/app && echo' 

./mruby/build/i386-apple-darwin14/bin/app: Mach-O i386 executable, flags:<NOUNDEFS|DYLDLINK|TWOLEVEL|NO_HEAP_EXECUTION>

bash -c 'echo && file ./mruby/build/i686-pc-linux-gnu/bin/app && echo' 

./mruby/build/i686-pc-linux-gnu/bin/app: ELF 32-bit LSB executable, Intel 80386, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux.so.2, for GNU/Linux 2.6.24, BuildID[sha1]=a12102d93254b55ba5f0a142f9d23ad61d4eba96, with debug_info, not stripped


実行
$ ./mruby/build/x86_64-pc-linux-gnu/bin/app
Hello World
```

外部ライブラリありの場合は、dockerコンテナ内のヘッダファイル等を見直す必要がありそう

```

修正前

aine-MS-7B98 (aine)  23:30:18  app   cat ./mrbgem.rake
MRuby::Gem::Specification.new('app') do |spec|
  spec.license = 'MIT'
  spec.author  = 'MRuby Developer'
  spec.summary = 'app'
  spec.bins    = ['app']

  spec.add_dependency 'mruby-print', :core => 'mruby-print'
  spec.add_dependency 'mruby-mtest', :mgem => 'mruby-mtest'
end

修正後


MRuby::Gem::Specification.new('app') do |spec|
  spec.license = 'MIT'
  spec.author  = 'MRuby Developer'
  spec.summary = 'app'
  spec.bins    = ['app']

  spec.add_dependency 'mruby-print', :core => 'mruby-print'
  spec.add_dependency 'mruby-mtest', :mgem => 'mruby-mtest'


  #https://github.com/mattn/mruby-curl
  spec.add_dependency 'mruby-curl'
end


$ cat ./mrblib/app.rb
curl = Curl.new

headers = {
  'User-Agent' => 'mruby-curl'
}

response = curl.get("http://www.ruby-lang.org/ja/", headers)

def __main__(argv)
  if argv[1] == "version"
    puts "v#{App::VERSION}"
  else

    puts response.body

    puts "Hello World"

  end
end

$ cd app
$ docker-compose run compile
GIT   https://github.com/mattn/mruby-curl.git -> build/mrbgems/mruby-curl
Cloning into '/home/mruby/code/mruby/build/mrbgems/mruby-curl'...
remote: Enumerating objects: 16, done.
remote: Counting objects: 100% (16/16), done.
remote: Compressing objects: 100% (13/13), done.
remote: Total 16 (delta 1), reused 8 (delta 1), pack-reused 0
Unpacking objects: 100% (16/16), done.
Checking connectivity... done.
GIT   https://github.com/mattn/mruby-http.git -> build/mrbgems/mruby-http
Cloning into '/home/mruby/code/mruby/build/mrbgems/mruby-http'...
remote: Enumerating objects: 20, done.
remote: Counting objects: 100% (20/20), done.
remote: Compressing objects: 100% (18/18), done.
remote: Total 20 (delta 0), reused 10 (delta 0), pack-reused 0
Unpacking objects: 100% (20/20), done.
Checking connectivity... done.
      MRBC ../mrblib/app.rb 
      MRBC ../mrblib/app/version.rb 
CC    build/host/mrbgems/app/gem_init.c -> build/host/mrbgems/app/gem_init.o
CC    build/mrbgems/mruby-curl/src/mrb_curl.c -> build/host/mrbgems/mruby-curl/src/mrb_curl.o
/home/mruby/code/mruby/build/mrbgems/mruby-curl/src/mrb_curl.c:10:10: fatal error: 'curl/curl.h' file not found
#include <curl/curl.h>
         ^
1 error generated.
/home/mruby/code/mruby/build/mrbgems/mruby-curl/src/mrb_curl.c:10:10: fatal error: 'curl/curl.h' file not found
#include <curl/curl.h>
         ^
1 error generated.
rake aborted!
Command failed with status (1): [clang -g -std=gnu99 -O3 -Wall -Werror-impl...]
/home/mruby/code/mruby/tasks/mruby_build_commands.rake:31:in `_run'
/home/mruby/code/mruby/tasks/mruby_build_commands.rake:36:in `rescue in _run'
/home/mruby/code/mruby/tasks/mruby_build_commands.rake:32:in `_run'
/home/mruby/code/mruby/tasks/mruby_build_commands.rake:88:in `run'
/home/mruby/code/mruby/tasks/mruby_build_commands.rake:112:in `block (2 levels) in define_rules'
Command failed with status (1): ["clang" -g -std=gnu99 -O3 -Wall -Werror-im...]
/home/mruby/code/mruby/tasks/mruby_build_commands.rake:33:in `_run'
/home/mruby/code/mruby/tasks/mruby_build_commands.rake:88:in `run'
/home/mruby/code/mruby/tasks/mruby_build_commands.rake:112:in `block (2 levels) in define_rules'
Tasks: TOP => compile => all => /home/mruby/code/mruby/build/host/lib/libmruby.flags.mak => /home/mruby/code/mruby/build/host/lib/libmruby.a => /home/mruby/code/mruby/build/host/mrbgems/mruby-curl/src/mrb_curl.o
(See full trace by running task with --trace)



apt install libcurl4-openssl-dev

これはdockerホスト
$ find / 2>/dev/null | grep curl.h
/home/aine/wrksp/app/mruby/build/mrbgems/mruby-curl/src/mrb_curl.h
/usr/include/x86_64-linux-gnu/curl/curl.h


```
