const program = require("commander");
const fs = require("fs");

program
  .version("0.0.1", "-v, --version")
  .option("-d, --debug", "デバックモードダヨーン")
  .version("0.0.1", "-v, --version")
  .parse(process.argv);

function usage(PROGRAM_NAME) {
  const Usage = `
USAGE:

  CMD: ${PROGRAM_NAME} test.json test2.json

`;
  console.log(Usage);
}

const targetJsonFileList = process.argv.splice(2);

if (0 === targetJsonFileList.length) {
  usage(process.argv[1]);
}

const result = targetJsonFileList.map((e) => {
  return Object.assign({ file: e }, fs.statSync(e));
});
console.log(JSON.stringify(result, null, 2));
