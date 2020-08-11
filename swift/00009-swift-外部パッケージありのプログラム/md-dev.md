```
#プロジェクトの名前
$ mkdir -p 00009-swift-外部パッケージありのプログラム
$ cd 00009-swift-外部パッケージありのプログラム/

#アプリの名前
$ mkdir -p app
$ cd app
$ swift package init --type executable
Creating executable package: 00009-swift-外部パッケージありのプログラム
Creating Package.swift
Creating README.md
Creating .gitignore
Creating Sources/
Creating Sources/00009-swift-外部パッケージありのプログラム/main.swift
Creating Tests/
Creating Tests/LinuxMain.swift
Creating Tests/00009-swift-外部パッケージありのプログラムTests/
Creating Tests/00009-swift-外部パッケージありのプログラムTests/_0009_swift_外部パッケージありのプログラムTests.swift
Creating Tests/00009-swift-外部パッケージありのプログラムTests/XCTestManifests.swift
$ tree -a
.
├── .gitignore
├── Package.swift
├── README.md
├── Sources
│   └── app
│       └── main.swift
└── Tests
    ├── LinuxMain.swift
    └── appTests
        ├── XCTestManifests.swift
        └── appTests.swift

4 directories, 7 files

$ swift build
[4/4] Linking app

$ tree -a
.
├── .build
│   ├── checkouts
│   ├── debug -> x86_64-unknown-linux-gnu/debug
│   ├── debug.yaml
│   ├── manifest.db
│   ├── repositories
│   └── x86_64-unknown-linux-gnu
│       ├── build.db
│       └── debug
│           ├── ModuleCache
│           │   ├── 2RR05ZANNNM91
│           │   │   └── SwiftShims-1AI5MN08WBSPF.pcm
│           │   ├── 3A6ZDGE09474Z
│           │   │   └── SwiftShims-1AI5MN08WBSPF.pcm
│           │   └── modules.timestamp
│           ├── app
│           ├── app.build
│           │   ├── app.swiftmodule.o
│           │   ├── main.d
│           │   ├── main.swift.o
│           │   ├── main.swiftdeps
│           │   ├── main~partial.swiftdoc
│           │   ├── main~partial.swiftmodule
│           │   ├── main~partial.swiftsourceinfo
│           │   ├── master.swiftdeps
│           │   ├── master.swiftdeps~moduleonly
│           │   └── output-file-map.json
│           ├── app.product
│           │   └── Objects.LinkFileList
│           ├── app.swiftdoc
│           ├── app.swiftmodule
│           ├── app.swiftsourceinfo
│           ├── appPackageTests.product
│           │   └── Objects.LinkFileList
│           ├── description.json
│           └── index
│               ├── db
│               │   └── v13
│               │       └── p276721
│               │           ├── data.mdb
│               │           └── lock.mdb
│               └── store
│                   └── v5
│                       ├── records
│                       │   ├── 05
│                       │   │   └── main.swift-2DELS97E22C05
│                       │   ├── 0B
│                       │   │   └── Swift.swiftmodule_Playground-2BDEY5WTUT30B
│                       │   ├── 35
│                       │   │   └── Swift.swiftmodule_Reflection-3RPBE1XT09V35
│                       │   ├── 3S
│                       │   │   └── Swift.swiftmodule_Assert-V65YNMTP6C3S
│                       │   ├── C5
│                       │   │   └── Swift.swiftmodule_C-2DSV2Q9MRG5C5
│                       │   ├── DU
│                       │   │   └── Swift.swiftmodule_Result-33J1FUJ6RVADU
│                       │   ├── DY
│                       │   │   └── Swift.swiftmodule_Collection_HashedCollections-130I5EYZMSDY
│                       │   ├── EK
│                       │   │   └── Swift.swiftmodule_Collection-2HFGFOH2IAQEK
│                       │   ├── FR
│                       │   │   └── Swift.swiftmodule_Protocols-22ZUDSKV59QFR
│                       │   ├── FV
│                       │   │   └── Swift.swiftmodule_Collection_Array-2YEDNABPUH4FV
│                       │   ├── IF
│                       │   │   └── Swift.swiftmodule_Pointer-29XCVIROK1VIF
│                       │   ├── K6
│                       │   │   └── Swift.swiftmodule_Math_Vector-OMN57IF3JVK6
│                       │   ├── K7
│                       │   │   └── Swift.swiftmodule_Collection_Lazy_Views-17VUIRJVWQFK7
│                       │   ├── LB
│                       │   │   └── Swift.swiftmodule_Math_Floating-18WOE4S5P5ZLB
│                       │   ├── NB
│                       │   │   └── Swift.swiftmodule_Misc-35ET1G2CT7NB
│                       │   ├── QW
│                       │   │   └── Swift.swiftmodule_Bool-1PL5932V9QW
│                       │   ├── R1
│                       │   │   └── Swift.swiftmodule_Math_Integers-1RG3ZATIID8R1
│                       │   ├── S1
│                       │   │   └── Swift.swiftmodule_Math-1AQNC3D9CLDS1
│                       │   ├── SY
│                       │   │   └── Swift.swiftmodule_Hashing-X56YPCUMLGSY
│                       │   ├── T8
│                       │   │   └── Swift.swiftmodule_Collection_Type-erased-30SNZK8TX00T8
│                       │   ├── U3
│                       │   │   └── Swift.swiftmodule_Optional-1DARLWQG0LXU3
│                       │   ├── U6
│                       │   │   └── Swift.swiftmodule-2B7VCHQF7EJU6
│                       │   ├── YV
│                       │   │   └── Swift.swiftmodule_String-1FNGMQFCCREYV
│                       │   └── ZF
│                       │       └── Swift.swiftmodule_KeyPaths-3J5C2QB124GZF
│                       └── units
│                           ├── Swift.swiftmodule-1FQGILS170WME
│                           └── main.swift.o-F5DRAFXTHOBH
├── .gitignore
├── Package.swift
├── README.md
├── Sources
│   └── app
│       └── main.swift
└── Tests
    ├── LinuxMain.swift
    └── appTests
        ├── XCTestManifests.swift
        └── appTests.swift

48 directories, 58 files


$ find -type f | xargs file | grep -P 'shared object'
./.build/x86_64-unknown-linux-gnu/debug/app:                                                                                   ELF 64-bit LSB shared object, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, for GNU/Linux 3.2.0, with debug_info, not stripped


$ ls -lh ./.build/x86_64-unknown-linux-gnu/debug/app
-rwxr-xr-x 1 aine aine 25K  8月 11 00:40 ./.build/x86_64-unknown-linux-gnu/debug/app


$ ./.build/x86_64-unknown-linux-gnu/debug/app
Hello, world!



Package.swiftファイルに外部ライブラリを追加し、swift build。
エラーが出ず、正常にダウンロードできて、リンキングできているかコンソールを見て確認


ポータブル
$ cp ./.build/x86_64-unknown-linux-gnu/debug/app ~/app-swift

$ cd ~
$ ./app-swift 
["./app-swift"]


Usage:


  CMD:





```

