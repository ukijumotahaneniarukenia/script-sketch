- http://meldmerge.org/

環境ディレクトリ

ubuntu-18-04-vim


```
$ apt install -y meld
```


```
$ meld --version

(meld:6844): dbind-WARNING **: 14:09:54.973: Couldn't connect to accessibility bus: Failed to connect to socket /tmp/dbus-3oQDciKbbB: Connection refused
meld 3.18.0

```

プロセス起動

```
$ meld 1>$HOME/launch-meld.log 2>&1 &
```

ヘルプ

```
$ meld --help

(meld:6880): dbind-WARNING **: 14:10:16.136: Couldn't connect to accessibility bus: Failed to connect to socket /tmp/dbus-3oQDciKbbB: Connection refused
Usage:
  meld                              Start with an empty window
  meld <file|folder>                Start a version control comparison
  meld <file> <file> [<file>]       Start a 2- or 3-way file comparison
  meld <folder> <folder> [<folder>] Start a 2- or 3-way folder comparison

Meld is a file and directory comparison tool.

Options:
  --version             show program's version number and exit
  -h, --help            show this help message and exit
  -L LABEL, --label=LABEL
                        Set label to use instead of file name
  -n, --newtab          Open a new tab in an already running instance
  -a, --auto-compare    Automatically compare all differing files on startup
  -u, --unified         Ignored for compatibility
  -o OUTFILE, --output=OUTFILE
                        Set the target file for saving a merge result
  --auto-merge          Automatically merge files
  --comparison-file=COMPARISON_FILE
                        Load a saved comparison from a Meld comparison file
  --diff                Create a diff tab for the supplied files or folders

```


diffのキャプチャ取るのを自動化できそう


```
$ echo うんこ >a
$ echo もりもりうんこ>b
$ meld a b 1>$HOME/launch-meld.log 2>&1 &
```

プロセスの停止

```
$ ps uax | grep meld | grep -v grep | awk '{print $2}' | xargs kill -9
```
