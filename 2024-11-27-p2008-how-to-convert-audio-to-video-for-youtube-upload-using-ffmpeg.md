---
layout: post
title: "How to Convert Audio to Video for Youtube Upload Using FFmpeg - Bannerbear"
---
[Discovered](http://rolandtanglao.com/2020/07/29/p1-blogthis-checkvist-list-links-to-blog/): Nov 27, 2024 20:08 [How to Convert Audio to Video for Youtube Upload Using FFmpeg - Bannerbear](https://www.bannerbear.com/blog/how-to-convert-audio-to-video-for-youtube-upload-using-ffmpeg/#convert-mp3-to-mp4-with-an-image) <-- this worked with a 256x256px image! --> **QUOTE**: `ffmpeg -loop 1 -i image.jpg -i input.mp3 -c:v libx264 -vf "pad=ceil(iw/2)*2:ceil(ih/2)*2" -shortest output_image.mp4`
