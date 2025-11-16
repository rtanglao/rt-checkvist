---
layout: post
title: "without-link-blogthis.rb: new ruby script for blog posts that don't reference a link I call this from linkless_blog_all_open.rb."
---
* format is `title followed by blank line followed by rest of the post in markdown format` for example:
**Start of awesome post in a checkvist list item**
```markdown
awesome title
awesome rest of the post. **awesome bold text**
```
**End of awesome post in a checkvist list item** 
* [without-link-blogthis.rb](https://github.com/rtanglao/rt-checkvist/blob/main/without-link-blogthis.rb) autocreates the slug from the first line of a list item in a checkvist list (using the title with stop words removed) 
* [linkless_blog_all_open.rb](https://github.com/rtanglao/rt-checkvist/blob/main/linkless_blog_all_open.rb) calls without_blogthis.rb to create blog posts in jekyll format from my all open list items in my 'blog this' [checkvist list 936619](https://checkvist.com/checklists/936619) after you type 'y' to approve it
* Oh and along the way I improved my scripts so you don't have to explicitly add the creation date. The created date is read from the checkvist api field `created_at`. Ruby code:
```ruby
t = Time.parse(created_at)
logger.debug("created_at: #{t.ai}")
time_discovered_slug = t.getlocal.strftime('%Y-%m-%d-p%H%M')
```
## Previously
* December 28, 2024: [my ruby script that's responsible for my flurry of recent blog posts is called blog_all_open.rb.. It calls blogthis.rb to create blog posts in jekyll format with a nice slug from my all open list items in my 'blog this' checkvist list 74286 after you type 'y' to approve it](https://rolandtanglao.com/2024/12/28/p1718-blog_all_open/)
