---
layout: post
title: "HOW TO: to randomly open a jpeg larger than 12MB:: `find . -name '*.JPG' -type f -size +12M -print | sort -R | head -1 | xargs -n 1 open`  super user-unix:: How can I find files that are bigger/smaller than x bytes?"
---
[Discovered](http://rolandtanglao.com/2020/07/29/p1-blogthis-checkvist-list-links-to-blog/): Feb 5, 2025 18:09  [HOW TO: to randomly open a jpeg larger than 12MB:: `find . -name '*.JPG' -type f -size +12M -print ¦ sort -R ¦ head -1 ¦ xargs -n 1 open`  super user-unix:: How can I find files that are bigger/smaller than x bytes?](https://superuser.com/questions/204564/how-can-i-find-files-that-are-bigger-smaller-than-x-bytes) --> **QUOTE** from the macOS `find` man page:  `All primaries which take a numeric argument allow the number to be preceded by a plus sign (“+”) or a minus sign (“-”).  A preceding plus sign means “more than n”, a preceding minus sign means “less than n” and neither means “exactly n”.`
