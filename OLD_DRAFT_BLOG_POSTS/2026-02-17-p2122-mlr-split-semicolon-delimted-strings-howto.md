---
layout: post
title: "How To count semi-colon delimited Thunderbird Support Forum tags for Thunderbird Desktop using 'mlr' aka 'miller': use '--explode' with the 'nest verb' to make 1 row per tag and then count the rows with non null tags"
---
[Discovered](http://rolandtanglao.com/2020/07/29/p1-blogthis-checkvist-list-links-to-blog/): Feb 18, 2026 05:22 (UTC) [How To count semi-colon delimited Thunderbird Support Forum tags for Thunderbird Desktop using 'mlr' aka 'miller': use '--explode' with the 'nest verb' to make 1 row per tag and then count the rows with non null tags](https://github.com/thunderbird/thunderbird-desktop-metrics-and-reports/blob/main/README.md#2026-02-16-how-to-count-tags-using-mlr-for-december-2025)

```bash
mlr --csv nest --explode --values --across-records --nested-fs ";" -f tags\
 then filter -x 'is_null($tags)'\
 then count-distinct -f tags\
 then sort -nr count 2025-12-thunderbird-questions.csv \
> 2025-12-thunderbird_questions_tags.csv
```

The output is: [CONCATENATED_FILES/2025-12-thunderbird_questions_tags.csv](https://github.com/thunderbird/thunderbird-desktop-metrics-and-reports/blob/main/CONCATENATED_FILES/2025-12-thunderbird_questions_tags.csv)
