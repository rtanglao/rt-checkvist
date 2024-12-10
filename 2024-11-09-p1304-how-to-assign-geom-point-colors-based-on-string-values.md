---
layout: post
title: "r - How to assign geom_point colors based on string values by creating a colour column with a logical vector - Stack Overflow"
---
[Discovered](http://rolandtanglao.com/2020/07/29/p1-blogthis-checkvist-list-links-to-blog/): Nov 9, 2024 13:04  [r - How to assign geom_point colors based on string values by creating a colour column with a logical vector - Stack Overflow](https://stackoverflow.com/questions/59922387/how-to-assign-geom-point-colors-based-on-string-values) <-- `grepl` creates a logical vector in the following code snippet: `geom_point(data = dd, mapping = aes(x = mean_longitude, y = mean_latitude, colour = grepl("^HFX",location)),size = 4, alpha = 0.5) +scale_color_discrete(breaks=c(0,1),labels=c("NSTR","HFX"))`
