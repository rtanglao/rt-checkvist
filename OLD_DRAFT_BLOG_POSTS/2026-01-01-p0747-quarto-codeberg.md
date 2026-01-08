---
layout: post
title: "ME:: tl;dr-ing: How to make a static website on Codeberg using R and Quarto ; Ken Butler:: Quarto websites and Codeberg pages (part 1)"
---
[Discovered](http://rolandtanglao.com/2020/07/29/p1-blogthis-checkvist-list-links-to-blog/): Jan 1, 2026 15:47 (UTC) [ME:: tl;dr-ing: How to make a static website on Codeberg using R and Quarto ; Ken Butler:: Quarto websites and Codeberg pages (part 1)](https://blog.ritsokiguess.site/posts/quarto-codeberg/)

## QUOTE

* Read the whole thing: [Ken Butler:: Quarto websites and Codeberg pages (part 1)](https://blog.ritsokiguess.site/posts/quarto-codeberg/)

>One of the things Quarto can produce is a static website (meaning, it turns your content into a website that a user can look at but not interact with). This is ideal for websites for courses or workshops, where the idea is to provide material for your students to work with, or (at least in part) for a blog, where the idea is to share your ideas with the world. (In a blog, you might want to enable comments, but that is another story that we do not get into here.) A standard way to share these with the world was to use Github Pages, where you set your website up as a Github repo, and then configured the Pages part of Settings, and got a URL that would display the site.

>One thing that Github Pages has going for it is that the mechanism is fairly simple, and Quarto has a “publish gh-pages” that will handle most of the details for you. Codeberg has its own equivalent, Codeberg Pages, that works a bit differently. The website you want to publish has to be two things:

>* on a branch called pages
>*  in the root folder of the repo.

>I have a couple of ways of making this work, which may not be elegant, but they appear to work. The elegance, I leave to others.
