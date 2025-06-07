---
layout: post
title: "Map and Nested Lists"
---
[Discovered](http://rolandtanglao.com/2020/07/29/p1-blogthis-checkvist-list-links-to-blog/): Apr 28, 2022. 07:26 [Map and Nested Lists](https://kieranhealy.org/blog/archives/2022/04/27/map-and-nested-lists/) <--- QUOTE:
```
On StackOverflow, a questioner with a bunch of data frames (already existing as objects 
in their environment) wanted to split each of them into two based on some threshold 
being met, or not, on a specific column. Every one of the data frames had this column 
in it. Their thought was that they’d write a loop, or use lapply after putting the data 
frames in a list, and write a function that split the data fames, named each one, and 
wrote them out as separate objects in the environment.

Here’s a tidyverse solution that avoids the need to explicitly write loops, using 
map instead of lapply. (I have no particular dislike of lapply et fam, I’ll just be 
working with the tidyverse equivalents.)
```
<---  R functional stuff and  tidyverse stuff which clearly I only understand at a superficial level :-)
