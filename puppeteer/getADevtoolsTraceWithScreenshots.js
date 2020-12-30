const puppeteer = require("puppeteer");

async function main(targetSiteUrl, outputFileName) {
  const browser = await puppeteer.launch();
  const page = await browser.newPage();

  await page.tracing.start({ path: outputFileName, screenshots: true });

  await page.goto(targetSiteUrl);

  await page.tracing.stop();
  await browser.close();
}

//スクリーンショットはデフォルトでjsonファイルとして出力されるので、それをChromeのPerformanceツールにドラッグアンドドロップすると見れる
main('https://pptr.dev', 'getADevtoolsTraceWithScreenshots.json');
