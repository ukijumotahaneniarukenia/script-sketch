require 'selenium-webdriver'

driver = Selenium::WebDriver.for :chrome #chromeドライバーのインスタンスを生成

driver.get("https://ukijumotahaneniarukenia.site/") #指定したURLのページに遷移

driver.manage.timeouts.page_load = 30 #ページが完全にロードされるまで最大で30秒間待機

driver.manage.window.maximize #カレントウインドウを最大化する


driver.execute_script('window.scroll(0,1000);') #横は動かさず、下に1000ピクセル移動 javascriptで


button=driver.find_element(:xpath, '//div[1]/div/div/aside/section[3]/form/button') #指定したXPATHのDOMを取得

textbox=driver.find_element(:xpath, '//div[1]/div/div/aside/section[3]/form/label/input') #指定したXPATHのDOMを取得


textbox.send_keys 'jardump' #テキストボックスにjardumpを入力

button.click #ボタンを押下

sleep 3
