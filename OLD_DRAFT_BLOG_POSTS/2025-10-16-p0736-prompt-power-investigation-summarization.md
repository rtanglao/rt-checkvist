---
layout: post
title: "ME tl;dr-ing:: Use Promptbooks to make your interactions with LLMs more effective. Maybe I should do this for support reporting. Would be nice if Brandon actually linked to his 5 actual  prompts ; Brandon Dixon:: Prompt Power: Investigation Summarization"
---
[Discovered](http://rolandtanglao.com/2020/07/29/p1-blogthis-checkvist-list-links-to-blog/): Oct 16, 2025 14:36 (UTC)[ME tl;dr-ing:: Use Promptbooks to make your interactions with LLMs more effective. Maybe I should do this for support reporting. Would be nice if Brandon actually linked to his 5 actual  prompts ; Brandon Dixon:: Prompt Power: Investigation Summarization](https://applied-gai-in-security.ghost.io/prompt-power-investigation-summarization/)

## QUOTE

* Read the whole thing: [Brandon Dixon:: Prompt Power: Investigation Summarization](https://applied-gai-in-security.ghost.io/prompt-power-investigation-summarization/)


>I am using Security Copilot to perform my work and executed a promptbook to analyze a suspicious powershell script. This script silently downloads a file from a remote IP address and then executes it on the host system.

>Promptbooks solicit inputs from the user and then run a series of curated prompts that build off previous context to complete a workflow. They take a few minutes to run, but are incredibly powerful. If this concept is new here to learn more, https://learn.microsoft.com/en-us/security-copilot/using-promptbooks#what-are-promptbooks.

>Creating the Summary

>Within my session, I have 5 prompts and responses that were associated with the promptbook. I want to generate a summary of the investigation so that I can preserve this in Security Copilot and share the results with my colleagues. While the contents of the prompts and session are important, they are not needed to demonstrate how different prompts can augment the response. Below, I am going to break down the differing ways I can achieve getting a summary and how crafting a detailed prompt is able to yield far superior results.

>Summarize and nothing more - Simple prompt to get a summary.

>...

> Summarize and guide me - Simple prompt with additional instruction for format and recommendations.

>In this prompt, we retain our simple summary request, but we have now extended the instructions to Security Copilot to form an executive summary and build a list of recommendations. Our output is a small paragraph capturing the session details and the list below becomes actionable next steps. These small changes make a big difference, especially if the user working the investigation has less experience. Also notable, the recommendations go beyond our session context and leverage the security knowledge of the foundation models to give more insight into what to do next. While this response is more actionable, we can do better.

>...

>Summarize, guide me and share your view - Simple prompt with a lot more direction and request for the model to opine.

>... 

>Summarize for management
