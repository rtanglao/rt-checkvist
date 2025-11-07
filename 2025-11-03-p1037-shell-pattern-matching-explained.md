---
layout: post
title: "ME:: find is often easier to use with shell pattern matching instead of regular expressions! ; How to randomly open a jpeg or JPG or JPEG or jpg file ; explainshell.com - find . -type f \( -iname '*.jpg' -o -iname '*.jpeg' \) ¦ sort -R ¦ head -1 ¦ xargs -n 1 open"
---
[Discovered](http://rolandtanglao.com/2020/07/29/p1-blogthis-checkvist-list-links-to-blog/): Nov 3, 2025 18:37 (UTC) [ME:: find is often easier to use with shell pattern matching instead of regular expressions! ; How to randomly open a jpeg or JPG or JPEG or jpg file ; explainshell.com - find . -type f \( -iname "*.jpg" -o -iname "*.jpeg" \) ¦ sort -R ¦ head -1 ¦ xargs -n 1 open](https://explainshell.com/explain?cmd=find+.+-type+f+%5C%28+-iname+%22*.jpg%22+-o+-iname+%22*.jpeg%22+%5C%29+%7C+sort+-R+%7C+head+-1+%7C+xargs+-n+1+open)
## Key Details
* shell pattern matching seems (not sure how up to date this is) to be documented in gnu's docs at [2.3.4 Shell Pattern Matching](https://www.gnu.org/software/findutils/manual/html_node/find_html/Shell-Pattern-Matching.html) and [Peter Seebach's Patterns and string processing in shell scripts](https://www.linux.com/news/patterns-and-string-processing-shell-scripts/)
* you can use regular expressions in find using the `-regex` (probably want to also use `-E` for `extended modern regular expressions` ) and if you do regular expressions test with an online simulator like [regex101](https://regex101.com/)
* case insensitive shell pattern `-iname pattern`

>Like  -name,  but  the match is case insensitive.  For example, the patterns `fo*' and `F??' match
       the file names `Foo', `FOO', `foo', `fOo', etc.   In these patterns, unlike filename expansion  by
       the  shell,  an  initial  '.' can be matched by `*'.  That is, find -name *bar will match the file
       `.foobar'.   Please note that you should quote patterns as a matter of course, otherwise the shell
       will expand any wildcard characters in them.

* within a shell pattern, `-o` means `OR`, `-a` means `AND`
