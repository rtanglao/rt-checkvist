---
layout: post
title: "Periodic reminder :-) HOW TO: get all Thunderbird Desktop and Android SUMO KB articles"
---
[Discovered](http://rolandtanglao.com/2020/07/29/p1-blogthis-checkvist-list-links-to-blog/): Jun 2, 2026 02:27 (UTC) [Periodic reminder :-) HOW TO: get all Thunderbird Desktop and Android SUMO KB articles](https://lite.datasette.io/?csv=https%3A%2F%2Fraw.githubusercontent.com%2Fthunderbird%2Fgithub-action-thunderbird-kb%2Frefs%2Fheads%2Fmain%2Fdetails-allproducts-kb-title-slug-all-articles.csv#/data?sql=select+url+from+%5Bdetails-allproducts-kb-title-slug-all-articles%5D+where+products_str+like+%27%25thunderbird%25%27)

### SQLite query

```sql
select url from [details-allproducts-kb-title-slug-all-articles] 
where products_str like '%thunderbird%'
```
