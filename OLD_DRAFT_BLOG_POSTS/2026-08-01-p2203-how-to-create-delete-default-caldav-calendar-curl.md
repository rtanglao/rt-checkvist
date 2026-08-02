---
layout: post
title: "How to create and delete a non default CalDAV calendar using curl"
---
* [Draft](https://checkvist.com/p/MVg7Me1Z01Rz7KOTRFjBf1) [created](https://rolandtanglao.com/2025/11/14/p0908-without-link-blogthis-linkless_blog_all_open/): Aug 2, 2026 05:03 (UTC).
From: [github.com/thunderbird/desktop-support-tools/blob/main/README.md](https://github.com/thunderbird/desktop-support-tools/blob/main/README.md):
## Make a calendar
```bash
curl -i -u nemo@thundermail.com -X MKCALENDAR \
  -H 'Content-Type: application/xml' \                                                                                                                                                    --data '<?xml version="1.0" encoding="utf-8"?>
<C:mkcalendar xmlns:D="DAV:" xmlns:C="urn:ietf:params:xml:ns:caldav">
  <D:set><D:prop><D:displayname>ticket-1234</D:displayname></D:prop></D:set>
</C:mkcalendar>' \
  'https://mail.thundermail.com/dav/cal/nemo%40thundermail.com/ticket-1234/'
```
## Delete a calendar
```bash
curl -i -u "$CAL_USER" -X DELETE "${CAL_HOME}ticket-1234/"
```
