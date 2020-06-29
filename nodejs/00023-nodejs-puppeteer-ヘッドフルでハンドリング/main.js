const puppeteer = require('puppeteer');

(async () => {
  //https://pptr.dev/#?product=Puppeteer&version=v4.0.1&show=api-puppeteerlaunchoptions
  const browser = await puppeteer.launch({ headless: false });//ヘッドフルでChromiumを起動
  const page = await browser.newPage();
  await page.goto('https://ukijumotahaneniarukenia.site/');
  await page.screenshot({ path: 'screenshot.png' });

  await browser.close();
})();
