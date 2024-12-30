---
layout: post
title: "A: use backslash K to remove any text matched before it CRandER:: How to replace the last occurrence of a substring in ruby? - Stack Overflow"
---
[Discovered](http://rolandtanglao.com/2020/07/29/p1-blogthis-checkvist-list-links-to-blog/): Dec 29, 2024 09:34 [A: use backslash K to remove any text matched before it CRandER:: How to replace the last occurrence of a substring in ruby? - Stack Overflow](https://stackoverflow.com/questions/3185144/how-to-replace-the-last-occurrence-of-a-substring-in-ruby) <-- **QUOTE**: `Since Ruby 2.0 we can use \K which removes any text matched before it from the returned match. Combine with a greedy operator and you get this` <-- For me the following ruby snippet seems to work to remove only the last .php in ".php.blah.php"

```ruby
slug = slug.sub(/.*\K\.[\D]+$/, '') 
```
