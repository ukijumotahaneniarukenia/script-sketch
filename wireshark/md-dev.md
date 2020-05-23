- https://kakurasan.blogspot.com/2015/07/debianubuntu-mingw-crosscompile.html

- https://kakurasan.blogspot.com/2015/06/wireshark-capture-httprequests.html

- https://kakurasan.blogspot.com/2015/06/manage-winapps-using-wineprefixes.html

- https://www.wireshark.org/

wine上でwinアプリはどちらも起動せず


wiresharkのインストール
パッケージからいんすこできる

対話入力がある

```

```


```
apt install -y wireshark
```

パッチあてる

```
$wireshark --version
wireshark: error while loading shared libraries: libQt5Core.so.5: cannot open shared object file: No such file or directory

$strip --remove-section=.note.ABI-tag /usr/lib/x86_64-linux-gnu/libQt5Core.so.5

$wireshark --version
Wireshark 3.0.5 (Git v3.0.5 packaged as 3.0.5-1)

Copyright 1998-2019 Gerald Combs <gerald@wireshark.org> and contributors.
License GPLv2+: GNU GPL version 2 or later <http://www.gnu.org/licenses/old-licenses/gpl-2.0.html>
This is free software; see the source for copying conditions. There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

Compiled (64-bit) with Qt 5.12.4, with libpcap, with POSIX capabilities (Linux),
with libnl 3, with GLib 2.62.1, with zlib 1.2.11, with SMI 0.4.8, with c-ares
1.15.0, with Lua 5.2.4, with GnuTLS 3.6.9 and PKCS #11 support, with Gcrypt
1.8.4, with MIT Kerberos, with MaxMind DB resolver, with nghttp2 1.39.2, with
LZ4, with Snappy, with libxml2 2.9.4, with QtMultimedia, with SBC, with SpanDSP,
without bcg729.

Running on Linux 3.10.0-1062.el7.x86_64, with Intel(R) Core(TM) i7-8700K CPU @
3.70GHz (with SSE4.2), with 31878 MB of physical memory, with locale ja_JP.utf8,
with libpcap version 1.9.1 (with TPACKET_V3), with GnuTLS 3.6.9, with Gcrypt
1.8.4, with zlib 1.2.11, binary plugins supported (0 loaded).

Built using gcc 9.2.1 20191008.
```

一般ユーザーをwiresharkグループに割付

```
$sudo usermod -aG wireshark kuraine

```

ヘルプ

```
$wireshark --help
Wireshark 3.0.5 (Git v3.0.5 packaged as 3.0.5-1)
Interactively dump and analyze network traffic.
See https://www.wireshark.org for more information.

Usage: wireshark [options] ... [ <infile> ]

Capture interface:
  -i <interface>           name or idx of interface (def: first non-loopback)
  -f <capture filter>      packet filter in libpcap filter syntax
  -s <snaplen>             packet snapshot length (def: appropriate maximum)
  -p                       don't capture in promiscuous mode
  -k                       start capturing immediately (def: do nothing)
  -S                       update packet display when new packets are captured
  -l                       turn on automatic scrolling while -S is in use
  -I                       capture in monitor mode, if available
  -B <buffer size>         size of kernel buffer (def: 2MB)
  -y <link type>           link layer type (def: first appropriate)
  --time-stamp-type <type> timestamp method for interface
  -D                       print list of interfaces and exit
  -L                       print list of link-layer types of iface and exit
  --list-time-stamp-types  print list of timestamp types for iface and exit

Capture stop conditions:
  -c <packet count>        stop after n packets (def: infinite)
  -a <autostop cond.> ...  duration:NUM - stop after NUM seconds
                           filesize:NUM - stop this file after NUM KB
                              files:NUM - stop after NUM files
Capture output:
  -b <ringbuffer opt.> ... duration:NUM - switch to next file after NUM secs
                           filesize:NUM - switch to next file after NUM KB
                              files:NUM - ringbuffer: replace after NUM files
Input file:
  -r <infile>              set the filename to read from (no pipes or stdin!)

Processing:
  -R <read filter>         packet filter in Wireshark display filter syntax
  -n                       disable all name resolutions (def: all enabled)
  -N <name resolve flags>  enable specific name resolution(s): "mnNtdv"
  -d <layer_type>==<selector>,<decode_as_protocol> ...
                           "Decode As", see the man page for details
                           Example: tcp.port==8888,http
  --enable-protocol <proto_name>
                           enable dissection of proto_name
  --disable-protocol <proto_name>
                           disable dissection of proto_name
  --enable-heuristic <short_name>
                           enable dissection of heuristic protocol
  --disable-heuristic <short_name>
                           disable dissection of heuristic protocol

User interface:
  -C <config profile>      start with specified configuration profile
  -Y <display filter>      start with the given display filter
  -g <packet number>       go to specified packet number after "-r"
  -J <jump filter>         jump to the first packet matching the (display)
                           filter
  -j                       search backwards for a matching packet after "-J"
  -m <font>                set the font name used for most text
  -t a|ad|d|dd|e|r|u|ud    output format of time stamps (def: r: rel. to first)
  -u s|hms                 output format of seconds (def: s: seconds)
  -X <key>:<value>         eXtension options, see man page for details
  -z <statistics>          show various statistics, see man page for details

Output:
  -w <outfile|->           set the output filename (or '-' for stdout)

Miscellaneous:
  -h                       display this help and exit
  -v                       display version info and exit
  -P <key>:<path>          persconf:path - personal configuration files
                           persdata:path - personal data files
  -o <name>:<value> ...    override preference or recent setting
  -K <keytab>              keytab file to use for kerberos decryption
  --display=DISPLAY        X display to use
  --fullscreen             start Wireshark in full screen

``

起動

rootユーザーで起動しないと権限エラーでた

```
sudo wireshark 1>$HOME/launch-wireshark.log 2>&1 &
```
