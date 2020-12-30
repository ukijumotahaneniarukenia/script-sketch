const puppeteer = require("puppeteer");

async function main(targetSiteUrl, outputFileName) {
  const browser = await puppeteer.launch();
  const page = await browser.newPage();

  await page.tracing.start({ path: outputFileName });

  await page.goto(targetSiteUrl);

  await page.tracing.stop();
  await browser.close();
}

main('https://pptr.dev', 'GetADevtoolsPerformanceTraceForAPageLoad.json');
