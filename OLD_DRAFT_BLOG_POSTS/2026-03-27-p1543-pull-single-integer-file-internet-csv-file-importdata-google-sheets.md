---
layout: post
title: "How to pull a single integer from a 1 line CSV file on the internet e.g. github into Google Sheets"
---
* [Draft](https://checkvist.com/p/MVg7Me1Z01Rz7KOTRFjBf1) [created](https://rolandtanglao.com/2025/11/14/p0908-without-link-blogthis-linkless_blog_all_open/): Mar 27, 2026 22:43 (UTC).
* Get a single integer without a header (via Stack Overflow:: [Google Sheets IMPORTDATA() with no header](https://stackoverflow.com/questions/43698973/google-sheets-importdata-with-no-header)
    * where `Col2` is the second column, `Offset 1` means skip the first row and `0` means `Specifies the number of header rows in the input range, which enables transformation of multi-header rows range input to be transformed to a single row header input.`
* Official Google Docs: [QUERY function](https://support.google.com/docs/answer/3093343?hl=en), [Query Language Reference (Version 0.7)](https://developers.google.com/chart/interactive/docs/querylanguage#select)
<pre>
=QUERY(
IMPORTDATA(
"https://raw.githubusercontent.com/thunderbird/thunderbird-desktop-metrics-and-reports/refs/heads/main/CONCATENATED_FILES/2026-03-sumo-desktop-report.csv"),
"SELECT Col2 Offset 1", 0)
</pre>
