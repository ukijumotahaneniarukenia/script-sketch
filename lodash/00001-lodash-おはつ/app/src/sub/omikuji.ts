export default function curry() {
    let item = ["カレー", "うんこ", "メロン", "オレンジ", "りんご", "すいか"]
    const i = Math.floor(Math.random() * item.length)
    return item[i]
}