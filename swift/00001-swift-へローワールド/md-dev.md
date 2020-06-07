```

mkdir 00001-swift-へローワールド

cd 00001-swift-へローワールド/

$swift package init --type executable
Creating executable package: 00001-swift-へローワールド
Creating Package.swift
Creating README.md
Creating .gitignore
Creating Sources/
Creating Sources/00001-swift-へローワールド/main.swift
Creating Tests/
Creating Tests/LinuxMain.swift
Creating Tests/00001-swift-へローワールドTests/
Creating Tests/00001-swift-へローワールドTests/_0001_swift_へローワールドTests.swift
Creating Tests/00001-swift-へローワールドTests/XCTestManifests.swift

$swift build
[4/4] Linking 00001-swift-へローワールド

$find -type f | grep 00001-swift-へローワールド
./.build/x86_64-unknown-linux-gnu/debug/00001-swift-へローワールドPackageTests.product/Objects.LinkFileList
./.build/x86_64-unknown-linux-gnu/debug/00001-swift-へローワールド.product/Objects.LinkFileList
./.build/x86_64-unknown-linux-gnu/debug/00001-swift-へローワールド
./Tests/00001-swift-へローワールドTests/_0001_swift_へローワールドTests.swift
./Tests/00001-swift-へローワールドTests/XCTestManifests.swift
./Sources/00001-swift-へローワールド/main.swift

$ls -lh ./.build/x86_64-unknown-linux-gnu/debug/00001-swift-へローワールド
-rwxrwxr-x 1 aine aine 25K  6月  8 00:44 ./.build/x86_64-unknown-linux-gnu/debug/00001-swift-へローワールド

$./.build/x86_64-unknown-linux-gnu/debug/00001-swift-へローワールド
Hello, world!


#ポータブル

$ mv ./.build/x86_64-unknown-linux-gnu/debug/00001-swift-へローワールド $HOME/.local/bin/helloworld



$ helloworld
Hello, world!

```
