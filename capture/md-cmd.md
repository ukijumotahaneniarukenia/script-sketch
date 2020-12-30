クロン設定
```
$ cat test-crontab
45 12 * * * /home/aine/test-repo/wrapper.sh TEST-repo 00001 00003 test.sh
```

いいかんじに検証ディレクトリ作成
```
$ tree TEST-repo/ test-repo/
TEST-repo/
├── 00001-bash-テストダヨーン
│   └── test.sh
├── 00002-bash-うんこダヨーン
│   └── test.sh
└── 00003-bash-ぽるこダヨーン
    └── test.sh
test-repo/
└── wrapper.sh

3 directories, 4 files
```

クロン登録
```
$ crontab  < test-crontab
```

クロン確認
```
$ crontab -l
45 12 * * * /home/aine/test-repo/wrapper.sh TEST-repo 00001 00003 test.sh
```

実行ディレクトリとログディレクトリは引数でもらったほうがハンディ
```
$ cat <<EOS >test.sh
#!/usr/bin/env bash

TARGET_DIR_NAME=$1;shift
LOG_DIR_NAME=$1;shift

echo $TARGET_DIR_NAME >$LOG_DIR_NAME/$RANDOM-test-output
```

ラッパスクリプト
```
$ cat /home/aine/test-repo/wrapper.sh
#!/usr/bin/env bash

usage(){

cat <<EOS

Usage

CMD: bash $0 TEST-repo 00001 00003 test.sh

EOS
}

TARGET_REPO_NAME=$1;shift;
TARGET_START_DIR_PREFIX=$1;shift;
TARGET_END_DIR_PREFIX=$1;shift;
WRAPPER_EXEC_FILE_NAME=$1;shift;

eval echo {$TARGET_START_DIR_PREFIX..$TARGET_END_DIR_PREFIX} | xargs -n1 | \

  while read TARGET_DIR_PREFIX;do

    TARGET_DIR_NAME=$(find $HOME/$TARGET_REPO_NAME -type d -maxdepth 1 | grep $TARGET_DIR_PREFIX)

    LOG_DIR_NAME=$TARGET_DIR_NAME/log

    mkdir -p $LOG_DIR_NAME

    bash $HOME/$TARGET_REPO_NAME/$TARGET_DIR_PREFIX*/$WRAPPER_EXEC_FILE_NAME $TARGET_DIR_NAME $LOG_DIR_NAME

  done
```

クロン実行後のディレクトリ
```
$ tree TEST-repo/
TEST-repo/
├── 00001-bash-テストダヨーン
│   ├── log
│   │   └── 8642-test-output
│   └── test.sh
├── 00002-bash-うんこダヨーン
│   ├── log
│   │   └── 19020-test-output
│   └── test.sh
└── 00003-bash-ぽるこダヨーン
    ├── log
    │   └── 16598-test-output
    └── test.sh

6 directories, 6 files
```

クロンの起動ログ
```
$ tail -f /var/log/cron.log
Oct  4 12:40:01 aine-MS-7B98 cron[629]: (aine) RELOAD (crontabs/aine)
Oct  4 12:40:01 aine-MS-7B98 CRON[85962]: (aine) CMD (/home/aine/test-repo/wrapper.sh TEST-repo 00001 00003 test.sh)
Oct  4 12:42:17 aine-MS-7B98 crontab[86092]: (aine) REPLACE (aine)
Oct  4 12:42:23 aine-MS-7B98 crontab[86094]: (aine) LIST (aine)
Oct  4 12:43:01 aine-MS-7B98 cron[629]: (aine) RELOAD (crontabs/aine)
Oct  4 12:43:01 aine-MS-7B98 CRON[86114]: (aine) CMD (/home/aine/test-repo/wrapper.sh TEST-repo 00001 00003 test.sh)
Oct  4 12:44:48 aine-MS-7B98 crontab[86220]: (aine) REPLACE (aine)
Oct  4 12:44:51 aine-MS-7B98 crontab[86222]: (aine) LIST (aine)
Oct  4 12:45:01 aine-MS-7B98 cron[629]: (aine) RELOAD (crontabs/aine)
Oct  4 12:45:01 aine-MS-7B98 CRON[86225]: (aine) CMD (/home/aine/test-repo/wrapper.sh TEST-repo 00001 00003 test.sh)
```

成果物の確認
```
$ find TEST-repo/ | grep output | xargs -t -I@ -n1 cat @
cat TEST-repo/00002-bash-うんこダヨーン/log/19020-test-output
/home/aine/TEST-repo/00002-bash-うんこダヨーン
cat TEST-repo/00003-bash-ぽるこダヨーン/log/16598-test-output
/home/aine/TEST-repo/00003-bash-ぽるこダヨーン
cat TEST-repo/00001-bash-テストダヨーン/log/8642-test-output
/home/aine/TEST-repo/00001-bash-テストダヨーン
```
