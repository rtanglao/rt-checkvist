---
layout: post
title: "Adële's blog:: Small, simple with no CSS tricks 'dumb' graphical mastodon client Home Timeline - SmolFedi/smolfedi.pollux.casa"
---
[Discovered](http://rolandtanglao.com/2020/07/29/p1-blogthis-checkvist-list-links-to-blog/): Nov 12, 2026 04:10 (UTC) [Adële's blog:: Small, simple with no CSS tricks 'dumb' graphical mastodon client Home Timeline - SmolFedi/smolfedi.pollux.casa](https://smolfedi.pollux.casa/)

- [The Fediverse deserves a dumb graphical client ¦ Adële's blog](https://adele.pages.casa/md/blog/the-fediverse-deserves-a-dumb-graphical-client.md)

## QUOTE:

>What I wanted was something in between: a client that runs in a plain browser, handles images properly, but does not require a JavaScript engine to display a list of posts. The API returns JSON; a server-side script can turn that JSON into HTML just fine. We have been doing that for 25 years.

>So I built **[SmolFedi](https://codeberg.org/adele/smolfedi)**.

>It is a PHP application. No npm, no Composer, no build step. It uses a SQLite database and basic PHP sessions. Every page is generated server-side and sent as plain HTML. It supports multiple accounts, timelines, notifications, polls, media attachments with alt text, content warnings, compose, reply, boost, favourite, everything I actually use day to day. CSS stays within [smolweb Grade B](https://smolweb.org/css-grading.html). There is not a single line of JavaScript in the codebase.

>It works with Mastodon, GoToSocial and certainly other compatible Fediverse platforms. It works in Firefox, in Chromium, in Safari, in any browser that can render HTML and display a JPEG such as Dillo or Netsurf.

>I am not claiming this is the right client for everyone. If you want a smooth single-page experience with live updates and animations, SmolFedi is not that. But if you want to browse the Fediverse on a modest device, a slow connection, or simply a setup where you would rather not run megabytes of JavaScript fetched from the web, SmolFedi is for you.

>The source is on [Codeberg](https://codeberg.org/adele/smolfedi) and a demo instance on [Pollux](https://smolfedi.pollux.casa)
