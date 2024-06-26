# `1`-Types

<pre class="Agda"><a id="22" class="Keyword">module</a> <a id="29" href="foundation-core.1-types.html" class="Module">foundation-core.1-types</a> <a id="53" class="Keyword">where</a>
</pre>
<details><summary>Imports</summary>

<pre class="Agda"><a id="109" class="Keyword">open</a> <a id="114" class="Keyword">import</a> <a id="121" href="foundation.dependent-pair-types.html" class="Module">foundation.dependent-pair-types</a>
<a id="153" class="Keyword">open</a> <a id="158" class="Keyword">import</a> <a id="165" href="foundation.universe-levels.html" class="Module">foundation.universe-levels</a>

<a id="193" class="Keyword">open</a> <a id="198" class="Keyword">import</a> <a id="205" href="foundation-core.equivalences.html" class="Module">foundation-core.equivalences</a>
<a id="234" class="Keyword">open</a> <a id="239" class="Keyword">import</a> <a id="246" href="foundation-core.identity-types.html" class="Module">foundation-core.identity-types</a>
<a id="277" class="Keyword">open</a> <a id="282" class="Keyword">import</a> <a id="289" href="foundation-core.sets.html" class="Module">foundation-core.sets</a>
<a id="310" class="Keyword">open</a> <a id="315" class="Keyword">import</a> <a id="322" href="foundation-core.truncated-types.html" class="Module">foundation-core.truncated-types</a>
<a id="354" class="Keyword">open</a> <a id="359" class="Keyword">import</a> <a id="366" href="foundation-core.truncation-levels.html" class="Module">foundation-core.truncation-levels</a>
</pre>
</details>

## Definition

A 1-type is a type that is 1-truncated.

<pre class="Agda"><a id="is-1-type"></a><a id="481" href="foundation-core.1-types.html#481" class="Function">is-1-type</a> <a id="491" class="Symbol">:</a> <a id="493" class="Symbol">{</a><a id="494" href="foundation-core.1-types.html#494" class="Bound">l</a> <a id="496" class="Symbol">:</a> <a id="498" href="Agda.Primitive.html#591" class="Postulate">Level</a><a id="503" class="Symbol">}</a> <a id="505" class="Symbol">→</a> <a id="507" href="Agda.Primitive.html#320" class="Primitive">UU</a> <a id="510" href="foundation-core.1-types.html#494" class="Bound">l</a> <a id="512" class="Symbol">→</a> <a id="514" href="Agda.Primitive.html#320" class="Primitive">UU</a> <a id="517" href="foundation-core.1-types.html#494" class="Bound">l</a>
<a id="519" href="foundation-core.1-types.html#481" class="Function">is-1-type</a> <a id="529" class="Symbol">=</a> <a id="531" href="foundation-core.truncated-types.html#1230" class="Function">is-trunc</a> <a id="540" href="foundation-core.truncation-levels.html#504" class="Function">one-𝕋</a>

<a id="1-Type"></a><a id="547" href="foundation-core.1-types.html#547" class="Function">1-Type</a> <a id="554" class="Symbol">:</a> <a id="556" class="Symbol">(</a><a id="557" href="foundation-core.1-types.html#557" class="Bound">l</a> <a id="559" class="Symbol">:</a> <a id="561" href="Agda.Primitive.html#591" class="Postulate">Level</a><a id="566" class="Symbol">)</a> <a id="568" class="Symbol">→</a> <a id="570" href="Agda.Primitive.html#320" class="Primitive">UU</a> <a id="573" class="Symbol">(</a><a id="574" href="Agda.Primitive.html#774" class="Primitive">lsuc</a> <a id="579" href="foundation-core.1-types.html#557" class="Bound">l</a><a id="580" class="Symbol">)</a>
<a id="582" href="foundation-core.1-types.html#547" class="Function">1-Type</a> <a id="589" href="foundation-core.1-types.html#589" class="Bound">l</a> <a id="591" class="Symbol">=</a> <a id="593" href="foundation.dependent-pair-types.html#505" class="Record">Σ</a> <a id="595" class="Symbol">(</a><a id="596" href="Agda.Primitive.html#320" class="Primitive">UU</a> <a id="599" href="foundation-core.1-types.html#589" class="Bound">l</a><a id="600" class="Symbol">)</a> <a id="602" href="foundation-core.1-types.html#481" class="Function">is-1-type</a>

