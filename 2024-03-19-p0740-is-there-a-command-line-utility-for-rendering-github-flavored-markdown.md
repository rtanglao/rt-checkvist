---
layout: post
title: "Is there a command line utility for rendering GitHub flavored Markdown? - Stack Overflow"
---
[Discovered](http://rolandtanglao.com/2020/07/29/p1-blogthis-checkvist-list-links-to-blog/): Mar 19, 2024 07:40 [Is there a command line utility for rendering GitHub flavored Markdown? - Stack Overflow](https://stackoverflow.com/questions/7694887/is-there-a-command-line-utility-for-rendering-github-flavored-markdown) <-- Answer: use grip which is a Python library or pandoc or the Github's own github-markdown gem. Pandoc doesn't do GFM out of the box. <-- `puts GitHub::Markdown.render_gfm File.read(ARGV[0])`
