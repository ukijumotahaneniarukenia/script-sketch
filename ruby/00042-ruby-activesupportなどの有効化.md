```
aine-MS-7B98 (aine)  17:32:32  ruby  (master)  ruby -ractive_support/all ''
^CTraceback (most recent call last):
ruby: Interrupt

aine-MS-7B98 (aine)  17:32:35  ruby  (master)  ruby -ractive_support/all -e ''
Traceback (most recent call last):
	1: from /usr/local/lib/ruby/2.7.0/rubygems/core_ext/kernel_require.rb:92:in `require'
/usr/local/lib/ruby/2.7.0/rubygems/core_ext/kernel_require.rb:92:in `require': cannot load such file -- active_support/all (LoadError)


aine-MS-7B98 (root)  17:34:50  ruby  (master)  gem install activesupport
Fetching concurrent-ruby-1.1.6.gem
Fetching activesupport-6.0.3.2.gem
Fetching thread_safe-0.3.6.gem
Fetching tzinfo-1.2.7.gem
Fetching i18n-1.8.3.gem
Fetching zeitwerk-2.3.0.gem
Successfully installed concurrent-ruby-1.1.6

HEADS UP! i18n 1.1 changed fallbacks to exclude default locale.
But that may break your application.

If you are upgrading your Rails application from an older version of Rails:

Please check your Rails app for 'config.i18n.fallbacks = true'.
If you're using I18n (>= 1.1.0) and Rails (< 5.2.2), this should be
'config.i18n.fallbacks = [I18n.default_locale]'.
If not, fallbacks will be broken in your app by I18n 1.1.x.

If you are starting a NEW Rails application, you can ignore this notice.

For more info see:
https://github.com/svenfuchs/i18n/releases/tag/v1.1.0

Successfully installed i18n-1.8.3
Successfully installed thread_safe-0.3.6
Successfully installed tzinfo-1.2.7
Successfully installed zeitwerk-2.3.0
Successfully installed activesupport-6.0.3.2
Parsing documentation for concurrent-ruby-1.1.6
Installing ri documentation for concurrent-ruby-1.1.6
Parsing documentation for i18n-1.8.3
Installing ri documentation for i18n-1.8.3
Parsing documentation for thread_safe-0.3.6
Installing ri documentation for thread_safe-0.3.6
Parsing documentation for tzinfo-1.2.7
Installing ri documentation for tzinfo-1.2.7
Parsing documentation for zeitwerk-2.3.0
Installing ri documentation for zeitwerk-2.3.0
Parsing documentation for activesupport-6.0.3.2
Installing ri documentation for activesupport-6.0.3.2
Done installing documentation for concurrent-ruby, i18n, thread_safe, tzinfo, zeitwerk, activesupport after 5 seconds
6 gems installed


aine-MS-7B98 (aine)  17:35:37  ruby  (master)  ruby -ractive_support/all -e ''

```