<a id="type-1-Type"></a><a id="613" href="foundation-core.1-types.html#613" class="Function">type-1-Type</a> <a id="625" class="Symbol">:</a> <a id="627" class="Symbol">{</a><a id="628" href="foundation-core.1-types.html#628" class="Bound">l</a> <a id="630" class="Symbol">:</a> <a id="632" href="Agda.Primitive.html#591" class="Postulate">Level</a><a id="637" class="Symbol">}</a> <a id="639" class="Symbol">→</a> <a id="641" href="foundation-core.1-types.html#547" class="Function">1-Type</a> <a id="648" href="foundation-core.1-types.html#628" class="Bound">l</a> <a id="650" class="Symbol">→</a> <a id="652" href="Agda.Primitive.html#320" class="Primitive">UU</a> <a id="655" href="foundation-core.1-types.html#628" class="Bound">l</a>
<a id="657" href="foundation-core.1-types.html#613" class="Function">type-1-Type</a> <a id="669" class="Symbol">=</a> <a id="671" href="foundation.dependent-pair-types.html#603" class="Field">pr1</a>

<a id="676" class="Keyword">abstract</a>
  <a id="is-1-type-type-1-Type"></a><a id="687" href="foundation-core.1-types.html#687" class="Function">is-1-type-type-1-Type</a> <a id="709" class="Symbol">:</a>
    <a id="715" class="Symbol">{</a><a id="716" href="foundation-core.1-types.html#716" class="Bound">l</a> <a id="718" class="Symbol">:</a> <a id="720" href="Agda.Primitive.html#591" class="Postulate">Level</a><a id="725" class="Symbol">}</a> <a id="727" class="Symbol">(</a><a id="728" href="foundation-core.1-types.html#728" class="Bound">A</a> <a id="730" class="Symbol">:</a> <a id="732" href="foundation-core.1-types.html#547" class="Function">1-Type</a> <a id="739" href="foundation-core.1-types.html#716" class="Bound">l</a><a id="740" class="Symbol">)</a> <a id="742" class="Symbol">→</a> <a id="744" href="foundation-core.1-types.html#481" class="Function">is-1-type</a> <a id="754" class="Symbol">(</a><a id="755" href="foundation-core.1-types.html#613" class="Function">type-1-Type</a> <a id="767" href="foundation-core.1-types.html#728" class="Bound">A</a><a id="768" class="Symbol">)</a>
  <a id="772" href="foundation-core.1-types.html#687" class="Function">is-1-type-type-1-Type</a> <a id="794" class="Symbol">=</a> <a id="796" href="foundation.dependent-pair-types.html#615" class="Field">pr2</a>
</pre>
## Properties

### The identity type of a 1-type takes values in sets

