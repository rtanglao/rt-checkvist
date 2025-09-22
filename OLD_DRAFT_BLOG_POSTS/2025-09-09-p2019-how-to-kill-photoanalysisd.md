---
layout: post
title: "ME: this seems to work on macOS Big Sur 11.7 ;  huksley's github gist:: Disabling photoanalysisd on macOS"
---
[Discovered](http://rolandtanglao.com/2020/07/29/p1-blogthis-checkvist-list-links-to-blog/): Sep 10, 2025 03:19 (UTC)[ME: this seems to work on macOS Big Sur 11.7 ;  huksley's github gist:: Disabling photoanalysisd on macOS](https://gist.github.com/huksley/564be2c903312bcee7dffe415d128f90)

The following seemed to work on 11.7, note that this changed slightly in Monterrey and later ; read the gist for those newer macOS versions:

`launchctl disable gui/$UID/com.apple.photoanalysisd`
`launchctl kill -TERM gui/$UID/com.apple.photoanalysisd`
