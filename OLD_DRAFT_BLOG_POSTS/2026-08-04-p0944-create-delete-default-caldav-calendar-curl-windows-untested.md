---
layout: post
title: "How to create and delete a non default CalDAV calendar using curl on Windows (untested)"
---
* [Draft](https://checkvist.com/p/MVg7Me1Z01Rz7KOTRFjBf1) [created](https://rolandtanglao.com/2025/11/14/p0908-without-link-blogthis-linkless_blog_all_open/): Aug 4, 2026 16:44 (UTC). From: [github.com/thunderbird/desktop-support-tools/blob/main/README.md](https://github.com/thunderbird/desktop-support-tools/blob/main/README.md):
## Make a calendar
* create a file called mkcalender.xml:

```xml
<?xml version="1.0" encoding="utf-8"?>
<D:propfind xmlns:D="DAV:" xmlns:C="urn:ietf:params:xml:ns:caldav">
  <D:prop>
    <D:displayname/>
    <D:resourcetype/>
    <C:schedule-default-calendar-URL/>
  </D:prop>
</D:propfind>
```
* Then run the following in powershell:

```bash
curl.exe -i -u nemo@thundermail.com -X MKCALENDAR ^
  -H "Content-Type: application/xml" ^
  --data-binary "@mkcalendar.xml" ^
  "https://mail.thundermail.com/dav/cal/nemo%40thundermail.com/ticket-1234/"
```

## Delete a calendar
```bash
curl.exe -i -u "$CAL_USER" -X DELETE "${CAL_HOME}ticket-1234/"
```

## Previously

* August 1, 2026: [How to create and delete a non default CalDAV calendar using curl](https://rolandtanglao.com/2026/08/01/p2203-how-to-create-delete-default-caldav-calendar-curl/)