<pre class="Agda"><a id="Id-Set"></a><a id="884" href="foundation-core.1-types.html#884" class="Function">Id-Set</a> <a id="891" class="Symbol">:</a> <a id="893" class="Symbol">{</a><a id="894" href="foundation-core.1-types.html#894" class="Bound">l</a> <a id="896" class="Symbol">:</a> <a id="898" href="Agda.Primitive.html#591" class="Postulate">Level</a><a id="903" class="Symbol">}</a> <a id="905" class="Symbol">(</a><a id="906" href="foundation-core.1-types.html#906" class="Bound">X</a> <a id="908" class="Symbol">:</a> <a id="910" href="foundation-core.1-types.html#547" class="Function">1-Type</a> <a id="917" href="foundation-core.1-types.html#894" class="Bound">l</a><a id="918" class="Symbol">)</a> <a id="920" class="Symbol">(</a><a id="921" href="foundation-core.1-types.html#921" class="Bound">x</a> <a id="923" href="foundation-core.1-types.html#923" class="Bound">y</a> <a id="925" class="Symbol">:</a> <a id="927" href="foundation-core.1-types.html#613" class="Function">type-1-Type</a> <a id="939" href="foundation-core.1-types.html#906" class="Bound">X</a><a id="940" class="Symbol">)</a> <a id="942" class="Symbol">→</a> <a id="944" href="foundation-core.sets.html#689" class="Function">Set</a> <a id="948" href="foundation-core.1-types.html#894" class="Bound">l</a>
<a id="950" href="foundation.dependent-pair-types.html#603" class="Field">pr1</a> <a id="954" class="Symbol">(</a><a id="955" href="foundation-core.1-types.html#884" class="Function">Id-Set</a> <a id="962" href="foundation-core.1-types.html#962" class="Bound">X</a> <a id="964" href="foundation-core.1-types.html#964" class="Bound">x</a> <a id="966" href="foundation-core.1-types.html#966" class="Bound">y</a><a id="967" class="Symbol">)</a> <a id="969" class="Symbol">=</a> <a id="971" class="Symbol">(</a><a id="972" href="foundation-core.1-types.html#964" class="Bound">x</a> <a id="974" href="foundation-core.identity-types.html#5999" class="Function Operator">＝</a> <a id="976" href="foundation-core.1-types.html#966" class="Bound">y</a><a id="977" class="Symbol">)</a>
<a id="979" href="foundation.dependent-pair-types.html#615" class="Field">pr2</a> <a id="983" class="Symbol">(</a><a id="984" href="foundation-core.1-types.html#884" class="Function">Id-Set</a> <a id="991" href="foundation-core.1-types.html#991" class="Bound">X</a> <a id="993" href="foundation-core.1-types.html#993" class="Bound">x</a> <a id="995" href="foundation-core.1-types.html#995" class="Bound">y</a><a id="996" class="Symbol">)</a> <a id="998" class="Symbol">=</a> <a id="1000" href="foundation-core.1-types.html#687" class="Function">is-1-type-type-1-Type</a> <a id="1022" href="foundation-core.1-types.html#991" class="Bound">X</a> <a id="1024" href="foundation-core.1-types.html#993" class="Bound">x</a> <a id="1026" href="foundation-core.1-types.html#995" class="Bound">y</a>
</pre>
### Any set is a 1-type

<pre class="Agda"><a id="1-type-Set"></a><a id="1066" href="foundation-core.1-types.html#1066" class="Function">1-type-Set</a> <a id="1077" class="Symbol">:</a>
  <a id="1081" class="Symbol">{</a><a id="1082" href="foundation-core.1-types.html#1082" class="Bound">l</a> <a id="1084" class="Symbol">:</a> <a id="1086" href="Agda.Primitive.html#591" class="Postulate">Level</a><a id="1091" class="Symbol">}</a> <a id="1093" class="Symbol">→</a> <a id="1095" href="foundation-core.sets.html#689" class="Function">Set</a> <a id="1099" href="foundation-core.1-types.html#1082" class="Bound">l</a> <a id="1101" class="Symbol">→</a> <a id="1103" href="foundation-core.1-types.html#547" class="Function">1-Type</a> <a id="1110" href="foundation-core.1-types.html#1082" class="Bound">l</a>
<a id="1112" href="foundation-core.1-types.html#1066" class="Function">1-type-Set</a> <a id="1123" href="foundation-core.1-types.html#1123" class="Bound">A</a> <a id="1125" class="Symbol">=</a> <a id="1127" href="foundation-core.truncated-types.html#2287" class="Function">truncated-type-succ-Truncated-Type</a> <a id="1162" href="foundation-core.truncation-levels.html#466" class="Function">zero-𝕋</a> <a id="1169" href="foundation-core.1-types.html#1123" class="Bound">A</a>
</pre>
### The 1-types are closed under equivalences

