---
layout: post
title: "Getting Started with Sentiment Analysis using Python"
---
[Discovered](http://rolandtanglao.com/2020/07/29/p1-blogthis-checkvist-list-links-to-blog/): Dec 3, 2023 09:21 [Getting Started with Sentiment Analysis using Python](https://huggingface.co/blog/sentiment-analysis-python) <-- 5 lines of python code, is this huggingface sentiment better than other python sentiment analysis tools?
```python
pip install -q transformers
from transformers import pipeline
sentiment_pipeline = pipeline("sentiment-analysis")
data = ["I love you", "I hate you"]
sentiment_pipeline(data)
```
