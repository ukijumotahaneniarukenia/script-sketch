#!/bin/bash

file="$1"

#grep -Po '<.*>' $file | head -n100 | awk '/<page>/,/<\/page>/{if($0=="<page>"){print 1,$0}else{print 0,$0}}' | nl
grep -Po '<.*>' $file | head -n100 | awk '/<page>/,/<\/page>/{if($0=="<page>"){print 1,$0}else{print 0,$0}}' | nl | sed -n '1,22p' | awk '{print $3}'

#     1	1 <page>
#     2	0 <title>Wikipedia:アップロードログ 2004年4月</title>
#     3	0 <ns>4</ns>
#     4	0 <id>1</id>
#     5	0 <restrictions>sysop</restrictions>
#     6	0 <revision>
#     7	0 <id>2168855</id>
#     8	0 <parentid>299151</parentid>
#     9	0 <timestamp>2004-04-30T14:46:00Z</timestamp>
#    10	0 <contributor>
#    11	0 <username>Oxhop</username>
#    12	0 <id>2551</id>
#    13	0 </contributor>
#    14	0 <minor />
#    15	0 <comment>&quot;LocationMacedonia.png&quot;をアップロードしました。: マケドニアの位置 - 英語版より</comment>
#    16	0 <model>wikitext</model>
#    17	0 <format>text/x-wiki</format>
#    18	0 <text xml:space="preserve">
#    19	0 </text>
#    20	0 <sha1>0atpn2yli6qvrd8xzq2nnu6zp0ayovq</sha1>
#    21	0 </revision>
#    22	0 </page>
#    23	1 <page>
#    24	0 <title>Wikipedia:削除記録/過去ログ 2002年12月</title>
#    25	0 <ns>4</ns>
#    26	0 <id>2</id>
#    27	0 <restrictions>sysop</restrictions>
#    28	0 <revision>
#    29	0 <id>2168856</id>
#    30	0 <timestamp>2002-12-06T09:23:16Z</timestamp>
#    31	0 <contributor>
#    32	0 <username>Brion VIBBER</username>
#    33	0 <id>1</id>
#    34	0 </contributor>
#    35	0 <comment>deleted &quot;Linux&quot;: goatse.cx</comment>
#    36	0 <model>wikitext</model>
#    37	0 <format>text/x-wiki</format>
#    38	0 <text xml:space="preserve">
#    39	0 </text>
#    40	0 <sha1>gbhvqlwj7ga4v9ghhy0n88iqmlo19vz</sha1>
#    41	0 </revision>
#    42	0 </page>
#    43	1 <page>
#    44	0 <title>アンパサンド</title>
#    45	0 <ns>0</ns>
#    46	0 <id>5</id>
#    47	0 <revision>
#    48	0 <id>73841108</id>
#    49	0 <parentid>73290874</parentid>
#    50	0 <timestamp>2019-08-14T00:23:07Z</timestamp>
#    51	0 <contributor>
#    52	0 <username>Ttle-recll</username>
#    53	0 <id>1525028</id>
#    54	0 </contributor>
#    55	0 <comment>/* 手書き */</comment>
#    56	0 <model>wikitext</model>
#    57	0 <format>text/x-wiki</format>
#    58	0 <text xml:space="preserve">
#    59	0 </text>
#    60	0 <sha1>kouc3jdgpxhfmpwjyzz53t9vo6s5rwq</sha1>
#    61	0 </revision>
#    62	0 </page>
