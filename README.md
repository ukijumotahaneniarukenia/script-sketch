# フォルダ構成

- 各プログラムディレクトリに以下のフォルダを作成

  - web

    - app1

      - lib

      - out

    - app2

      - lib

      - out

    - app3

      - lib

      - out

  - non-web

    - lib

    - out

web配下はアプリ名単位でlib,outフォルダ作成

non-web配下は直下にlib,outフォルダ作成

web化しない標準入出力を意識したプログラムはnon-webに
web化するものはそのアプリ特有のディレクトリ構成がない限り、
上記構成をデフォルトとする。
