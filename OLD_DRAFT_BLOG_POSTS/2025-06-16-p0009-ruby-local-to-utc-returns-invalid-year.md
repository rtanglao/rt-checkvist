---
layout: post
title: "Me:: this is where i found out about utc_to_local ;; date - Ruby local_to_utc returns invalid year - Stack Overflow"
---
[Discovered](http://rolandtanglao.com/2020/07/29/p1-blogthis-checkvist-list-links-to-blog/): Jun 16, 2025 00:09 [Me:: this is where i found out about utc_to_local ;; date - Ruby local_to_utc returns invalid year - Stack Overflow](https://stackoverflow.com/questions/24616288/ruby-local-to-utc-returns-invalid-year)

## QUOTE:

See my code in : [blogthis.rb](https://github.com/rtanglao/rt-checkvist/blob/main/blogthis.rb)
```ruby
t = TZInfo::Timezone.get('America/Vancouver').utc_to_local(DateTime.parse(created_at))
```

Inspired by:

```ruby
TZInfo::Timezone.get('US/Eastern').local_to_utc(DateTime.parse(date_src))
# => #<DateTime: 2014-07-08T03:10:00+00:00 ((2456847j,11400s,0n),+0s,2299161j)>
```
