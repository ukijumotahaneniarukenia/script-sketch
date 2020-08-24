module.exports = {
    mode: 'development',
    entry: './main.js',
    target: 'node',
    output: {
        path: __dirname,
        filename: 'app.js'
    },
    module: {
        rules: [
            {
                test: /\.js$/,
            }
        ]
    },
    resolve: {
        extensions: ['.ts', '.js']
    }
}
