---
layout: post
title: "Working code :-) get-localized-sumo-kb-urls.rb"
---
[Discovered](http://rolandtanglao.com/2020/07/29/p1-blogthis-checkvist-list-links-to-blog/): Mar 27, 2024. 23:22 [Working code :-) get-localized-sumo-kb-urls.rb](https://github.com/rtanglao/rt-kits-tb-api/blob/main/get-localized-sumo-kb-urls.rb)
```bash
% cat /tmp/url.text
troubleshoot-mode-thunderbird
./get-localized-sumo-kb-urls.rb /tmp/url.text    
# OR
echo 'troubleshoot-mode-thunderbird' ¦ ./get-localized-sumo-kb-urls.rb 2>/tmp/get-localized-sumo-stderr.txt           
```
## OUTPUT:
```
/en-US/kb/troubleshoot-mode-thunderbird
/bn/kb/troubleshoot-mode-thunderbird
/cs/kb/rezim-reseni-potizi-v-thunderbirdu
/da/kb/thunderbird-i-fejlsoegnings-tilstand
/de/kb/Abgesicherter-Modus_Thunderbird
/el/kb/leitoyrgia-epilyshs-problhmatwn-toy-thunderbird
/es/kb/modo-seguro-tb
/fi/kb/thunderbirdin-vikasietotila
/fr/kb/mode-de-depannage-thunderbird
/it/kb/modalita-risoluzione-problemi-thunderbird
/ja/kb/troubleshoot-mode-thunderbird
/ko/kb/thunderbird%20%EC%95%88%EC%A0%84%20%EB%AA%A8%EB%93%9C
/nl/kb/de-probleemoplossingsmodus-van-thunderbird
/pl/kb/tryb-rozwiazywania-problemow-thunderbirda
/pt-BR/kb/modo-solucao-problemas-thunderbird
/pt-PT/kb/modo-seguranca-thunderbird
/ru/kb/bezopasnyj-rezhim-thunderbird
/sl/kb/varni-nacin-tb
/zh-CN/kb/Thunderbird%20%E7%9A%84%E6%8E%92%E9%9A%9C%E6%A8%A1%E5%BC%8F
/zh-TW/kb/safe-mode-tb
```
