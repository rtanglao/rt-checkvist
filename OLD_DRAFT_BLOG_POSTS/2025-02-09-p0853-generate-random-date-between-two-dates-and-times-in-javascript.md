---
layout: post
title: "Me:: Just for fun, generate a random date that I can use to search my flickr archive for posting photos to roland.club  Stack Overflow:: Generate random date between two dates and times in Javascript"
---
[Discovered](http://rolandtanglao.com/2020/07/29/p1-blogthis-checkvist-list-links-to-blog/): Feb 9, 2025 08:53 [Me:: Just for fun, generate a random date that I can use to search my flickr archive for posting photos to roland.club  Stack Overflow:: Generate random date between two dates and times in Javascript](https://stackoverflow.com/questions/31378526/generate-random-date-between-two-dates-and-times-in-javascript)

## JavaScript code randomdate.js
```js
function randomDate(start, end, startHour, endHour) {
  var date = new Date(+start + Math.random() * (end - start));
  var hour = startHour + Math.random() * (endHour - startHour) ¦ 0;
  date.setHours(hour);
  return date;
}
console.log(randomDate(new Date(2004, 0, 1), new Date(), 0, 24))
```
