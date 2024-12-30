---
layout: post
title: "Open Interpreter running locally:"
---
[Discovered](http://rolandtanglao.com/2020/07/29/p1-blogthis-checkvist-list-links-to-blog/): Sep 18, 2023 11:18  [Open Interpreter running locally:](https://github.com/OpenInterpreter/open-interpreter) `please write me a python program to get the average color of all photos on flickr tagged vancouver` (NB: the bugs, doesn't handle pagination?!? or does it?)
```python
  import flickrapi                                                              
                                                                                
  api_key = "your_api_key"                                                      
                                                                                
  flickr = flickrapi.FlickrAPI(api_key)                                         
                                                                                
  photos = flickr.photos.search(tags="vancouver")                               
                                                                                
  for photo in photos:                                                          
      print(photo.title)                                                        
                         
```
