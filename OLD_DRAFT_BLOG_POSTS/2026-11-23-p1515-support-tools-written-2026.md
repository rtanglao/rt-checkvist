---
layout: post
title: "Support tools I have 'written' in 2026"
---
* [Draft](https://checkvist.com/p/MVg7Me1Z01Rz7KOTRFjBf1) [created](https://rolandtanglao.com/2025/11/14/p0908-without-link-blogthis-linkless_blog_all_open/): Nov 23, 2026 22:15 (UTC).
This post lists the tools that I have `written` in the [thunderbird](https://github.com/thunderbird) GitHub organization. Production is Y for tools that are ready for production use. The add-ons are not signed yet, so the links go to the unsigned add-on and to instructions for it. I have removed the private tools.
The list was made on 2026-11-21 with `tools_post.py` ([private repo link](https://github.com/thunderbird/thunderbird-support-blog-backups/tree/main/tools-post)).
¦ Name: ¦ Production ¦ Comment ¦
¦ --- ¦ --- ¦ --- ¦
¦ Thundermail DNS tool: [web app](https://thunderbird.github.io/dns-scripts/), [command line script `verify_thundermail_dns.py`](https://github.com/thunderbird/dns-scripts/blob/main/verify_thundermail_dns.py), [docs](https://github.com/thunderbird/dns-scripts#readme) ¦ Y ¦  ¦
¦ SUMO Forum API scraper: [repo and docs](https://github.com/thunderbird/aaq-scraper) ¦ Y ¦  ¦
¦ SUMO Linter: [web app](https://thunderbird.github.io/sumo-linter/), [repo and docs](https://github.com/thunderbird/sumo-linter) ¦ N ¦  ¦
¦ Thunderbird Desktop automated screenshot tool (`tb_shot.py` tour in sumo-linter): [repo](https://github.com/thunderbird/sumo-linter), [issue #55](https://github.com/thunderbird/sumo-linter/issues/55) ¦ N ¦  ¦
¦ SUMO Knowledge Base tools (draft, edit and publish articles with Google Docs): [repo and docs](https://github.com/thunderbird/support-tools) ¦ N ¦  ¦
¦ SUMO Knowledge Base revision scripts (save a user's KB revisions in SQLite, report approved and changed articles): [`kb_revisions.py`](https://github.com/thunderbird/knowledgebase-issues/blob/main/kb_revisions.py), [`kb_approved_report.py`](https://github.com/thunderbird/knowledgebase-issues/blob/main/kb_approved_report.py), [`kb_changed_report.py`](https://github.com/thunderbird/knowledgebase-issues/blob/main/kb_changed_report.py), [browse the data in Datasette Lite](https://lite.datasette.io/?sql=https://raw.githubusercontent.com/thunderbird/knowledgebase-issues/main/kb_revisions.sql), [docs](https://github.com/thunderbird/knowledgebase-issues#readme) ¦ N ¦  ¦
¦ SUMO Forum data GitHub Actions: [Thunderbird Desktop questions](https://github.com/thunderbird/github-action-thunderbird-aaq), [Thunderbird for Android questions](https://github.com/thunderbird/github-action-tbandroid-aaq), [Knowledge Base articles](https://github.com/thunderbird/github-action-thunderbird-kb) ¦ N ¦  ¦
¦ Regular expression SUMO Forum spike detector: [Project 1 spike reports](https://github.com/thunderbird/thunderbird-metrics-and-reports/tree/main/PROJECT1), [first experiment](https://github.com/thunderbird/rt-tb-regular-expression-scanner) ¦ N ¦  ¦
¦ LLM monthly reports that use the spike detector: [LLM insights](https://github.com/thunderbird/thunderbird-metrics-and-reports/tree/main/LLM_INSIGHTS), [reports site](https://thunderbird.github.io/thunderbird-metrics-and-reports/) ¦ N ¦  ¦
¦ SUMO assignment tool (Claim and Release for unanswered questions): [unanswered questions report](https://thunderbird.github.io/thunderbird-metrics-and-reports/UNANSWERED_QUESTIONS/), [assignment data](https://github.com/thunderbird/thunderbird-metrics-and-reports/tree/main/UNANSWERED_QUESTIONS) ¦ N ¦  ¦
¦ Thunderbird for Android metrics and reports: [repo](https://github.com/thunderbird/thunderbird-android-metrics-and-reports) ¦ N ¦  ¦
¦ SUMO Forum R scripts: [repo](https://github.com/thunderbird/thunderbird-rt-r-scripts) ¦ N ¦  ¦
¦ Machine learning experiments with SUMO Forum data: [repo](https://github.com/thunderbird/rt-support-ml-experiments) ¦ N ¦  ¦
¦ Doc Detective experiments for Appointment documentation: [repo](https://github.com/thunderbird/rt-appointment-docdetective) ¦ N ¦  ¦
¦ Thunderbird add-on that shows the Thunderbird version (version-everywhere): [unsigned add-on](https://github.com/thunderbird/version-everywhere/releases/latest) (Thunderbird 140 or newer), [how to install the unsigned add-on](https://github.com/thunderbird/version-everywhere#install), [repo and docs](https://github.com/thunderbird/version-everywhere) ¦ N ¦  ¦
¦ Firefox add-on to list and add Thundermail calendars: [unsigned add-on](https://github.com/thunderbird/desktop-support-tools/releases/latest) (Firefox ESR 140.15 or newer), [how to use the unsigned add-on](https://github.com/thunderbird/desktop-support-tools#the-firefox-add-on), [add-on source](https://github.com/thunderbird/desktop-support-tools/tree/main/firefox-addon) ¦ N ¦  ¦
¦ Desktop Support Tools (Troubleshooting Information parser, settings checker, CalDAV scripts): [web app](https://thunderbird.github.io/desktop-support-tools/), [repo and docs](https://github.com/thunderbird/desktop-support-tools) ¦ N ¦  ¦
¦ MZLA Support daily handoff: [web app](https://mzla-support-handoff.quick.mozilla.cloud/) (Mozilla SSO), [repo](https://github.com/thunderbird/mzla-support-handoff) (private) ¦ N ¦  ¦
¦ Matrix notifications from web pages and GitHub Actions: [repo and docs](https://github.com/thunderbird/matrix-notify) ¦ N ¦  ¦
¦ Keyboard shortcuts and macros (links to Notion, Bugzilla, Zendesk and web pages, and random warm greetings and closes for Zendesk): [repo and docs](https://github.com/thunderbird/espanso-config) ¦ N ¦  ¦
