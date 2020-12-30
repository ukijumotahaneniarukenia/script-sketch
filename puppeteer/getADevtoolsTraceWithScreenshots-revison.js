const puppeteer = require('puppeteer');
const fs = require('fs');

async function main() {
  const browser = await puppeteer.launch();
  const page = await browser.newPage();

  await page.tracing.start({ screenshots: true, path: 'trace.json' });
  await page.goto('https://www.google.com', { timeout: 3000 });
  await page.tracing.stop();

  // https://github.com/puppeteer/puppeteer/issues/1072#issuecomment-351614722
  // 一旦ファイルに吐いてpngにしたい対象をjsonから抜き出してそれをスクリーンショットにする
  // --- extracting data from trace.json ---
  const tracing = JSON.parse(fs.readFileSync('./trace.json', 'utf8'));
  const traceScreenshots = tracing.traceEvents.filter(x => (
      x.cat === 'disabled-by-default-devtools.screenshot' &&
      x.name === 'Screenshot' &&
      typeof x.args !== 'undefined' &&
      typeof x.args.snapshot !== 'undefined'
  ));
  traceScreenshots.forEach(function(snap, index) {
    fs.writeFile('trace-screenshot-'+index+'.png', snap.args.snapshot, 'base64', function(err) {
      if (err) {
        console.log('writeFile error', err);
      }
    });
  });
  // --- end extracting data from trace.json ---

  await page.close();
}

main();
