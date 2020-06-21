# 1

- 事象

```
$ ruby main.rb

Traceback (most recent call last):
	35: from 00046-ruby-seleniumでブラウザ表示.rb:17:in `<main>'
	34: from /var/lib/gems/2.5.0/gems/selenium-webdriver-3.142.7/lib/selenium/webdriver/common/element.rb:74:in `click'
	33: from /var/lib/gems/2.5.0/gems/selenium-webdriver-3.142.7/lib/selenium/webdriver/remote/w3c/bridge.rb:371:in `click_element'
	32: from /var/lib/gems/2.5.0/gems/selenium-webdriver-3.142.7/lib/selenium/webdriver/remote/w3c/bridge.rb:567:in `execute'
	31: from /var/lib/gems/2.5.0/gems/selenium-webdriver-3.142.7/lib/selenium/webdriver/remote/bridge.rb:167:in `execute'
	30: from /var/lib/gems/2.5.0/gems/selenium-webdriver-3.142.7/lib/selenium/webdriver/remote/http/common.rb:64:in `call'
	29: from /var/lib/gems/2.5.0/gems/selenium-webdriver-3.142.7/lib/selenium/webdriver/remote/http/default.rb:114:in `request'
	28: from /var/lib/gems/2.5.0/gems/selenium-webdriver-3.142.7/lib/selenium/webdriver/remote/http/common.rb:88:in `create_response'
	27: from /var/lib/gems/2.5.0/gems/selenium-webdriver-3.142.7/lib/selenium/webdriver/remote/http/common.rb:88:in `new'
	26: from /var/lib/gems/2.5.0/gems/selenium-webdriver-3.142.7/lib/selenium/webdriver/remote/response.rb:34:in `initialize'
	25: from /var/lib/gems/2.5.0/gems/selenium-webdriver-3.142.7/lib/selenium/webdriver/remote/response.rb:72:in `assert_ok'
	24: from #24 0x7f9e2594088f clone
	23: from #23 0x7f9e275fe6db start_thread
	22: from #22 0x563b00250c8e base::(anonymous namespace)::ThreadFunc()
	21: from #21 0x563b0022b8f7 base::Thread::ThreadMain()
	20: from #20 0x563b001fea4e base::RunLoop::Run()
	19: from #19 0x563b00215d15 base::sequence_manager::internal::ThreadControllerWithMessagePumpImpl::Run()
	18: from #18 0x563b002199aa base::MessagePumpDefault::Run()
	17: from #17 0x563b00215508 base::sequence_manager::internal::ThreadControllerWithMessagePumpImpl::DoWork()
	16: from #16 0x563b00215768 base::sequence_manager::internal::ThreadControllerWithMessagePumpImpl::DoWorkImpl()
	15: from #15 0x563b002082cb base::TaskAnnotator::RunTask()
	14: from #14 0x563afff87395 base::internal::Invoker<>::RunOnce()
	13: from #13 0x563afff86426 (anonymous namespace)::ExecuteSessionCommandOnSessionThread()
	12: from #12 0x563afffab573 base::internal::Invoker<>::Run()
	11: from #11 0x563afffb8d24 ExecuteWindowCommand()
	10: from #10 0x563afffab7ee base::internal::Invoker<>::Run()
	 9: from #9 0x563afff88976 ExecuteElementCommand()
	 8: from #8 0x563afffab6e2 base::internal::Invoker<>::Run()
	 7: from #7 0x563afff88c11 ExecuteClickElement()
	 6: from #6 0x563afff91e43 GetElementClickableLocation()
	 5: from #5 0x563afff92c30 ScrollElementRegionIntoView()
	 4: from #4 0x563afff94a75 (anonymous namespace)::ScrollElementRegionIntoViewHelper()
	 3: from #3 0x563afff95fe4 (anonymous namespace)::VerifyElementClickable()
	 2: from #2 0x563b00020fac Status::Status()
	 1: from #1 0x563b001e2d93 base::debug::StackTrace::StackTrace()
#0 0x563b002447f9 base::debug::CollectStackTrace(): element click intercepted: Element <button type="submit" class="search-submit">...</button> is not clickable at point (1534, 914). Other element would receive the click: <body class="home page-template-default page page-id-2 wp-embed-responsive">...</body> (Selenium::WebDriver::Error::ElementClickInterceptedError)
  (Session info: chrome=85.0.4157.0)
```

- 原因

  - 対象要素がウィンドウにいない状態で、クリックイベントを発火したため

- 対策

  - クリックイベントを発火する前に、対象要素がウィンドウに存在するようにスクロールしてから実行する

  - python等でも出ているぽい
    - https://hacknote.jp/archives/51261/
- 予防
