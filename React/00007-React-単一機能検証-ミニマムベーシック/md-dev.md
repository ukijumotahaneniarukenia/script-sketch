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
