---
layout: post
title: "ME:: is programming with local LLM inference better or worse a year later? My guess is (based on Simon Willison) that it's a wee bit better ; Chris Wellons:: November 10, 2024:: Everything I've learned so far about running local LLMs ; 'I really tried, but never saw LLM output beyond 2–3 lines of code which I would consider acceptable.'"
---
[Discovered](http://rolandtanglao.com/2020/07/29/p1-blogthis-checkvist-list-links-to-blog/): Oct 13, 2025 18:59 (UTC) [ME:: is programming with local LLM inference better or worse a year later? My guess is (based on Simon Willison) that it's a wee bit better ; Chris Wellons:: November 10, 224:: Everything I've learned so far about running local LLMs](https://nullprogram.com/blog/2024/11/10/) 

### QUOTE: 

* Read the whole thing:  [ Chris Wellons:: November 10, 224:: Everything I've learned so far about running local LLMs](https://nullprogram.com/blog/2024/11/10/) 

>The next group are “coder” models trained for programming. In particular, they have fill-in-the-middle (FIM) training for generating code inside an existing program. I’ll discuss what that entails in a moment. As far as I can tell, they’re no better at code review nor other instruct-oriented tasks. It’s the opposite: FIM training is done in the base model, with instruct training applied later on top, so instruct works against FIM! In other words, base model FIM outputs are markedly better, though you lose the ability to converse with them.

>...

>Third, **LLMs are poor programmers**. At best they write code at maybe an undergraduate student level who’s read a lot of documentation. That sounds better than it is. The typical fresh graduate enters the workforce knowing practically nothing about software engineering. Day one on the job is the first day of their real education. In that sense, LLMs today haven’t even begun their education.

>To be fair, that LLMs work as well as they do is amazing! Thrown into the middle of a program in my unconvential style, LLMs figure it out and make use of the custom interfaces. (Caveat: My code and writing is in the training data of most of these LLMs.) So the more context, the better, within the effective context length. The challenge is getting something useful out of an LLM in less time than writing it myself.

>Writing new code is the easy part. The hard part is maintaining code, and writing new code with that maintenance in mind. Even when an LLM produces code that works, there’s no thought to maintenance, nor could there be. In general the reliability of generate code follows the inverse square law by length, and generating more than a dozen lines at a time is fraught. I really tried, but never saw LLM output beyond 2–3 lines of code which I would consider acceptable.

> Quality varies substantially by language. LLMs are better at Python than C, and better at C than assembly. I suspect it’s related to the difficulty of the language and the quality of the input. It’s trained on lots of terrible C — the internet is loaded with it after all — and probably the only labeled x86 assembly it’s seen is crummy beginner tutorials. Ask it to use SDL2 and it reliably produces the common mistakes because it’s been trained to do so.

> What about boilerplate? That’s something an LLM could probably do with a low error rate, and perhaps there’s merit to it. Though the fastest way to deal with boilerplate is to not write it at all. Change your problem to not require boilerplate.

> Without taking my word for it, consider how it show up in the economics: If AI companies could deliver the productivity gains they claim, they wouldn’t sell AI. They’d keep it to themselves and gobble up the software industry. Or consider the software products produced by companies on the bleeding edge of AI. It’s still the same old, bloated web garbage everyone else is building. (My LLM research has involved navigating their awful web sites, and it’s made be bitter.)

