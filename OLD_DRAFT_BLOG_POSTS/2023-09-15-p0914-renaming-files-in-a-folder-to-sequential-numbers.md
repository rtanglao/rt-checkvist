---
layout: post
title: "bash - Renaming files in a folder to sequential numbers - Stack Overflow"
---
[Discovered](http://rolandtanglao.com/2020/07/29/p1-blogthis-checkvist-list-links-to-blog/): Sep 15, 2023 09:14 [bash - Renaming files in a folder to sequential numbers - Stack Overflow](https://stackoverflow.com/questions/3211595/renaming-files-in-a-folder-to-sequential-numbers) <-- `ls -1prt ¦ grep -v "/$" ¦ cat -n ¦ while read n f; do mv -n "${f}" "$(printf "%04d" $n).${f#*.}";`
