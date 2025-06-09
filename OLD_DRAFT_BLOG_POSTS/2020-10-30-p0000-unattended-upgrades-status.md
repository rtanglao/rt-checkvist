---
layout: post
title: "Unattended upgrades status?"
---
[Discovered](http://rolandtanglao.com/2020/07/29/p1-blogthis-checkvist-list-links-to-blog/): Oct 30, 2020. [Unattended upgrades status?](https://askubuntu.com/questions/934807/unattended-upgrades-status) <-- Ubuntu does automatic upgrades using the `unattended` process at random times: `less /var/log/unattended-upgrades/unattended-upgrades.log` shows the upgrades that are queued up and  `tail -f /var/log/unattended-upgrades/unattended-upgrades-dpkg.log` shows the upgrades in real time as they happen
