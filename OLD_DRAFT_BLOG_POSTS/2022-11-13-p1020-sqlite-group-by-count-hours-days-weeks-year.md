---
layout: post
title: "android - SQLite group by/count hours, days, weeks, year - Stack Overflow"
---
[Discovered](http://rolandtanglao.com/2020/07/29/p1-blogthis-checkvist-list-links-to-blog/): Nov 13, 2022 10:20 [android - SQLite group by/count hours, days, weeks, year - Stack Overflow](https://stackoverflow.com/questions/17821136/sqlite-group-by-count-hours-days-weeks-year) <--- yay for sqlite <--- QUOTE `SELECT strftime('%m', timestamp), count(*) FROM Data
WHERE timestamp >= strftime('%s', '2012-01-01 00:00:00') 
AND timestamp < strftime('%s', '2013-01-01 00:00:00') 
GROUP BY strftime('%m', timestamp);` <-- see also [How to group by week no and get start date and end date for the week number in Sqlite?](https://stackoverflow.com/questions/9322313/how-to-group-by-week-no-and-get-start-date-and-end-date-for-the-week-number-in-s)
