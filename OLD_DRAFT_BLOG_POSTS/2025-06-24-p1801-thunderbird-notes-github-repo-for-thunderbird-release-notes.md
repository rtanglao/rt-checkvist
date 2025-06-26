---
layout: post
title: "TIL:: Thunderbird release notes are stored in a github repo called thunderbird-notes; I sketched some python code for getting tags, bugs, notes etc ; Release Notes for Thunderbird"
---
[Discovered](http://rolandtanglao.com/2020/07/29/p1-blogthis-checkvist-list-links-to-blog/): Jun 25, 2025 01:01 [TIL:: Thunderbird release notes are stored in a github repo called thunderbird-notes; I sketched some python code for getting tags, bugs, notes etc ; Release Notes for Thunderbird](https://github.com/thunderbird/thunderbird-notes/tree/master)

## Python code 

```python
resp = requests.get("https://raw.githubusercontent.com/thunderbird/thunderbird-notes/refs/heads/master/release/139.0.yml")
parsed_yaml = yaml.safe_load(resp.text)
pprint parsed_yaml
```

## Example YAML release notes

```python
{'notes': [{'bugs': [1950887],
            'note': 'Implemented enterprise policy to allow granular in-app '
                    'notification control',
            'tag': 'new'},
           {'bugs': [1953662],
            'note': "Added 'Mark as Read' and 'Delete' actions to mail "
                    'notifications',
            'tag': 'new'},
           {'bugs': [1865057],
            'note': 'Implemented customizable row count for Cards View in '
                    "'Appearance' settings",
            'tag': 'new'},
           {'bugs': [1846550],
            'note': 'Implemented ability to manually sort folders in the '
                    'folder pane',
            'tag': 'new'},
           {'bugs': [1803006],
            'note': 'Thunderbird could crash when setting message compose '
                    'headers',
            'tag': 'fixed'},
           {'bugs': [1956988],
            'note': 'Links in the OAuth authentication window did not open '
                    'when clicked',
            'tag': 'fixed'},
           {'bugs': [1964145],
            'note': 'Access was not allowed to attachments at specific UNC '
                    'hosts',
            'tag': 'fixed'},
           {'bugs': [1952311],
            'note': 'Mail window could stop functioning during and after '
                    'folder compaction',
            'tag': 'fixed'},
           {'bugs': [1960343],
            'note': 'Full folder sorting logic was not used when inserting '
                    'folders after move',
            'tag': 'fixed'},
           {'bugs': [1961642],
            'note': '`mail.compose.other.header` headers were not shown in '
                    'Show All Headers mode',
            'tag': 'fixed'},
           {'bugs': [1857315],
            'note': 'Folder was hidden from Favorite when a subfolder was '
                    'removed',
            'tag': 'fixed'},
           {'bugs': [1957878],
            'note': 'Folder tree message counts displayed incorrectly under '
                    'certain conditions',
            'tag': 'fixed'},
           {'bugs': [1958585],
            'note': 'Selection was not restored after manual folder sorting',
            'tag': 'fixed'},
           {'bugs': [1959545],
            'note': 'Dragging a folder to a new parent did not insert it '
                    'correctly for IMAP folders',
            'tag': 'fixed'},
           {'bugs': [1964265],
            'note': 'Compact View users had all folders expanded after restart',
            'tag': 'fixed'},
           {'bugs': [1822978],
            'note': 'Invite attachments without a name were forwarded as '
                    "'Attached Message Part'",
            'tag': 'fixed'},
           {'bugs': [1671747],
            'note': 'Chat settings tab remained visible when '
                    '`mail.chat.enabled` was false',
            'tag': 'fixed'},
           {'bugs': [1960978],
            'note': 'Selected folder was not refreshed when applying '
                    "'Appearance' Threading settings",
            'tag': 'fixed'},
           {'bugs': [1962278],
            'note': "'Grouped by Sort' for all folders in 'Appearance' "
                    'settings did not work properly',
            'tag': 'fixed'},
           {'bugs': [1965304],
            'note': 'Thunderbird could crash if message copying to Sent folder '
                    'was interrupted',
            'tag': 'fixed'},
           {'bugs': [553048],
            'note': 'System search toggle did not properly reflect and control '
                    'integration state',
            'tag': 'fixed'},
           {'bugs': [1958549],
            'note': 'Dragging attachments to desktop from Thunderbird did not '
                    'work on macOS',
            'tag': 'fixed'},
           {'bugs': [1959691],
            'note': 'Dark mode messages displayed in light mode due to '
                    'preference setting conflict',
            'tag': 'fixed'},
           {'bugs': [250216],
            'note': 'Cancelling a post to a news server could fail and remove '
                    'the article',
            'tag': 'fixed'},
           {'bugs': [1961659],
            'note': 'Thunderbird could crash in NNTP subscription dialog',
            'tag': 'fixed'},
           {'bugs': [530193],
            'note': 'Newsgroup searches with slashes were not supported with '
                    'XPAT-enabled servers',
            'tag': 'fixed'},
           {'bugs': [288120],
            'note': 'Offline newsgroup use lacked functionality needed for '
                    'effective offline access',
            'tag': 'fixed'},
           {'bugs': [1959848],
            'note': 'Chat accounts could not be deleted',
            'tag': 'fixed'},
           {'bugs': [1954358],
            'note': 'Reminders missed for all-day events when '
                    '`calendar.alarms.showmissed` was false',
            'tag': 'fixed'},
           {'bugs': [1964473],
            'note': 'Access to multiple CalDAV calendars was not possible',
            'tag': 'fixed'},
           {'bugs': [1949810, 1964156],
            'note': 'Visual and UX improvements',
            'tag': 'fixed'},
           {'note': '[Security '
                    'fixes](https://www.mozilla.org/en-US/security/known-vulnerabilities/thunderbird/#thunderbird139)',
            'tag': 'fixed'},
           {'bugs': [1968963],
            'note': 'Message list switched to Cards View instead of keeping '
                    'Table View preference',
            'tag': 'unresolved'}],
 'release': {'import_system_requirements': '128.0beta',
             'release_date': '2025-05-27',
             'text': '**System Requirements:** '
                     '[Details](/en-US/thunderbird/139.0/system-requirements/)\n'
                     '\n'
                     '- Windows: Windows 10 or later\n'
                     '- Mac: macOS 10.15 or later\n'
                     '- Linux: GTK+ 3.14 or higher\n'}}
```
