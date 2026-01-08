---
layout: post
title: "grep command to get bash script to re-run SUMO AAQ API calls that fail using '-A 2' to get 2 lines after "
---
```sh
grep -A 2 "comand to " ~/Documents/LOGS/2026-01-02-2025-refresh-logs.txt ¦ \
grep -v 'cd' ¦ grep -v 'E,' ¦ grep -v '\-\-' > ~/Documents/LOGS/2025-01-03-re-run2025.sh
```
