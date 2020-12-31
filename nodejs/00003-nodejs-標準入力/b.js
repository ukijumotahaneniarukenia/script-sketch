function read() {
  let input = "";
  const { stdin } = process;
  return new Promise((resolve, reject) => {
    stdin
    .on("readable", () => {
      do {
        input += stdin.read();
      } while (stdin.read());
    })
    .on("end", () => {
      return resolve(input.replace(/\nnull$/, ""))
    });
  })
}

console.log(await read())
