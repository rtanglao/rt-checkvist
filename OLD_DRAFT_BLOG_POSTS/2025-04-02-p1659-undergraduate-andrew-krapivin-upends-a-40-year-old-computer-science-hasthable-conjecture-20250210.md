---
layout: post
title: "ME:: divide an array into sub arrays and insert into the first 2 sub arrays plus some magic = faster hash tables, will we see this in Rust, Python, Ruby soon? :-) ; Steve Nadis:: Undergraduate Andrew Krapivin Upends a 40-Year-Old Data Science Conjecture | Quanta Magazine"
---
[Discovered](http://rolandtanglao.com/2020/07/29/p1-blogthis-checkvist-list-links-to-blog/): Apr 2, 2025 16:59 [ME:: divide an array into sub arrays and insert into the first 2 sub arrays plus some magic = faster hash tables, will we see this in Rust, Python, Ruby soon? :-) ; Steve Nadis:: Undergraduate Andrew Krapivin Upends a 40-Year-Old Data Science Conjecture ¦ Quanta Magazine](https://www.quantamagazine.org/undergraduate-upends-a-40-year-old-data-science-conjecture-20250210/) <-- **QUOTE**: "Together, Krapivin (now a graduate student at the University of Cambridge), Farach-Colton (now at New York University) and Kuszmaul demonstrated in a January 2025 paper, [Optimal Bounds for Open Addressing Without Reordering](https://arxiv.org/html/2501.02305v1#S2), that this new hash table can indeed find elements faster than was considered possible. ln so doing, they had disproved a conjecture long held to be true."

## Aendrin's Explanation on Reddit

* Read the whole thing: [Aendrin's comment](https://old.reddit.com/r/programming/comments/1in5hkt/undergraduate_upends_a_40yearold_data_science/mcb34rx/)

### QUOTE

>In this comment, I'm just going to go over the method that they call elastic probing in the paper. The basic idea of this approach is to split the array into sub-arrays of descending size, and only care about two of the sub-arrays at a time. We keep working on the first two sub-arrays until the first is twice as full as the eventual fullness, and then move our window. By doing extra work in early insertions, later insertions are much easier.
