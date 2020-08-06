https://www.torproject.org/download/

所有者のみが実行できるような構成になっていた

firefoxのブラウザをマスクしているようなイメージ
- https://qiita.com/SuperConsole/items/45c5922d5d7115cd8faf


tor-browserインストール後はデフォルトのfirefoxは直接パス指定しないと実行できない

```
which firefox
/home/aine/tor-browser_en-US/Browser/firefox
```

dockerコンテナ上で起動した

```
firefox
```


起動直後、画面出てくるので、tor-connectボタンを押下する


起動時のログ

```
$ firefox
Gtk-Message: 03:57:14.555: Failed to load module "canberra-gtk-module"
Gtk-Message: 03:57:14.556: Failed to load module "canberra-gtk-module"
Aug 05 18:57:15.616 [notice] Tor 0.4.3.6 (git-30711296fd5b7f51) running on Linux with Libevent 2.1.11-stable, OpenSSL 1.1.1g, Zlib 1.2.11, Liblzma N/A, and Libzstd N/A.
Aug 05 18:57:15.616 [notice] Tor can't help you if you use it wrong! Learn how to be safe at https://www.torproject.org/download/download#warning
Aug 05 18:57:15.616 [notice] Read configuration file "/home/aine/tor-browser_en-US/Browser/TorBrowser/Data/Tor/torrc-defaults".
Aug 05 18:57:15.616 [notice] Read configuration file "/home/aine/tor-browser_en-US/Browser/TorBrowser/Data/Tor/torrc".
Aug 05 18:57:15.617 [notice] Opening Control listener on 127.0.0.1:9151
Aug 05 18:57:15.617 [notice] Opened Control listener on 127.0.0.1:9151
Aug 05 18:57:15.617 [notice] DisableNetwork is set. Tor will not make or accept non-control network connections. Shutting down all existing connections.
Aug 05 18:57:15.000 [notice] Parsing GEOIP IPv4 file /home/aine/tor-browser_en-US/Browser/TorBrowser/Data/Tor/geoip.
Aug 05 18:57:15.000 [notice] Parsing GEOIP IPv6 file /home/aine/tor-browser_en-US/Browser/TorBrowser/Data/Tor/geoip6.
Aug 05 18:57:15.000 [notice] Bootstrapped 0% (starting): Starting
Aug 05 18:57:15.000 [notice] Starting with guard context "default"
Aug 05 18:57:15.000 [notice] Delaying directory fetches: DisableNetwork is set.
Aug 05 18:57:15.000 [notice] New control connection opened from 127.0.0.1.
Aug 05 18:57:15.000 [notice] DisableNetwork is set. Tor will not make or accept non-control network connections. Shutting down all existing connections.
Aug 05 18:57:15.000 [notice] New control connection opened from 127.0.0.1.
Gtk-Message: 18:57:15.867: Failed to load module "canberra-gtk-module"
Gtk-Message: 18:57:15.868: Failed to load module "canberra-gtk-module"
Gtk-Message: 18:57:16.892: Failed to load module "canberra-gtk-module"
Gtk-Message: 18:57:16.893: Failed to load module "canberra-gtk-module"
Aug 05 18:58:43.000 [notice] DisableNetwork is set. Tor will not make or accept non-control network connections. Shutting down all existing connections.
Aug 05 18:58:43.000 [notice] DisableNetwork is set. Tor will not make or accept non-control network connections. Shutting down all existing connections.
Aug 05 18:58:43.000 [notice] DisableNetwork is set. Tor will not make or accept non-control network connections. Shutting down all existing connections.
Aug 05 18:58:43.000 [notice] Opening Socks listener on 127.0.0.1:9150
Aug 05 18:58:43.000 [notice] Opened Socks listener on 127.0.0.1:9150
Aug 05 18:58:43.000 [notice] Renaming old configuration file to "/home/aine/tor-browser_en-US/Browser/TorBrowser/Data/Tor/torrc.orig.1"
Aug 05 18:58:43.000 [notice] Bootstrapped 5% (conn): Connecting to a relay
Aug 05 18:58:44.000 [notice] Bootstrapped 10% (conn_done): Connected to a relay
Aug 05 18:58:44.000 [notice] Bootstrapped 14% (handshake): Handshaking with a relay
Aug 05 18:58:45.000 [notice] Bootstrapped 15% (handshake_done): Handshake with a relay done
Aug 05 18:58:45.000 [notice] Bootstrapped 20% (onehop_create): Establishing an encrypted directory connection
Aug 05 18:58:45.000 [notice] Bootstrapped 25% (requesting_status): Asking for networkstatus consensus
Aug 05 18:58:45.000 [notice] Bootstrapped 30% (loading_status): Loading networkstatus consensus
Aug 05 18:58:47.000 [notice] I learned some more directory information, but not enough to build a circuit: We have no usable consensus.
Aug 05 18:58:47.000 [notice] Bootstrapped 40% (loading_keys): Loading authority key certs
Aug 05 18:58:47.000 [notice] The current consensus has no exit nodes. Tor can only build internal paths, such as paths to onion services.
Aug 05 18:58:47.000 [notice] Bootstrapped 45% (requesting_descriptors): Asking for relay descriptors
Aug 05 18:58:47.000 [notice] I learned some more directory information, but not enough to build a circuit: We need more microdescriptors: we have 0/6821, and can only build 0% of likely paths. (We have 0% of guards bw, 0% of midpoint bw, and 0% of end bw (no exits in consensus, using mid) = 0% of path bw.)
Aug 05 18:58:49.000 [notice] Bootstrapped 50% (loading_descriptors): Loading relay descriptors
Aug 05 18:58:50.000 [notice] The current consensus contains exit nodes. Tor can build exit and internal paths.
Aug 05 18:58:51.000 [notice] Bootstrapped 57% (loading_descriptors): Loading relay descriptors
Aug 05 18:58:51.000 [notice] Bootstrapped 64% (loading_descriptors): Loading relay descriptors
Aug 05 18:58:52.000 [notice] Bootstrapped 75% (enough_dirinfo): Loaded enough directory info to build circuits
Aug 05 18:58:52.000 [notice] Bootstrapped 80% (ap_conn): Connecting to a relay to build circuits
Aug 05 18:58:52.000 [notice] Bootstrapped 85% (ap_conn_done): Connected to a relay to build circuits
Aug 05 18:58:52.000 [notice] Bootstrapped 89% (ap_handshake): Finishing handshake with a relay to build circuits
Aug 05 18:58:53.000 [notice] Bootstrapped 90% (ap_handshake_done): Handshake finished with a relay to build circuits
Aug 05 18:58:53.000 [notice] Bootstrapped 95% (circuit_create): Establishing a Tor circuit
Aug 05 18:58:54.000 [notice] Bootstrapped 100% (done): Done
Aug 05 18:58:54.000 [notice] New control connection opened from 127.0.0.1.
Aug 05 18:58:54.000 [notice] New control connection opened from 127.0.0.1.
Gtk-Message: 18:58:54.765: Failed to load module "canberra-gtk-module"
Gtk-Message: 18:58:54.766: Failed to load module "canberra-gtk-module"
```