<pre class="Agda"><a id="1231" class="Keyword">abstract</a>
  <a id="is-1-type-is-equiv"></a><a id="1242" href="foundation-core.1-types.html#1242" class="Function">is-1-type-is-equiv</a> <a id="1261" class="Symbol">:</a>
    <a id="1267" class="Symbol">{</a><a id="1268" href="foundation-core.1-types.html#1268" class="Bound">l1</a> <a id="1271" href="foundation-core.1-types.html#1271" class="Bound">l2</a> <a id="1274" class="Symbol">:</a> <a id="1276" href="Agda.Primitive.html#591" class="Postulate">Level</a><a id="1281" class="Symbol">}</a> <a id="1283" class="Symbol">{</a><a id="1284" href="foundation-core.1-types.html#1284" class="Bound">A</a> <a id="1286" class="Symbol">:</a> <a id="1288" href="Agda.Primitive.html#320" class="Primitive">UU</a> <a id="1291" href="foundation-core.1-types.html#1268" class="Bound">l1</a><a id="1293" class="Symbol">}</a> <a id="1295" class="Symbol">(</a><a id="1296" href="foundation-core.1-types.html#1296" class="Bound">B</a> <a id="1298" class="Symbol">:</a> <a id="1300" href="Agda.Primitive.html#320" class="Primitive">UU</a> <a id="1303" href="foundation-core.1-types.html#1271" class="Bound">l2</a><a id="1305" class="Symbol">)</a> <a id="1307" class="Symbol">(</a><a id="1308" href="foundation-core.1-types.html#1308" class="Bound">f</a> <a id="1310" class="Symbol">:</a> <a id="1312" href="foundation-core.1-types.html#1284" class="Bound">A</a> <a id="1314" class="Symbol">→</a> <a id="1316" href="foundation-core.1-types.html#1296" class="Bound">B</a><a id="1317" class="Symbol">)</a> <a id="1319" class="Symbol">→</a> <a id="1321" href="foundation-core.equivalences.html#1353" class="Function">is-equiv</a> <a id="1330" href="foundation-core.1-types.html#1308" class="Bound">f</a> <a id="1332" class="Symbol">→</a>
    <a id="1338" href="foundation-core.1-types.html#481" class="Function">is-1-type</a> <a id="1348" href="foundation-core.1-types.html#1296" class="Bound">B</a> <a id="1350" class="Symbol">→</a> <a id="1352" href="foundation-core.1-types.html#481" class="Function">is-1-type</a> <a id="1362" href="foundation-core.1-types.html#1284" class="Bound">A</a>
  <a id="1366" href="foundation-core.1-types.html#1242" class="Function">is-1-type-is-equiv</a> <a id="1385" class="Symbol">=</a> <a id="1387" href="foundation-core.truncated-types.html#3757" class="Function">is-trunc-is-equiv</a> <a id="1405" href="foundation-core.truncation-levels.html#504" class="Function">one-𝕋</a>

