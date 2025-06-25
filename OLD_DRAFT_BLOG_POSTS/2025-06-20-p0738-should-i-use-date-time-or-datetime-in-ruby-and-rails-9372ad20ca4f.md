---
layout: post
title: "ME:: I didn't know DateTime was deprecated! Mav Tipi:: Should I Use Date, Time, or DateTime in Ruby and Rails? ¦The Startup ¦ Medium"
---
[Discovered](http://rolandtanglao.com/2020/07/29/p1-blogthis-checkvist-list-links-to-blog/): Jun 20, 2025 14:38 [ME:: I didn't know DateTime was deprecated! Mav Tipi:: Should I Use Date, Time, or DateTime in Ruby and Rails? ¦The Startup ¦ Medium](https://medium.com/swlh/should-i-use-date-time-or-datetime-in-ruby-and-rails-9372ad20ca4f) <--  September 2020 ruby language commit from nurse:: [DateTime class is considered deprecated. Use Time class](https://github.com/ruby/date/commit/58ca6e6a3ee20c72a77266e0f74920b12a06ee9d)

## QUOTE

>As of Ruby 3 (released December 24th, 2020, as is Ruby tradition), DateTime only exists for backwards-compatibility. The date library docs recommend you just use Time instead. (I’m pretty sure this was essentially true from 2.0 forward, but now it’s formally true.)

>If you’re someone who googles around for answers (which you are, that’s why you’re here), keep this in mind! A lot of old articles are now misleading.

>This simplifies our question by a lot. The biggest difference between Date and Time is that Date is concerned with days and above; if you care at all about hours, minutes, seconds and below, or think you might care about them in the future, you have to use Time. Date can’t handle any of that.

>On the other hand, here are some things Date can do better than Time:
