
- https://swift.org/getting-started/#using-the-package-manager

```
$ mkdir -p 00002-swift-同一フォルダではインポート文不要

$ cd 00002-swift-同一フォルダではインポート文不要


$ swift package init --type executable
Creating executable package: 00002-swift-同一フォルダではインポート文不要
Creating Package.swift
Creating README.md
Creating .gitignore
Creating Sources/
Creating Sources/00002-swift-同一フォルダではインポート文不要/main.swift
Creating Tests/
Creating Tests/LinuxMain.swift
Creating Tests/00002-swift-同一フォルダではインポート文不要Tests/
Creating Tests/00002-swift-同一フォルダではインポート文不要Tests/_0002_swift_同一フォルダではインポート文不要Tests.swift
Creating Tests/00002-swift-同一フォルダではインポート文不要Tests/XCTestManifests.swift



$ touch Sources/00002-swift-同一フォルダではインポート文不要/Greeter.swift



$ swift run 00002-swift-同一フォルダではインポート文不要 `whoami`
[5/5] Linking 00002-swift-同一フォルダではインポート文不要
Hello, aine!
```


ポータブルか

```

$ find -type f | grep 00002-swift-同一フォルダではインポート文不要
./.build/x86_64-unknown-linux-gnu/debug/00002-swift-同一フォルダではインポート文不要PackageTests.product/Objects.LinkFileList
./.build/x86_64-unknown-linux-gnu/debug/00002-swift-同一フォルダではインポート文不要.product/Objects.LinkFileList
./.build/x86_64-unknown-linux-gnu/debug/00002-swift-同一フォルダではインポート文不要
./Tests/00002-swift-同一フォルダではインポート文不要Tests/XCTestManifests.swift
./Tests/00002-swift-同一フォルダではインポート文不要Tests/_0002_swift_同一フォルダではインポート文不要Tests.swift
./Sources/00002-swift-同一フォルダではインポート文不要/Greeter.swift
./Sources/00002-swift-同一フォルダではインポート文不要/main.swift

$ mv ./.build/x86_64-unknown-linux-gnu/debug/00002-swift-同一フォルダではインポート文不要 $HOME/.local/bin/testcmd

$ testcmd $(whoami)
Hello, aine!
```
