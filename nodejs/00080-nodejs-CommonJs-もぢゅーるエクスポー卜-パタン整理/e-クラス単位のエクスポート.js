// Arityでは区別できていないので、関数名で区別

module.exports = class UnkoMoriMoriMoriOugai {
  constructor(who) {
    this.who = who;
  }

  unko() {
    return this.who + 'うんこ';
  }

  morimori() {
    return this.who + 'もりもり';
  }

  moriougai() {
    return this.who + '森鴎外';
  }

  morimori2(unko) {
    return unko + 'もりもり';
  }

  moriougai2(morimori) {
    return morimori + '森鴎外';
  }
};
