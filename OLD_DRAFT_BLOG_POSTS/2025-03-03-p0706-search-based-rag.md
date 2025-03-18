---
layout: post
title: "Me:: finally somebody showing us how this is done, need more examples like this. It's like sample code, we need more sample prompt sessions! Wonder if things have changed in March 2025 ; June 2024:: Simon Willison:: Building search-based RAG using Claude, Datasette and Val Town"
---
[Discovered](http://rolandtanglao.com/2020/07/29/p1-blogthis-checkvist-list-links-to-blog/): Mar 3, 2025 07:06 [Me:: finally somebody showing us how this is done, need more examples like this. It's like sample code, we need more sample prompt sessions! Wonder if things have changed in March 2025 ; June 2024:: Simon Willison:: Building search-based RAG using Claude, Datasette and Val Town](https://simonwillison.net/2024/Jun/21/search-based-rag/)

## QUOTE

Read the whole thing [June 2024:: Simon Willison:: Building search-based RAG using Claude, Datasette and Val Town](https://simonwillison.net/2024/Jun/21/search-based-rag/)

>Retrieval Augmented Generation (RAG) is a technique for adding extra “knowledge” to systems built on LLMs, allowing them to answer questions against custom information not included in their training data. A common way to implement this is to take a question from a user, translate that into a set of search queries, run those against a search engine and then feed the results back into the LLM to generate an answer.

>I built a basic version of this pattern against the brand new Claude 3.5 Sonnet language model, using SQLite full-text search running in Datasette as the search backend and Val Town as the prototyping platform.

>The implementation took just over an hour, during a live coding session with Val.Town founder Steve Krouse. I was the latest guest on Steve’s live streaming series where he invites people to hack on projects with his help
