- 起動
```
$KDevelop.AppImage 1>$HOME/launch-kdevelop.log 2>&1 & </dev/null
```

[kdevelopホームページ](https://www.kdevelop.org/download)
[cppチュートリアル](https://www.learncpp.com/cpp-tutorial/a3-using-libraries-with-codeblocks/)

[fuseグループ作成方法](https://github.com/AppImage/AppImageKit/wiki/FUSE)

[ginsan](https://qiita.com/6in/items/78c3c8995567f2244a46)
[ginsanその２](https://qiita.com/6in/items/379bc1ba18241ddf5404)
[nim開発環境てんぷれ](https://github.com/xyz32/KDevelop-template)
[Kdevelopの環境構築動画](https://vimeo.com/135918228)



```

cd /usr/local/src
git clone https://github.com/xyz32/KDevelop-template.git

cd /usr/local/src


#これやっておいてテンプレから選択できるようにする。拡張子制限かかっているから。
cp KDevelop-template/nimble_project/nimble_nim.kdevtemplate KDevelop-template/nimble_project/nimble_nim.desktop

```
