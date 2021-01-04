const path = require('path')

module.exports.UNKO = {
  debug: true,
  devtool: '#eval-source-map',

  entry: [
    'webpack-dev-server/client?http://localhost:3000',
    'webpack/hot/only-dev-server',
    './app/main.jsx'
  ],

  output: {
    path: path.join(__dirname, 'dist'),
    publicPath: '/',
    filename: 'bundle.js'
  },

  module: {
    loaders: [
      { test: /\.jsx?$/, exclude: /node_modules/, loaders: ['react-hot', 'babel'] }
    ]
  }
};
