#!/usr/bin/env node

/*
system requirements: 
 libxkbcommon-dev
 libatk-bridge2.0-dev
 libnss3-dev
 libgbm-dev
 libgtk-3-dev
 libasound-dev
*/
const width = 1024;
const height = 1600;

const puppeteer = require('puppeteer');

(async() => {
    const browser = await puppeteer.launch({
        'defaultViewport': { 'width': width, 'height': height },
        //headless: false,
        userDataDir: '/home/admin/tools/pwd/chromeDataDir',
        // devtools: true,
        args: [
            '--no-sandbox',
            '--disable-setuid-sandbox',
            '--disable-accelerated-2d-canvas',
            '--disable-gpu'
        ]
    });
    const page = await browser.newPage();

    page.setDefaultNavigationTimeout(90000);

    await page.setViewport({ 'width': width, 'height': height });

    await page.setUserAgent('UA-TEST');

    await page.addStyleTag({ content: "{scroll-behavior: auto !important;}" });

    // page.once('load', async() => {
    //     console.log('Page loaded!', page.url());

    // });
    // page.once('targetchanged', target => console.log(target.url()));
    await page.goto('https://labs.play-with-docker.com/', { waitUntil: 'domcontentloaded' });

    // Get the "viewport" of the page, as reported by the page.
    // const dimensions = await page.evaluate(() => {
    //     return {
    //         width: document.documentElement.clientWidth,
    //         height: document.documentElement.clientHeight,
    //         deviceScaleFactor: window.devicePixelRatio,
    //     };
    // });
    // console.log('Dimensions:', dimensions);

    await page.waitForSelector('#landingForm a.btn.btn-success');

    // page.click('#landingForm a.btn.btn-success');


    // '#btnGroupDrop1' click
    // document.querySelector("body > div > div.jumbotron > div > div > a")

    await page.click('#btnGroupDrop1');
    await page.waitForSelector('body > div > div.jumbotron > div > div > a');


    await page.waitForTimeout(4000);
    await page.click('body > div > div.jumbotron > div > div > a');

    page.waitForTimeout(5000).then(async() => {
        const button = await page.$('#landingForm a.btn.btn-success');

        // await button.evaluate((e) => e.click());
        await page.click('#landingForm a.btn.btn-success');
        const response = await page.waitForNavigation();
        // console.log(response);
        if (response)
            console.log(response.url());
        await browser.close();
    });






    // response = await page.waitForNavigation();



    // console.log('Page Url: ', page.url());
    // console.log('Response: ', response);


    // page
    //   .mainFrame()
    //   .waitForSelector('#landingForm a.btn.btn-success')
    // 	.then(async function(e) {
    // 		// console.log('e',e);
    // 		await e.click();
    // 	    const [response] = await Promise.all([
    // 	      page.waitForNavigation()
    //
    // 	    ]).catch(e => console.log(e));
    // 		// console.log('Response: ', response);
    // 		console.log('Url: ', response.url());
    //
    // 		// await browser.close();
    // 	});



    //	const hrefElement = await page.$('#landingForm');
    // const html = await page.$eval('#landingForm a.btn.btn-success', e => {
    // e.click();

    // return e.outerHTML;
    // });
    // console.log(html);
    // console.log('Url: ', page.url());
    //     const [response] = await Promise.all([
    // 	  page.waitForSelector('#landingForm a.btn.btn-success'),
    //
    // 	  page.click('#landingForm a.btn.btn-success'),
    //       page.waitForNavigation()
    //     ]);

    // console.log('Url: ', response.url());

    // '#landingForm a.btn.btn-success'




})();