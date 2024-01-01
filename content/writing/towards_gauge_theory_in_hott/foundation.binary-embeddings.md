# Binary embeddings

<pre class="Agda"><a id="30" class="Keyword">module</a> <a id="37" href="foundation.binary-embeddings.html" class="Module">foundation.binary-embeddings</a> <a id="66" class="Keyword">where</a>
</pre>
<details><summary>Imports</summary>

<pre class="Agda"><a id="122" class="Keyword">open</a> <a id="127" class="Keyword">import</a> <a id="134" href="foundation.action-on-identifications-binary-functions.html" class="Module">foundation.action-on-identifications-binary-functions</a>
<a id="188" class="Keyword">open</a> <a id="193" class="Keyword">import</a> <a id="200" href="foundation.action-on-identifications-functions.html" class="Module">foundation.action-on-identifications-functions</a>
<a id="247" class="Keyword">open</a> <a id="252" class="Keyword">import</a> <a id="259" href="foundation.binary-equivalences.html" class="Module">foundation.binary-equivalences</a>
<a id="290" class="Keyword">open</a> <a id="295" class="Keyword">import</a> <a id="302" href="foundation.dependent-pair-types.html" class="Module">foundation.dependent-pair-types</a>
<a id="334" class="Keyword">open</a> <a id="339" class="Keyword">import</a> <a id="346" href="foundation.identity-types.html" class="Module">foundation.identity-types</a>
<a id="372" class="Keyword">open</a> <a id="377" class="Keyword">import</a> <a id="384" href="foundation.universe-levels.html" class="Module">foundation.universe-levels</a>

<a id="412" class="Keyword">open</a> <a id="417" class="Keyword">import</a> <a id="424" href="foundation-core.embeddings.html" class="Module">foundation-core.embeddings</a>
<a id="451" class="Keyword">open</a> <a id="456" class="Keyword">import</a> <a id="463" href="foundation-core.equivalences.html" class="Module">foundation-core.equivalences</a>
</pre>
</details>

## Idea

A binary operation `f : A → B → C` is said to be a binary embedding if the
functions `λ x → f x b` and `λ y → f a y` are embeddings for each `a : A` and
`b : B` respectively.

## Definition

<pre class="Agda"><a id="is-binary-emb"></a><a id="717" href="foundation.binary-embeddings.html#717" class="Function">is-binary-emb</a> <a id="731" class="Symbol">:</a>
  <a id="735" class="Symbol">{</a><a id="736" href="foundation.binary-embeddings.html#736" class="Bound">l1</a> <a id="739" href="foundation.binary-embeddings.html#739" class="Bound">l2</a> <a id="742" href="foundation.binary-embeddings.html#742" class="Bound">l3</a> <a id="745" class="Symbol">:</a> <a id="747" href="Agda.Primitive.html#591" class="Postulate">Level</a><a id="752" class="Symbol">}</a> <a id="754" class="Symbol">{</a><a id="755" href="foundation.binary-embeddings.html#755" class="Bound">A</a> <a id="757" class="Symbol">:</a> <a id="759" href="Agda.Primitive.html#320" class="Primitive">UU</a> <a id="762" href="foundation.binary-embeddings.html#736" class="Bound">l1</a><a id="764" class="Symbol">}</a> <a id="766" class="Symbol">{</a><a id="767" href="foundation.binary-embeddings.html#767" class="Bound">B</a> <a id="769" class="Symbol">:</a> <a id="771" href="Agda.Primitive.html#320" class="Primitive">UU</a> <a id="774" href="foundation.binary-embeddings.html#739" class="Bound">l2</a><a id="776" class="Symbol">}</a> <a id="778" class="Symbol">{</a><a id="779" href="foundation.binary-embeddings.html#779" class="Bound">C</a> <a id="781" class="Symbol">:</a> <a id="783" href="Agda.Primitive.html#320" class="Primitive">UU</a> <a id="786" href="foundation.binary-embeddings.html#742" class="Bound">l3</a><a id="788" class="Symbol">}</a> <a id="790" class="Symbol">→</a>
  <a id="794" class="Symbol">(</a><a id="795" href="foundation.binary-embeddings.html#755" class="Bound">A</a> <a id="797" class="Symbol">→</a> <a id="799" href="foundation.binary-embeddings.html#767" class="Bound">B</a> <a id="801" class="Symbol">→</a> <a id="803" href="foundation.binary-embeddings.html#779" class="Bound">C</a><a id="804" class="Symbol">)</a> <a id="806" class="Symbol">→</a> <a id="808" href="Agda.Primitive.html#320" class="Primitive">UU</a> <a id="811" class="Symbol">(</a><a id="812" href="foundation.binary-embeddings.html#736" class="Bound">l1</a> <a id="815" href="Agda.Primitive.html#804" class="Primitive Operator">⊔</a> <a id="817" href="foundation.binary-embeddings.html#739" class="Bound">l2</a> <a id="820" href="Agda.Primitive.html#804" class="Primitive Operator">⊔</a> <a id="822" href="foundation.binary-embeddings.html#742" class="Bound">l3</a><a id="824" class="Symbol">)</a>
