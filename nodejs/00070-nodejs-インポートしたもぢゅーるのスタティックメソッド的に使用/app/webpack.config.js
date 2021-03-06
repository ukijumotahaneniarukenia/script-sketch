module.exports = {
  mode: 'development',
  entry: './src/index.js',
  target: 'node',
  output: {
    path: __dirname + '/dist',
    filename: 'main.js',
  },
  resolve: {
      extensions: ['.ts', '.js']
  }
}