<a id="1412" class="Keyword">abstract</a>
  <a id="is-1-type-equiv"></a><a id="1423" href="foundation-core.1-types.html#1423" class="Function">is-1-type-equiv</a> <a id="1439" class="Symbol">:</a>
    <a id="1445" class="Symbol">{</a><a id="1446" href="foundation-core.1-types.html#1446" class="Bound">l1</a> <a id="1449" href="foundation-core.1-types.html#1449" class="Bound">l2</a> <a id="1452" class="Symbol">:</a> <a id="1454" href="Agda.Primitive.html#591" class="Postulate">Level</a><a id="1459" class="Symbol">}</a> <a id="1461" class="Symbol">{</a><a id="1462" href="foundation-core.1-types.html#1462" class="Bound">A</a> <a id="1464" class="Symbol">:</a> <a id="1466" href="Agda.Primitive.html#320" class="Primitive">UU</a> <a id="1469" href="foundation-core.1-types.html#1446" class="Bound">l1</a><a id="1471" class="Symbol">}</a> <a id="1473" class="Symbol">(</a><a id="1474" href="foundation-core.1-types.html#1474" class="Bound">B</a> <a id="1476" class="Symbol">:</a> <a id="1478" href="Agda.Primitive.html#320" class="Primitive">UU</a> <a id="1481" href="foundation-core.1-types.html#1449" class="Bound">l2</a><a id="1483" class="Symbol">)</a> <a id="1485" class="Symbol">(</a><a id="1486" href="foundation-core.1-types.html#1486" class="Bound">e</a> <a id="1488" class="Symbol">:</a> <a id="1490" href="foundation-core.1-types.html#1462" class="Bound">A</a> <a id="1492" href="foundation-core.equivalences.html#1440" class="Function Operator">≃</a> <a id="1494" href="foundation-core.1-types.html#1474" class="Bound">B</a><a id="1495" class="Symbol">)</a> <a id="1497" class="Symbol">→</a>
    <a id="1503" href="foundation-core.1-types.html#481" class="Function">is-1-type</a> <a id="1513" href="foundation-core.1-types.html#1474" class="Bound">B</a> <a id="1515" class="Symbol">→</a> <a id="1517" href="foundation-core.1-types.html#481" class="Function">is-1-type</a> <a id="1527" href="foundation-core.1-types.html#1462" class="Bound">A</a>
  <a id="1531" href="foundation-core.1-types.html#1423" class="Function">is-1-type-equiv</a> <a id="1547" class="Symbol">=</a> <a id="1549" href="foundation-core.truncated-types.html#3989" class="Function">is-trunc-equiv</a> <a id="1564" href="foundation-core.truncation-levels.html#504" class="Function">one-𝕋</a>

<a id="1571" class="Keyword">abstract</a>
  <a id="is-1-type-is-equiv&#39;"></a><a id="1582" href="foundation-core.1-types.html#1582" class="Function">is-1-type-is-equiv&#39;</a> <a id="1602" class="Symbol">:</a>
    <a id="1608" class="Symbol">{</a><a id="1609" href="foundation-core.1-types.html#1609" class="Bound">l1</a> <a id="1612" href="foundation-core.1-types.html#1612" class="Bound">l2</a> <a id="1615" class="Symbol">:</a> <a id="1617" href="Agda.Primitive.html#591" class="Postulate">Level</a><a id="1622" class="Symbol">}</a> <a id="1624" class="Symbol">(</a><a id="1625" href="foundation-core.1-types.html#1625" class="Bound">A</a> <a id="1627" class="Symbol">:</a> <a id="1629" href="Agda.Primitive.html#320" class="Primitive">UU</a> <a id="1632" href="foundation-core.1-types.html#1609" class="Bound">l1</a><a id="1634" class="Symbol">)</a> <a id="1636" class="Symbol">{</a><a id="1637" href="foundation-core.1-types.html#1637" class="Bound">B</a> <a id="1639" class="Symbol">:</a> <a id="1641" href="Agda.Primitive.html#320" class="Primitive">UU</a> <a id="1644" href="foundation-core.1-types.html#1612" class="Bound">l2</a><a id="1646" class="Symbol">}</a> <a id="1648" class="Symbol">(</a><a id="1649" href="foundation-core.1-types.html#1649" class="Bound">f</a> <a id="1651" class="Symbol">:</a> <a id="1653" href="foundation-core.1-types.html#1625" class="Bound">A</a> <a id="1655" class="Symbol">→</a> <a id="1657" href="foundation-core.1-types.html#1637" class="Bound">B</a><a id="1658" class="Symbol">)</a> <a id="1660" class="Symbol">→</a>
    <a id="1666" href="foundation-core.equivalences.html#1353" class="Function">is-equiv</a> <a id="1675" href="foundation-core.1-types.html#1649" class="Bound">f</a> <a id="1677" class="Symbol">→</a> <a id="1679" href="foundation-core.1-types.html#481" class="Function">is-1-type</a> <a id="1689" href="foundation-core.1-types.html#1625" class="Bound">A</a> <a id="1691" class="Symbol">→</a> <a id="1693" href="foundation-core.1-types.html#481" class="Function">is-1-type</a> <a id="1703" href="foundation-core.1-types.html#1637" class="Bound">B</a>
  <a id="1707" href="foundation-core.1-types.html#1582" class="Function">is-1-type-is-equiv&#39;</a> <a id="1727" class="Symbol">=</a> <a id="1729" href="foundation-core.truncated-types.html#4198" class="Function">is-trunc-is-equiv&#39;</a> <a id="1748" href="foundation-core.truncation-levels.html#504" class="Function">one-𝕋</a>

