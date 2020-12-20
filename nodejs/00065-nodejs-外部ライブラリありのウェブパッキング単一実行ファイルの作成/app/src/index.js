import {unko} from '../lib/mylib.js'

let result = unko('ぽるこ')

console.log(result)

import emmet from 'emmet';

// エラーわかりやすい
// SyntaxError: Named export 'emmet' not found. The requested module 'emmet' is a CommonJS module, which may not support all module.exports as named exports.
// CommonJS modules can always be imported via the default export, for example using:

// import pkg from 'emmet';
// const {emmet} = pkg;

// console.log(emmet["default"]('p>a')); // 動作確認時はデフォルト指定しないとだめ

console.log(emmet('p>a')); // ビルド後のワンファイルはデフォルト指定するとエラー ビルド時はデフォルト指定を外す運用
