---
layout: post
title: "How to get all February 2026 SUMO Thunderbird Desktop Questions from my CSV files (updated via a github action once per hour)l use 'select all' to unify the 28 CSVs once per day and TIL you can add fields using 'select'"
---
* [Draft](https://checkvist.com/p/MVg7Me1Z01Rz7KOTRFjBf1) [created](https://rolandtanglao.com/2025/11/14/p0908-without-link-blogthis-linkless_blog_all_open/): Mar 10, 2026 14:21 (UTC).
* [A lite.datasette.io SQLite query to get all 42 support.mozilla.org (aka SUMO) Thunderbird Desktop questions in February 2026 that mention 'yahoo'](https://lite.datasette.io/?csv=https://github.com/thunderbird/github-action-thunderbird-aaq/blob/main/2026/2026-02-01-2026-02-01-thunderbird-creator-answers-desktop-all-locales.csv&csv=https://github.com/thunderbird/github-action-thunderbird-aaq/blob/main/2026/2026-02-02-2026-02-02-thunderbird-creator-answers-desktop-all-locales.csv&csv=https://github.com/thunderbird/github-action-thunderbird-aaq/blob/main/2026/2026-02-03-2026-02-03-thunderbird-creator-answers-desktop-all-locales.csv&csv=https://github.com/thunderbird/github-action-thunderbird-aaq/blob/main/2026/2026-02-04-2026-02-04-thunderbird-creator-answers-desktop-all-locales.csv&csv=https://github.com/thunderbird/github-action-thunderbird-aaq/blob/main/2026/2026-02-05-2026-02-05-thunderbird-creator-answers-desktop-all-locales.csv&csv=https://github.com/thunderbird/github-action-thunderbird-aaq/blob/main/2026/2026-02-06-2026-02-06-thunderbird-creator-answers-desktop-all-locales.csv&csv=https://github.com/thunderbird/github-action-thunderbird-aaq/blob/main/2026/2026-02-07-2026-02-07-thunderbird-creator-answers-desktop-all-locales.csv&csv=https://github.com/thunderbird/github-action-thunderbird-aaq/blob/main/2026/2026-02-08-2026-02-08-thunderbird-creator-answers-desktop-all-locales.csv&csv=https://github.com/thunderbird/github-action-thunderbird-aaq/blob/main/2026/2026-02-09-2026-02-09-thunderbird-creator-answers-desktop-all-locales.csv&csv=https://github.com/thunderbird/github-action-thunderbird-aaq/blob/main/2026/2026-02-10-2026-02-10-thunderbird-creator-answers-desktop-all-locales.csv&csv=https://github.com/thunderbird/github-action-thunderbird-aaq/blob/main/2026/2026-02-11-2026-02-11-thunderbird-creator-answers-desktop-all-locales.csv&csv=https://github.com/thunderbird/github-action-thunderbird-aaq/blob/main/2026/2026-02-12-2026-02-12-thunderbird-creator-answers-desktop-all-locales.csv&csv=https://github.com/thunderbird/github-action-thunderbird-aaq/blob/main/2026/2026-02-13-2026-02-13-thunderbird-creator-answers-desktop-all-locales.csv&csv=https://github.com/thunderbird/github-action-thunderbird-aaq/blob/main/2026/2026-02-14-2026-02-14-thunderbird-creator-answers-desktop-all-locales.csv&csv=https://github.com/thunderbird/github-action-thunderbird-aaq/blob/main/2026/2026-02-15-2026-02-15-thunderbird-creator-answers-desktop-all-locales.csv&csv=https://github.com/thunderbird/github-action-thunderbird-aaq/blob/main/2026/2026-02-16-2026-02-16-thunderbird-creator-answers-desktop-all-locales.csv&csv=https://github.com/thunderbird/github-action-thunderbird-aaq/blob/main/2026/2026-02-17-2026-02-17-thunderbird-creator-answers-desktop-all-locales.csv&csv=https://github.com/thunderbird/github-action-thunderbird-aaq/blob/main/2026/2026-02-18-2026-02-18-thunderbird-creator-answers-desktop-all-locales.csv&csv=https://github.com/thunderbird/github-action-thunderbird-aaq/blob/main/2026/2026-02-19-2026-02-19-thunderbird-creator-answers-desktop-all-locales.csv&csv=https://github.com/thunderbird/github-action-thunderbird-aaq/blob/main/2026/2026-02-20-2026-02-20-thunderbird-creator-answers-desktop-all-locales.csv&csv=https://github.com/thunderbird/github-action-thunderbird-aaq/blob/main/2026/2026-02-21-2026-02-21-thunderbird-creator-answers-desktop-all-locales.csv&csv=https://github.com/thunderbird/github-action-thunderbird-aaq/blob/main/2026/2026-02-22-2026-02-22-thunderbird-creator-answers-desktop-all-locales.csv&csv=https://github.com/thunderbird/github-action-thunderbird-aaq/blob/main/2026/2026-02-23-2026-02-23-thunderbird-creator-answers-desktop-all-locales.csv&csv=https://github.com/thunderbird/github-action-thunderbird-aaq/blob/main/2026/2026-02-24-2026-02-24-thunderbird-creator-answers-desktop-all-locales.csv&csv=https://github.com/thunderbird/github-action-thunderbird-aaq/blob/main/2026/2026-02-25-2026-02-25-thunderbird-creator-answers-desktop-all-locales.csv&csv=https://github.com/thunderbird/github-action-thunderbird-aaq/blob/main/2026/2026-02-26-2026-02-26-thunderbird-creator-answers-desktop-all-locales.csv&csv=https://github.com/thunderbird/github-action-thunderbird-aaq/blob/main/2026/2026-02-27-2026-02-27-thunderbird-creator-answers-desktop-all-locales.csv&csv=https://github.com/thunderbird/github-action-thunderbird-aaq/blob/main/2026/2026-02-28-2026-02-28-thunderbird-creator-answers-desktop-all-locales.csv#/data?sql=select+*+from+%5B2026-02-01-2026-02-01-thunderbird-creator-answers-desktop-all-locales%5D+where+content+like+%27%25yahoo%25%27%0Aunion+all%0Aselect+*+from+%5B2026-02-02-2026-02-02-thunderbird-creator-answers-desktop-all-locales%5D+where+content+like+%27%25yahoo%25%27%0Aunion+all%0Aselect+*+from+%5B2026-02-03-2026-02-03-thunderbird-creator-answers-desktop-all-locales%5D+where+content+like+%27%25yahoo%25%27%0Aunion+all%0Aselect+*+from+%5B2026-02-04-2026-02-04-thunderbird-creator-answers-desktop-all-locales%5D+where+content+like+%27%25yahoo%25%27%0Aunion+all%0Aselect+*+from+%5B2026-02-05-2026-02-05-thunderbird-creator-answers-desktop-all-locales%5D+where+content+like+%27%25yahoo%25%27%0Aunion+all%0Aselect+*+from+%5B2026-02-06-2026-02-06-thunderbird-creator-answers-desktop-all-locales%5D+where+content+like+%27%25yahoo%25%27%0Aunion+all%0Aselect+*+from+%5B2026-02-07-2026-02-07-thunderbird-creator-answers-desktop-all-locales%5D+where+content+like+%27%25yahoo%25%27%0Aunion+all%0Aselect+*+from+%5B2026-02-08-2026-02-08-thunderbird-creator-answers-desktop-all-locales%5D+where+content+like+%27%25yahoo%25%27%0Aunion+all%0Aselect+*+from+%5B2026-02-09-2026-02-09-thunderbird-creator-answers-desktop-all-locales%5D+where+content+like+%27%25yahoo%25%27%0Aunion+all%0Aselect+*+from+%5B2026-02-10-2026-02-10-thunderbird-creator-answers-desktop-all-locales%5D+where+content+like+%27%25yahoo%25%27%0Aunion+all%0Aselect+*+from+%5B2026-02-11-2026-02-11-thunderbird-creator-answers-desktop-all-locales%5D+where+content+like+%27%25yahoo%25%27%0Aunion+all%0Aselect+*+from+%5B2026-02-12-2026-02-12-thunderbird-creator-answers-desktop-all-locales%5D+where+content+like+%27%25yahoo%25%27%0Aunion+all%0Aselect+*+from+%5B2026-02-13-2026-02-13-thunderbird-creator-answers-desktop-all-locales%5D+where+content+like+%27%25yahoo%25%27%0Aunion+all%0Aselect+*+from+%5B2026-02-14-2026-02-14-thunderbird-creator-answers-desktop-all-locales%5D+where+content+like+%27%25yahoo%25%27%0Aunion+all%0Aselect+*+from+%5B2026-02-15-2026-02-15-thunderbird-creator-answers-desktop-all-locales%5D+where+content+like+%27%25yahoo%25%27%0Aunion+all%0Aselect+*+from+%5B2026-02-16-2026-02-16-thunderbird-creator-answers-desktop-all-locales%5D+where+content+like+%27%25yahoo%25%27%0Aunion+all%0Aselect+*+from+%5B2026-02-17-2026-02-17-thunderbird-creator-answers-desktop-all-locales%5D+where+content+like+%27%25yahoo%25%27%0Aunion+all%0Aselect+*+from+%5B2026-02-18-2026-02-18-thunderbird-creator-answers-desktop-all-locales%5D+where+content+like+%27%25yahoo%25%27%0Aunion+all%0Aselect+*+from+%5B2026-02-19-2026-02-19-thunderbird-creator-answers-desktop-all-locales%5D+where+content+like+%27%25yahoo%25%27%0Aunion+all%0Aselect+*+from+%5B2026-02-20-2026-02-20-thunderbird-creator-answers-desktop-all-locales%5D+where+content+like+%27%25yahoo%25%27%0Aunion+all%0Aselect+*+from+%5B2026-02-21-2026-02-21-thunderbird-creator-answers-desktop-all-locales%5D+where+content+like+%27%25yahoo%25%27%0Aunion+all%0Aselect+*+from+%5B2026-02-22-2026-02-22-thunderbird-creator-answers-desktop-all-locales%5D+where+content+like+%27%25yahoo%25%27%0Aunion+all%0Aselect+*+from+%5B2026-02-23-2026-02-23-thunderbird-creator-answers-desktop-all-locales%5D+where+content+like+%27%25yahoo%25%27%0Aunion+all%0Aselect+*+from+%5B2026-02-24-2026-02-24-thunderbird-creator-answers-desktop-all-locales%5D+where+content+like+%27%25yahoo%25%27%0Aunion+all%0Aselect+*+from+%5B2026-02-25-2026-02-25-thunderbird-creator-answers-desktop-all-locales%5D+where+content+like+%27%25yahoo%25%27%0Aunion+all%0Aselect+*+from+%5B2026-02-26-2026-02-26-thunderbird-creator-answers-desktop-all-locales%5D+where+content+like+%27%25yahoo%25%27%0Aunion+all%0Aselect+*+from+%5B2026-02-27-2026-02-27-thunderbird-creator-answers-desktop-all-locales%5D+where+content+like+%27%25yahoo%25%27%0Aunion+all%0Aselect+*+from+%5B2026-02-28-2026-02-28-thunderbird-creator-answers-desktop-all-locales%5D+where+content+like+%27%25yahoo%25%27%0A)
* How to use multiple CSVs in datasette: [Simon Willison:: 2022:: Joining CSV files in your browser using Datasette Lite](https://simonwillison.net/2022/Jun/20/datasette-lite-csvs/)
* [geeksforgeeks Union All](https://www.geeksforgeeks.org/sqlite/sqlite-union-all-operator/): **QUOTE**: "SQLite **UNION ALL** operator combines **multiple select statements** and fetches the entire data. Union All fetches the duplicate rows too. The select statement must have the same number of columns with the same data type and the first select statement column names are used as the result set column names. It helps to unite the multiple select statements to retrieve the specified output. In simple words, **it is used to fetch data from multiple tables**."
<details>
<summary>I like this example of adding a field called `Type` with in a select from [sqlitetutorial.net's UNION ALL tutorial](https://www.sqlitetutorial.net/sqlite-union/)</summary>
```sql
SELECT
  FirstName,
  LastName,
  'Employee' AS Type
FROM
  employees
UNION
SELECT
  FirstName,
  LastName,
  'Customer'
FROM
  customers
ORDER BY
  FirstName,
  LastName;
```
</details>
* Thank you Simon Willison for your wonderful datasette software!
<details>
<summary>The actual query for SQLite nerds :-)</summary>
```sql
select * from [2026-02-01-2026-02-01-thunderbird-creator-answers-desktop-all-locales] where content like '%yahoo%'
union all
select * from [2026-02-02-2026-02-02-thunderbird-creator-answers-desktop-all-locales] where content like '%yahoo%'
union all
select * from [2026-02-03-2026-02-03-thunderbird-creator-answers-desktop-all-locales] where content like '%yahoo%'
union all
select * from [2026-02-04-2026-02-04-thunderbird-creator-answers-desktop-all-locales] where content like '%yahoo%'
union all
select * from [2026-02-05-2026-02-05-thunderbird-creator-answers-desktop-all-locales] where content like '%yahoo%'
union all
select * from [2026-02-06-2026-02-06-thunderbird-creator-answers-desktop-all-locales] where content like '%yahoo%'
union all
select * from [2026-02-07-2026-02-07-thunderbird-creator-answers-desktop-all-locales] where content like '%yahoo%'
union all
select * from [2026-02-08-2026-02-08-thunderbird-creator-answers-desktop-all-locales] where content like '%yahoo%'
union all
select * from [2026-02-09-2026-02-09-thunderbird-creator-answers-desktop-all-locales] where content like '%yahoo%'
union all
select * from [2026-02-10-2026-02-10-thunderbird-creator-answers-desktop-all-locales] where content like '%yahoo%'
union all
select * from [2026-02-11-2026-02-11-thunderbird-creator-answers-desktop-all-locales] where content like '%yahoo%'
union all
select * from [2026-02-12-2026-02-12-thunderbird-creator-answers-desktop-all-locales] where content like '%yahoo%'
union all
select * from [2026-02-13-2026-02-13-thunderbird-creator-answers-desktop-all-locales] where content like '%yahoo%'
union all
select * from [2026-02-14-2026-02-14-thunderbird-creator-answers-desktop-all-locales] where content like '%yahoo%'
union all
select * from [2026-02-15-2026-02-15-thunderbird-creator-answers-desktop-all-locales] where content like '%yahoo%'
union all
select * from [2026-02-16-2026-02-16-thunderbird-creator-answers-desktop-all-locales] where content like '%yahoo%'
union all
select * from [2026-02-17-2026-02-17-thunderbird-creator-answers-desktop-all-locales] where content like '%yahoo%'
union all
select * from [2026-02-18-2026-02-18-thunderbird-creator-answers-desktop-all-locales] where content like '%yahoo%'
union all
select * from [2026-02-19-2026-02-19-thunderbird-creator-answers-desktop-all-locales] where content like '%yahoo%'
union all
select * from [2026-02-20-2026-02-20-thunderbird-creator-answers-desktop-all-locales] where content like '%yahoo%'
union all
select * from [2026-02-21-2026-02-21-thunderbird-creator-answers-desktop-all-locales] where content like '%yahoo%'
union all
select * from [2026-02-22-2026-02-22-thunderbird-creator-answers-desktop-all-locales] where content like '%yahoo%'
union all
select * from [2026-02-23-2026-02-23-thunderbird-creator-answers-desktop-all-locales] where content like '%yahoo%'
union all
select * from [2026-02-24-2026-02-24-thunderbird-creator-answers-desktop-all-locales] where content like '%yahoo%'
union all
select * from [2026-02-25-2026-02-25-thunderbird-creator-answers-desktop-all-locales] where content like '%yahoo%'
union all
select * from [2026-02-26-2026-02-26-thunderbird-creator-answers-desktop-all-locales] where content like '%yahoo%'
union all
select * from [2026-02-27-2026-02-27-thunderbird-creator-answers-desktop-all-locales] where content like '%yahoo%'
union all
select * from [2026-02-28-2026-02-28-thunderbird-creator-answers-desktop-all-locales] where content like '%yahoo%'
```
</details>
