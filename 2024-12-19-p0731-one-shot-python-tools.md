---
layout: post
title: "Me:: uv run allows you to run python scripts without requirements.txt Simon Willison:: Building Python tools with a one-shot prompt using uv run and Claude Projects"
---
[Discovered](http://rolandtanglao.com/2020/07/29/p1-blogthis-checkvist-list-links-to-blog/): Dec 19, 2024 07:31  [Me:: uv run allows you to run python scripts without requirements.txt Simon Willison:: Building Python tools with a one-shot prompt using uv run and Claude Projects](https://simonwillison.net/2024/Dec/19/one-shot-python-tools/) <-- I love it! I hate extra files like requirements.txt especially for a 1 file script. i guess i am switching to `uv`

## QUOTE: 
Read the whole thing [Simon Willison:: Building Python tools with a one-shot prompt using uv run and Claude Projects](https://simonwillison.net/2024/Dec/19/one-shot-python-tools/)

>This is an example of inline script dependencies, a feature described in PEP 723 and implemented by uv run. Running the script causes uv to create a temporary virtual environment with those dependencies installed, a process that takes just a few milliseconds once the uv cache has been populated.

>This even works if the script is specified by a URL! Anyone with uv installed can run the following command (provided you trust me not to have replaced the script with something malicious) to debug one of their own S3 buckets`