<a id="826" href="foundation.binary-embeddings.html#717" class="Function">is-binary-emb</a> <a id="840" class="Symbol">{</a><a id="841" class="Argument">A</a> <a id="843" class="Symbol">=</a> <a id="845" href="foundation.binary-embeddings.html#845" class="Bound">A</a><a id="846" class="Symbol">}</a> <a id="848" class="Symbol">{</a><a id="849" class="Argument">B</a> <a id="851" class="Symbol">=</a> <a id="853" href="foundation.binary-embeddings.html#853" class="Bound">B</a><a id="854" class="Symbol">}</a> <a id="856" href="foundation.binary-embeddings.html#856" class="Bound">f</a> <a id="858" class="Symbol">=</a>
  <a id="862" class="Symbol">{</a><a id="863" href="foundation.binary-embeddings.html#863" class="Bound">x</a> <a id="865" href="foundation.binary-embeddings.html#865" class="Bound">x&#39;</a> <a id="868" class="Symbol">:</a> <a id="870" href="foundation.binary-embeddings.html#845" class="Bound">A</a><a id="871" class="Symbol">}</a> <a id="873" class="Symbol">{</a><a id="874" href="foundation.binary-embeddings.html#874" class="Bound">y</a> <a id="876" href="foundation.binary-embeddings.html#876" class="Bound">y&#39;</a> <a id="879" class="Symbol">:</a> <a id="881" href="foundation.binary-embeddings.html#853" class="Bound">B</a><a id="882" class="Symbol">}</a> <a id="884" class="Symbol">→</a>
    <a id="890" href="foundation.binary-equivalences.html#775" class="Function">is-binary-equiv</a> <a id="906" class="Symbol">(λ</a> <a id="909" class="Symbol">(</a><a id="910" href="foundation.binary-embeddings.html#910" class="Bound">p</a> <a id="912" class="Symbol">:</a> <a id="914" href="foundation.binary-embeddings.html#863" class="Bound">x</a> <a id="916" href="foundation-core.identity-types.html#5999" class="Function Operator">＝</a> <a id="918" href="foundation.binary-embeddings.html#865" class="Bound">x&#39;</a><a id="920" class="Symbol">)</a> <a id="922" class="Symbol">(</a><a id="923" href="foundation.binary-embeddings.html#923" class="Bound">q</a> <a id="925" class="Symbol">:</a> <a id="927" href="foundation.binary-embeddings.html#874" class="Bound">y</a> <a id="929" href="foundation-core.identity-types.html#5999" class="Function Operator">＝</a> <a id="931" href="foundation.binary-embeddings.html#876" class="Bound">y&#39;</a><a id="933" class="Symbol">)</a> <a id="935" class="Symbol">→</a> <a id="937" href="foundation.action-on-identifications-binary-functions.html#603" class="Function">ap-binary</a> <a id="947" href="foundation.binary-embeddings.html#856" class="Bound">f</a> <a id="949" href="foundation.binary-embeddings.html#910" class="Bound">p</a> <a id="951" href="foundation.binary-embeddings.html#923" class="Bound">q</a><a id="952" class="Symbol">)</a>
</pre>
## Properties

### Any binary equivalence is a binary embedding

<pre class="Agda"><a id="is-emb-fix-left-is-binary-equiv"></a><a id="1032" href="foundation.binary-embeddings.html#1032" class="Function">is-emb-fix-left-is-binary-equiv</a> <a id="1064" class="Symbol">:</a>
  <a id="1068" class="Symbol">{</a><a id="1069" href="foundation.binary-embeddings.html#1069" class="Bound">l1</a> <a id="1072" href="foundation.binary-embeddings.html#1072" class="Bound">l2</a> <a id="1075" href="foundation.binary-embeddings.html#1075" class="Bound">l3</a> <a id="1078" class="Symbol">:</a> <a id="1080" href="Agda.Primitive.html#591" class="Postulate">Level</a><a id="1085" class="Symbol">}</a> <a id="1087" class="Symbol">{</a><a id="1088" href="foundation.binary-embeddings.html#1088" class="Bound">A</a> <a id="1090" class="Symbol">:</a> <a id="1092" href="Agda.Primitive.html#320" class="Primitive">UU</a> <a id="1095" href="foundation.binary-embeddings.html#1069" class="Bound">l1</a><a id="1097" class="Symbol">}</a> <a id="1099" class="Symbol">{</a><a id="1100" href="foundation.binary-embeddings.html#1100" class="Bound">B</a> <a id="1102" class="Symbol">:</a> <a id="1104" href="Agda.Primitive.html#320" class="Primitive">UU</a> <a id="1107" href="foundation.binary-embeddings.html#1072" class="Bound">l2</a><a id="1109" class="Symbol">}</a> <a id="1111" class="Symbol">{</a><a id="1112" href="foundation.binary-embeddings.html#1112" class="Bound">C</a> <a id="1114" class="Symbol">:</a> <a id="1116" href="Agda.Primitive.html#320" class="Primitive">UU</a> <a id="1119" href="foundation.binary-embeddings.html#1075" class="Bound">l3</a><a id="1121" class="Symbol">}</a> <a id="1123" class="Symbol">(</a><a id="1124" href="foundation.binary-embeddings.html#1124" class="Bound">f</a> <a id="1126" class="Symbol">:</a> <a id="1128" href="foundation.binary-embeddings.html#1088" class="Bound">A</a> <a id="1130" class="Symbol">→</a> <a id="1132" href="foundation.binary-embeddings.html#1100" class="Bound">B</a> <a id="1134" class="Symbol">→</a> <a id="1136" href="foundation.binary-embeddings.html#1112" class="Bound">C</a><a id="1137" class="Symbol">)</a> <a id="1139" class="Symbol">→</a>
  <a id="1143" href="foundation.binary-equivalences.html#775" class="Function">is-binary-equiv</a> <a id="1159" href="foundation.binary-embeddings.html#1124" class="Bound">f</a> <a id="1161" class="Symbol">→</a> <a id="1163" class="Symbol">{</a><a id="1164" href="foundation.binary-embeddings.html#1164" class="Bound">a</a> <a id="1166" class="Symbol">:</a> <a id="1168" href="foundation.binary-embeddings.html#1088" class="Bound">A</a><a id="1169" class="Symbol">}</a> <a id="1171" class="Symbol">→</a> <a id="1173" href="foundation-core.embeddings.html#1086" class="Function">is-emb</a> <a id="1180" class="Symbol">(</a><a id="1181" href="foundation.binary-equivalences.html#533" class="Function">fix-left</a> <a id="1190" href="foundation.binary-embeddings.html#1124" class="Bound">f</a> <a id="1192" href="foundation.binary-embeddings.html#1164" class="Bound">a</a><a id="1193" class="Symbol">)</a>
<a id="1195" href="foundation.binary-embeddings.html#1032" class="Function">is-emb-fix-left-is-binary-equiv</a> <a id="1227" href="foundation.binary-embeddings.html#1227" class="Bound">f</a> <a id="1229" href="foundation.binary-embeddings.html#1229" class="Bound">H</a> <a id="1231" class="Symbol">{</a><a id="1232" href="foundation.binary-embeddings.html#1232" class="Bound">a</a><a id="1233" class="Symbol">}</a> <a id="1235" class="Symbol">=</a>
  <a id="1239" href="foundation-core.equivalences.html#16523" class="Function">is-emb-is-equiv</a> <a id="1255" class="Symbol">(</a><a id="1256" href="foundation.binary-equivalences.html#1000" class="Function">is-equiv-fix-left</a> <a id="1274" href="foundation.binary-embeddings.html#1227" class="Bound">f</a> <a id="1276" href="foundation.binary-embeddings.html#1229" class="Bound">H</a><a id="1277" class="Symbol">)</a>

<a id="is-emb-fix-right-is-binary-equiv"></a><a id="1280" href="foundation.binary-embeddings.html#1280" class="Function">is-emb-fix-right-is-binary-equiv</a> <a id="1313" class="Symbol">:</a>
  <a id="1317" class="Symbol">{</a><a id="1318" href="foundation.binary-embeddings.html#1318" class="Bound">l1</a> <a id="1321" href="foundation.binary-embeddings.html#1321" class="Bound">l2</a> <a id="1324" href="foundation.binary-embeddings.html#1324" class="Bound">l3</a> <a id="1327" class="Symbol">:</a> <a id="1329" href="Agda.Primitive.html#591" class="Postulate">Level</a><a id="1334" class="Symbol">}</a> <a id="1336" class="Symbol">{</a><a id="1337" href="foundation.binary-embeddings.html#1337" class="Bound">A</a> <a id="1339" class="Symbol">:</a> <a id="1341" href="Agda.Primitive.html#320" class="Primitive">UU</a> <a id="1344" href="foundation.binary-embeddings.html#1318" class="Bound">l1</a><a id="1346" class="Symbol">}</a> <a id="1348" class="Symbol">{</a><a id="1349" href="foundation.binary-embeddings.html#1349" class="Bound">B</a> <a id="1351" class="Symbol">:</a> <a id="1353" href="Agda.Primitive.html#320" class="Primitive">UU</a> <a id="1356" href="foundation.binary-embeddings.html#1321" class="Bound">l2</a><a id="1358" class="Symbol">}</a> <a id="1360" class="Symbol">{</a><a id="1361" href="foundation.binary-embeddings.html#1361" class="Bound">C</a> <a id="1363" class="Symbol">:</a> <a id="1365" href="Agda.Primitive.html#320" class="Primitive">UU</a> <a id="1368" href="foundation.binary-embeddings.html#1324" class="Bound">l3</a><a id="1370" class="Symbol">}</a> <a id="1372" class="Symbol">(</a><a id="1373" href="foundation.binary-embeddings.html#1373" class="Bound">f</a> <a id="1375" class="Symbol">:</a> <a id="1377" href="foundation.binary-embeddings.html#1337" class="Bound">A</a> <a id="1379" class="Symbol">→</a> <a id="1381" href="foundation.binary-embeddings.html#1349" class="Bound">B</a> <a id="1383" class="Symbol">→</a> <a id="1385" href="foundation.binary-embeddings.html#1361" class="Bound">C</a><a id="1386" class="Symbol">)</a> <a id="1388" class="Symbol">→</a>
  <a id="1392" href="foundation.binary-equivalences.html#775" class="Function">is-binary-equiv</a> <a id="1408" href="foundation.binary-embeddings.html#1373" class="Bound">f</a> <a id="1410" class="Symbol">→</a> <a id="1412" class="Symbol">{</a><a id="1413" href="foundation.binary-embeddings.html#1413" class="Bound">b</a> <a id="1415" class="Symbol">:</a> <a id="1417" href="foundation.binary-embeddings.html#1349" class="Bound">B</a><a id="1418" class="Symbol">}</a> <a id="1420" class="Symbol">→</a> <a id="1422" href="foundation-core.embeddings.html#1086" class="Function">is-emb</a> <a id="1429" class="Symbol">(</a><a id="1430" href="foundation.binary-equivalences.html#651" class="Function">fix-right</a> <a id="1440" href="foundation.binary-embeddings.html#1373" class="Bound">f</a> <a id="1442" href="foundation.binary-embeddings.html#1413" class="Bound">b</a><a id="1443" class="Symbol">)</a>
<a id="1445" href="foundation.binary-embeddings.html#1280" class="Function">is-emb-fix-right-is-binary-equiv</a> <a id="1478" href="foundation.binary-embeddings.html#1478" class="Bound">f</a> <a id="1480" href="foundation.binary-embeddings.html#1480" class="Bound">H</a> <a id="1482" class="Symbol">{</a><a id="1483" href="foundation.binary-embeddings.html#1483" class="Bound">b</a><a id="1484" class="Symbol">}</a> <a id="1486" class="Symbol">=</a>
  <a id="1490" href="foundation-core.equivalences.html#16523" class="Function">is-emb-is-equiv</a> <a id="1506" class="Symbol">(</a><a id="1507" href="foundation.binary-equivalences.html#1188" class="Function">is-equiv-fix-right</a> <a id="1526" href="foundation.binary-embeddings.html#1478" class="Bound">f</a> <a id="1528" href="foundation.binary-embeddings.html#1480" class="Bound">H</a><a id="1529" class="Symbol">)</a>

<a id="is-binary-emb-is-binary-equiv"></a><a id="1532" href="foundation.binary-embeddings.html#1532" class="Function">is-binary-emb-is-binary-equiv</a> <a id="1562" class="Symbol">:</a>
  <a id="1566" class="Symbol">{</a><a id="1567" href="foundation.binary-embeddings.html#1567" class="Bound">l1</a> <a id="1570" href="foundation.binary-embeddings.html#1570" class="Bound">l2</a> <a id="1573" href="foundation.binary-embeddings.html#1573" class="Bound">l3</a> <a id="1576" class="Symbol">:</a> <a id="1578" href="Agda.Primitive.html#591" class="Postulate">Level</a><a id="1583" class="Symbol">}</a> <a id="1585" class="Symbol">{</a><a id="1586" href="foundation.binary-embeddings.html#1586" class="Bound">A</a> <a id="1588" class="Symbol">:</a> <a id="1590" href="Agda.Primitive.html#320" class="Primitive">UU</a> <a id="1593" href="foundation.binary-embeddings.html#1567" class="Bound">l1</a><a id="1595" class="Symbol">}</a> <a id="1597" class="Symbol">{</a><a id="1598" href="foundation.binary-embeddings.html#1598" class="Bound">B</a> <a id="1600" class="Symbol">:</a> <a id="1602" href="Agda.Primitive.html#320" class="Primitive">UU</a> <a id="1605" href="foundation.binary-embeddings.html#1570" class="Bound">l2</a><a id="1607" class="Symbol">}</a> <a id="1609" class="Symbol">{</a><a id="1610" href="foundation.binary-embeddings.html#1610" class="Bound">C</a> <a id="1612" class="Symbol">:</a> <a id="1614" href="Agda.Primitive.html#320" class="Primitive">UU</a> <a id="1617" href="foundation.binary-embeddings.html#1573" class="Bound">l3</a><a id="1619" class="Symbol">}</a> <a id="1621" class="Symbol">{</a><a id="1622" href="foundation.binary-embeddings.html#1622" class="Bound">f</a> <a id="1624" class="Symbol">:</a> <a id="1626" href="foundation.binary-embeddings.html#1586" class="Bound">A</a> <a id="1628" class="Symbol">→</a> <a id="1630" href="foundation.binary-embeddings.html#1598" class="Bound">B</a> <a id="1632" class="Symbol">→</a> <a id="1634" href="foundation.binary-embeddings.html#1610" class="Bound">C</a><a id="1635" class="Symbol">}</a> <a id="1637" class="Symbol">→</a>
  <a id="1641" href="foundation.binary-equivalences.html#775" class="Function">is-binary-equiv</a> <a id="1657" href="foundation.binary-embeddings.html#1622" class="Bound">f</a> <a id="1659" class="Symbol">→</a> <a id="1661" href="foundation.binary-embeddings.html#717" class="Function">is-binary-emb</a> <a id="1675" href="foundation.binary-embeddings.html#1622" class="Bound">f</a>
<a id="1677" href="foundation.binary-embeddings.html#1532" class="Function">is-binary-emb-is-binary-equiv</a> <a id="1707" class="Symbol">{</a><a id="1708" class="Argument">f</a> <a id="1710" class="Symbol">=</a> <a id="1712" href="foundation.binary-embeddings.html#1712" class="Bound">f</a><a id="1713" class="Symbol">}</a> <a id="1715" href="foundation.binary-embeddings.html#1715" class="Bound">H</a> <a id="1717" class="Symbol">{</a><a id="1718" href="foundation.binary-embeddings.html#1718" class="Bound">x</a><a id="1719" class="Symbol">}</a> <a id="1721" class="Symbol">{</a><a id="1722" href="foundation.binary-embeddings.html#1722" class="Bound">x&#39;</a><a id="1724" class="Symbol">}</a> <a id="1726" class="Symbol">{</a><a id="1727" href="foundation.binary-embeddings.html#1727" class="Bound">y</a><a id="1728" class="Symbol">}</a> <a id="1730" class="Symbol">{</a><a id="1731" href="foundation.binary-embeddings.html#1731" class="Bound">y&#39;</a><a id="1733" class="Symbol">}</a> <a id="1735" class="Symbol">=</a>
  <a id="1739" href="foundation.dependent-pair-types.html#586" class="InductiveConstructor">pair</a>
    <a id="1748" class="Symbol">(</a> <a id="1750" class="Symbol">λ</a> <a id="1752" href="foundation.binary-embeddings.html#1752" class="Bound">q</a> <a id="1754" class="Symbol">→</a>
      <a id="1762" href="foundation-core.equivalences.html#7601" class="Function">is-equiv-comp-htpy</a>
        <a id="1789" class="Symbol">(</a> <a id="1791" class="Symbol">λ</a> <a id="1793" href="foundation.binary-embeddings.html#1793" class="Bound">p</a> <a id="1795" class="Symbol">→</a> <a id="1797" href="foundation.action-on-identifications-binary-functions.html#603" class="Function">ap-binary</a> <a id="1807" href="foundation.binary-embeddings.html#1712" class="Bound">f</a> <a id="1809" href="foundation.binary-embeddings.html#1793" class="Bound">p</a> <a id="1811" href="foundation.binary-embeddings.html#1752" class="Bound">q</a><a id="1812" class="Symbol">)</a>
        <a id="1822" class="Symbol">(</a> <a id="1824" href="foundation-core.identity-types.html#7087" class="Function">concat&#39;</a> <a id="1832" class="Symbol">(</a><a id="1833" href="foundation.binary-embeddings.html#1712" class="Bound">f</a> <a id="1835" href="foundation.binary-embeddings.html#1718" class="Bound">x</a> <a id="1837" href="foundation.binary-embeddings.html#1727" class="Bound">y</a><a id="1838" class="Symbol">)</a> <a id="1840" class="Symbol">(</a><a id="1841" href="foundation.action-on-identifications-functions.html#790" class="Function">ap</a> <a id="1844" class="Symbol">(</a><a id="1845" href="foundation.binary-equivalences.html#533" class="Function">fix-left</a> <a id="1854" href="foundation.binary-embeddings.html#1712" class="Bound">f</a> <a id="1856" href="foundation.binary-embeddings.html#1722" class="Bound">x&#39;</a><a id="1858" class="Symbol">)</a> <a id="1860" href="foundation.binary-embeddings.html#1752" class="Bound">q</a><a id="1861" class="Symbol">))</a>
        <a id="1872" class="Symbol">(</a> <a id="1874" class="Symbol">λ</a> <a id="1876" href="foundation.binary-embeddings.html#1876" class="Bound">p</a> <a id="1878" class="Symbol">→</a> <a id="1880" href="foundation.action-on-identifications-functions.html#790" class="Function">ap</a> <a id="1883" class="Symbol">(</a><a id="1884" href="foundation.binary-equivalences.html#651" class="Function">fix-right</a> <a id="1894" href="foundation.binary-embeddings.html#1712" class="Bound">f</a> <a id="1896" href="foundation.binary-embeddings.html#1727" class="Bound">y</a><a id="1897" class="Symbol">)</a> <a id="1899" href="foundation.binary-embeddings.html#1876" class="Bound">p</a><a id="1900" class="Symbol">)</a>
        <a id="1910" class="Symbol">(</a> <a id="1912" class="Symbol">λ</a> <a id="1914" href="foundation.binary-embeddings.html#1914" class="Bound">p</a> <a id="1916" class="Symbol">→</a> <a id="1918" href="foundation.action-on-identifications-binary-functions.html#984" class="Function">triangle-ap-binary</a> <a id="1937" href="foundation.binary-embeddings.html#1712" class="Bound">f</a> <a id="1939" href="foundation.binary-embeddings.html#1914" class="Bound">p</a> <a id="1941" href="foundation.binary-embeddings.html#1752" class="Bound">q</a><a id="1942" class="Symbol">)</a>
        <a id="1952" class="Symbol">(</a> <a id="1954" href="foundation.binary-embeddings.html#1280" class="Function">is-emb-fix-right-is-binary-equiv</a> <a id="1987" href="foundation.binary-embeddings.html#1712" class="Bound">f</a> <a id="1989" href="foundation.binary-embeddings.html#1715" class="Bound">H</a> <a id="1991" href="foundation.binary-embeddings.html#1718" class="Bound">x</a> <a id="1993" href="foundation.binary-embeddings.html#1722" class="Bound">x&#39;</a><a id="1995" class="Symbol">)</a>
        <a id="2005" class="Symbol">(</a> <a id="2007" href="foundation.identity-types.html#7649" class="Function">is-equiv-concat&#39;</a> <a id="2024" class="Symbol">(</a><a id="2025" href="foundation.binary-embeddings.html#1712" class="Bound">f</a> <a id="2027" href="foundation.binary-embeddings.html#1718" class="Bound">x</a> <a id="2029" href="foundation.binary-embeddings.html#1727" class="Bound">y</a><a id="2030" class="Symbol">)</a> <a id="2032" class="Symbol">(</a><a id="2033" href="foundation.action-on-identifications-functions.html#790" class="Function">ap</a> <a id="2036" class="Symbol">(</a><a id="2037" href="foundation.binary-equivalences.html#533" class="Function">fix-left</a> <a id="2046" href="foundation.binary-embeddings.html#1712" class="Bound">f</a> <a id="2048" href="foundation.binary-embeddings.html#1722" class="Bound">x&#39;</a><a id="2050" class="Symbol">)</a> <a id="2052" href="foundation.binary-embeddings.html#1752" class="Bound">q</a><a id="2053" class="Symbol">)))</a>
    <a id="2061" class="Symbol">(</a> <a id="2063" class="Symbol">λ</a> <a id="2065" href="foundation.binary-embeddings.html#2065" class="Bound">p</a> <a id="2067" class="Symbol">→</a>
      <a id="2075" href="foundation-core.equivalences.html#7601" class="Function">is-equiv-comp-htpy</a>
        <a id="2102" class="Symbol">(</a> <a id="2104" class="Symbol">λ</a> <a id="2106" href="foundation.binary-embeddings.html#2106" class="Bound">q</a> <a id="2108" class="Symbol">→</a> <a id="2110" href="foundation.action-on-identifications-binary-functions.html#603" class="Function">ap-binary</a> <a id="2120" href="foundation.binary-embeddings.html#1712" class="Bound">f</a> <a id="2122" href="foundation.binary-embeddings.html#2065" class="Bound">p</a> <a id="2124" href="foundation.binary-embeddings.html#2106" class="Bound">q</a><a id="2125" class="Symbol">)</a>
        <a id="2135" class="Symbol">(</a> <a id="2137" href="foundation-core.identity-types.html#7008" class="Function">concat</a> <a id="2144" class="Symbol">(</a><a id="2145" href="foundation.action-on-identifications-functions.html#790" class="Function">ap</a> <a id="2148" class="Symbol">(</a><a id="2149" href="foundation.binary-equivalences.html#651" class="Function">fix-right</a> <a id="2159" href="foundation.binary-embeddings.html#1712" class="Bound">f</a> <a id="2161" href="foundation.binary-embeddings.html#1727" class="Bound">y</a><a id="2162" class="Symbol">)</a> <a id="2164" href="foundation.binary-embeddings.html#2065" class="Bound">p</a><a id="2165" class="Symbol">)</a> <a id="2167" class="Symbol">(</a><a id="2168" href="foundation.binary-embeddings.html#1712" class="Bound">f</a> <a id="2170" href="foundation.binary-embeddings.html#1722" class="Bound">x&#39;</a> <a id="2173" href="foundation.binary-embeddings.html#1731" class="Bound">y&#39;</a><a id="2175" class="Symbol">))</a>
        <a id="2186" class="Symbol">(</a> <a id="2188" class="Symbol">λ</a> <a id="2190" href="foundation.binary-embeddings.html#2190" class="Bound">q</a> <a id="2192" class="Symbol">→</a> <a id="2194" href="foundation.action-on-identifications-functions.html#790" class="Function">ap</a> <a id="2197" class="Symbol">(</a><a id="2198" href="foundation.binary-equivalences.html#533" class="Function">fix-left</a> <a id="2207" href="foundation.binary-embeddings.html#1712" class="Bound">f</a> <a id="2209" href="foundation.binary-embeddings.html#1722" class="Bound">x&#39;</a><a id="2211" class="Symbol">)</a> <a id="2213" href="foundation.binary-embeddings.html#2190" class="Bound">q</a><a id="2214" class="Symbol">)</a>
        <a id="2224" class="Symbol">(</a> <a id="2226" class="Symbol">λ</a> <a id="2228" href="foundation.binary-embeddings.html#2228" class="Bound">q</a> <a id="2230" class="Symbol">→</a> <a id="2232" href="foundation.action-on-identifications-binary-functions.html#984" class="Function">triangle-ap-binary</a> <a id="2251" href="foundation.binary-embeddings.html#1712" class="Bound">f</a> <a id="2253" href="foundation.binary-embeddings.html#2065" class="Bound">p</a> <a id="2255" href="foundation.binary-embeddings.html#2228" class="Bound">q</a><a id="2256" class="Symbol">)</a>
        <a id="2266" class="Symbol">(</a> <a id="2268" href="foundation.binary-embeddings.html#1032" class="Function">is-emb-fix-left-is-binary-equiv</a> <a id="2300" href="foundation.binary-embeddings.html#1712" class="Bound">f</a> <a id="2302" href="foundation.binary-embeddings.html#1715" class="Bound">H</a> <a id="2304" href="foundation.binary-embeddings.html#1727" class="Bound">y</a> <a id="2306" href="foundation.binary-embeddings.html#1731" class="Bound">y&#39;</a><a id="2308" class="Symbol">)</a>
        <a id="2318" class="Symbol">(</a> <a id="2320" href="foundation.identity-types.html#6541" class="Function">is-equiv-concat</a> <a id="2336" class="Symbol">(</a><a id="2337" href="foundation.action-on-identifications-functions.html#790" class="Function">ap</a> <a id="2340" class="Symbol">(</a><a id="2341" href="foundation.binary-equivalences.html#651" class="Function">fix-right</a> <a id="2351" href="foundation.binary-embeddings.html#1712" class="Bound">f</a> <a id="2353" href="foundation.binary-embeddings.html#1727" class="Bound">y</a><a id="2354" class="Symbol">)</a> <a id="2356" href="foundation.binary-embeddings.html#2065" class="Bound">p</a><a id="2357" class="Symbol">)</a> <a id="2359" class="Symbol">(</a><a id="2360" href="foundation.binary-embeddings.html#1712" class="Bound">f</a> <a id="2362" href="foundation.binary-embeddings.html#1722" class="Bound">x&#39;</a> <a id="2365" href="foundation.binary-embeddings.html#1731" class="Bound">y&#39;</a><a id="2367" class="Symbol">)))</a>
</pre>