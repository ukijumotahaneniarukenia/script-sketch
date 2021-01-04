// import {send, say} from './a.js'

const who = 'ポルコ'

const MyLibA = require('./a-関数単位のエクスポートまとめて');

console.log('A'+'='.repeat(80))

console.log(MyLibA)

console.log(MyLibA.unko(who))

console.log(MyLibA.morimori(who))

console.log(MyLibA.moriougai(who))

console.log(MyLibA.unko(who))

console.log(MyLibA.morimori(MyLibA.unko(who)))

console.log(MyLibA.moriougai(MyLibA.morimori(MyLibA.unko(who))))

const MyLibB = require('./b-関数単位のエクスポート');

console.log('B'+'='.repeat(80))

console.log(MyLibB)

console.log(MyLibB.unko(who))

console.log(MyLibB.morimori(who))

console.log(MyLibB.moriougai(who))

console.log(MyLibB.unko(who))

console.log(MyLibB.morimori(MyLibB.unko(who)))

console.log(MyLibB.moriougai(MyLibB.morimori(MyLibB.unko(who))))

const MyLibC = require('./c-関数単位のエクスポート-もぢゅーる接頭辞なし');

console.log('C'+'='.repeat(80))

console.log(MyLibC)

console.log(MyLibC.unko(who))

console.log(MyLibC.morimori(who))

console.log(MyLibC.moriougai(who))

console.log(MyLibC.unko(who))

console.log(MyLibC.morimori(MyLibC.unko(who)))

console.log(MyLibC.moriougai(MyLibC.morimori(MyLibC.unko(who))))

// 関数単位でインクルード
const MyLibC_OnlyUnko = require('./c-関数単位のエクスポート-もぢゅーる接頭辞なし').unko;

console.log('MyLibC_OnlyUnko'+'='.repeat(80))

console.log(MyLibC_OnlyUnko)

console.log(MyLibC_OnlyUnko(who))


// 関数単位でインクルード
const MyLibD = require('./d-関数単位のデフォルトエクスポート');

console.log('MyLibD'+'='.repeat(80))

console.log(MyLibD.default(who))

// 関数単位でインクルード
const MyLibD_Default = require('./d-関数単位のデフォルトエクスポート').default;

console.log('MyLibD_Default'+'='.repeat(80))

console.log(MyLibD_Default(who))

// クラス単位でインクルード

const MyLibE = require('./e-クラス単位のエクスポート');
const UnkoMoriMoriMoriOugai = new MyLibE(who);
console.log(UnkoMoriMoriMoriOugai.unko());
console.log(UnkoMoriMoriMoriOugai.morimori());
console.log(UnkoMoriMoriMoriOugai.moriougai());

console.log(UnkoMoriMoriMoriOugai.unko());
console.log(UnkoMoriMoriMoriOugai.morimori2(UnkoMoriMoriMoriOugai.unko()));
console.log(UnkoMoriMoriMoriOugai.moriougai2(UnkoMoriMoriMoriOugai.morimori2(UnkoMoriMoriMoriOugai.unko())));
