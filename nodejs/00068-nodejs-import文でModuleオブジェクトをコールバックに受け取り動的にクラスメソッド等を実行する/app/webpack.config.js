module.exports = {
  mode: "development",
  entry: "./src/index.js",
  target: "node",
  output: {
    path: __dirname + "/dist",
    filename: "main.js",
  },
  resolve: {
    extensions: [".ts", ".js"],
  },
  module: {
    rules: [
      {
        test: /\.js$/, // .jsファイルを処理対象として指定
        use: {
          // testプロパティにマッチしたファイルに対する処理を指定
          loader: "babel-loader", // 「babel-loader」を利用することを指定
          options: {
            // babel-loaderのオプションを指定
            presets: [
              // プリセットを選択する
              [
                "@babel/preset-env", // プリセットとして「@babel/preset-env」を使用する
              ],
            ],
          },
        },
      },
    ],
  },
};