<a id="1755" class="Keyword">abstract</a>
  <a id="is-1-type-equiv&#39;"></a><a id="1766" href="foundation-core.1-types.html#1766" class="Function">is-1-type-equiv&#39;</a> <a id="1783" class="Symbol">:</a>
    <a id="1789" class="Symbol">{</a><a id="1790" href="foundation-core.1-types.html#1790" class="Bound">l1</a> <a id="1793" href="foundation-core.1-types.html#1793" class="Bound">l2</a> <a id="1796" class="Symbol">:</a> <a id="1798" href="Agda.Primitive.html#591" class="Postulate">Level</a><a id="1803" class="Symbol">}</a> <a id="1805" class="Symbol">(</a><a id="1806" href="foundation-core.1-types.html#1806" class="Bound">A</a> <a id="1808" class="Symbol">:</a> <a id="1810" href="Agda.Primitive.html#320" class="Primitive">UU</a> <a id="1813" href="foundation-core.1-types.html#1790" class="Bound">l1</a><a id="1815" class="Symbol">)</a> <a id="1817" class="Symbol">{</a><a id="1818" href="foundation-core.1-types.html#1818" class="Bound">B</a> <a id="1820" class="Symbol">:</a> <a id="1822" href="Agda.Primitive.html#320" class="Primitive">UU</a> <a id="1825" href="foundation-core.1-types.html#1793" class="Bound">l2</a><a id="1827" class="Symbol">}</a> <a id="1829" class="Symbol">(</a><a id="1830" href="foundation-core.1-types.html#1830" class="Bound">e</a> <a id="1832" class="Symbol">:</a> <a id="1834" href="foundation-core.1-types.html#1806" class="Bound">A</a> <a id="1836" href="foundation-core.equivalences.html#1440" class="Function Operator">≃</a> <a id="1838" href="foundation-core.1-types.html#1818" class="Bound">B</a><a id="1839" class="Symbol">)</a> <a id="1841" class="Symbol">→</a>
    <a id="1847" href="foundation-core.1-types.html#481" class="Function">is-1-type</a> <a id="1857" href="foundation-core.1-types.html#1806" class="Bound">A</a> <a id="1859" class="Symbol">→</a> <a id="1861" href="foundation-core.1-types.html#481" class="Function">is-1-type</a> <a id="1871" href="foundation-core.1-types.html#1818" class="Bound">B</a>
  <a id="1875" href="foundation-core.1-types.html#1766" class="Function">is-1-type-equiv&#39;</a> <a id="1892" class="Symbol">=</a> <a id="1894" href="foundation-core.truncated-types.html#4522" class="Function">is-trunc-equiv&#39;</a> <a id="1910" href="foundation-core.truncation-levels.html#504" class="Function">one-𝕋</a>
</pre>