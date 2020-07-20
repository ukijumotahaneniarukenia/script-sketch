- REF

  - https://www.taniarascia.com/getting-started-with-react/

```
curl -sL https://deb.nodesource.com/setup_12.x | bash -
apt-get install -y nodejs
```


```
mkdir -p 00007-React-単一機能検証-ミニマムベーシック

cd 00007-React-単一機能検証-ミニマムベーシック

npx create-react-app my-app --use-npm --template typescript


cd my-app/


npm install --save react-router-dom

npm install --save @types/react-router-dom

code .
```


- デフォルトのブラウザがfirefoxで起動してしまうので、chromeに変更


  - chromeにすると拡張機能が使えるので


pacakage.jsonを修正

chromeの実行バイナリが存在しているファイルパスを指定する

- https://stackoverflow.com/questions/51706882/create-react-app-how-do-i-npm-start-with-a-specific-browser

```
$ which chrome
/usr/local/src/chrome-linux/chrome
```

修正前
```
{
  "name": "my-app",
  "version": "0.1.0",
  "private": true,
  "dependencies": {
    "@testing-library/jest-dom": "^4.2.4",
    "@testing-library/react": "^9.5.0",
    "@testing-library/user-event": "^7.2.1",
    "@types/jest": "^24.9.1",
    "@types/node": "^12.12.50",
    "@types/react": "^16.9.43",
    "@types/react-dom": "^16.9.8",
    "react": "^16.13.1",
    "react-dom": "^16.13.1",
    "react-scripts": "3.4.1",
    "set-default-browser": "^1.1.1",
    "typescript": "^3.7.5"
  },
  "scripts": {
    "start": "react-scripts start",
    "build": "react-scripts build",
    "test": "react-scripts test",
    "eject": "react-scripts eject"
  },
  "eslintConfig": {
    "extends": "react-app"
  },
  "browserslist": {
    "production": [
      ">0.2%",
      "not dead",
      "not op_mini all"
    ],
    "development": [
      "last 1 chrome version",
      "last 1 firefox version",
      "last 1 safari version"
    ]
  }
}
```

修正後
```
$ cat package.json
{
  "name": "my-app",
  "version": "0.1.0",
  "private": true,
  "dependencies": {
    "@testing-library/jest-dom": "^4.2.4",
    "@testing-library/react": "^9.5.0",
    "@testing-library/user-event": "^7.2.1",
    "@types/jest": "^24.9.1",
    "@types/node": "^12.12.50",
    "@types/react": "^16.9.43",
    "@types/react-dom": "^16.9.8",
    "react": "^16.13.1",
    "react-dom": "^16.13.1",
    "react-scripts": "3.4.1",
    "typescript": "^3.7.5"
  },
  "scripts": {
    "start": "BROWSER=/usr/local/src/chrome-linux/chrome react-scripts start",
    "build": "react-scripts build",
    "test": "react-scripts test",
    "eject": "react-scripts eject"
  },
  "eslintConfig": {
    "extends": "react-app"
  },
  "browserslist": {
    "production": [
      ">0.2%",
      "not dead",
      "not op_mini all"
    ],
    "development": [
      "last 1 chrome version",
      "last 1 firefox version",
      "last 1 safari version"
    ]
  }
}
```




chroniumでも「React Developer Tools」が使えた。便利。

「google翻訳」も使えた。

左下らへんにあるchromeストアから検索すること。


インストール後、ピン留めしてサーバ再起動
```
$npm start
```

実行後、F12でComponentsタグないしはProfilerタグでReact管理オブジェクトをinspectできる


配備方法
```

ビルドアセット作成 build/ディレクトリ配下が資産全部
$ npm run build


Webサーバ起動
$ sudo apt install -y apache2


ポートオープン確認
$ sudo lsof -i:80 -P
COMMAND   PID     USER   FD   TYPE DEVICE SIZE/OFF NODE NAME
chrome  47596  kuraine  130u  IPv4 929106      0t0  TCP doc-ubuntu-18-04-vim:38124->104.26.8.29:80 (ESTABLISHED)
apache2 48190     root    3u  IPv4 923273      0t0  TCP *:80 (LISTEN)
apache2 48191 www-data    3u  IPv4 923273      0t0  TCP *:80 (LISTEN)
apache2 48192 www-data    3u  IPv4 923273      0t0  TCP *:80 (LISTEN)

サービス確認 ページ表示されたおk
$ firefox http://localhost/index.html

資産配備
$ sudo cp -r build/* /var/www/html/


ページ表示されているか確認
$ firefox http://localhost:80/index.html

ページ表示されているか確認
$ chrome http://localhost:80/index.html

```

アイコン活性していれば、いい感じ

- https://reactjs.org/docs/optimizing-performance.html#use-the-production-build


