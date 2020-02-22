
//echo unko | node $0

process.stdin.on('data', function (buf) {
    process.stdout.write(buf.toString());
});
