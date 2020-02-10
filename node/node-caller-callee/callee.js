//https://kaworu.jpn.org/javascript/node.js%E3%81%A7%E3%82%AA%E3%83%96%E3%82%B8%E3%82%A7%E3%82%AF%E3%83%88%E3%82%92export%E3%81%99%E3%82%8B%E6%96%B9%E6%B3%95

module.exports = function(a,b){
    return a + b;
};

module.exports.add = function (a,b) {
    return a + b;
};

module.exports.square = function (a) {
    return a * a;
};

module.exports.cube = function (a) {
    return a * a * a;
};