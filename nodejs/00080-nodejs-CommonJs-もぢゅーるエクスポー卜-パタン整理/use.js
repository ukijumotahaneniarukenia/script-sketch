const f = require('./f-無名プロパティ単位でエクスポート')


console.log(f.debug)

console.log(f.module)

console.log(f.output)

const g = require('./g-名前付きプロパティ単位でエクスポート')

console.log(g)

console.log(g.UNKO)

console.log(g.UNKO.debug)

console.log(g.UNKO.module)

console.log(g.UNKO.output)

const UNKO = require('./g-名前付きプロパティ単位でエクスポート').UNKO

console.log(UNKO.debug)

console.log(UNKO.module)

console.log(UNKO.output)
