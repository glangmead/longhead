# The unit type

<pre class="Agda"><a id="26" class="Keyword">module</a> <a id="33" href="foundation.unit-type.html" class="Module">foundation.unit-type</a> <a id="54" class="Keyword">where</a>
</pre>
<details><summary>Imports</summary>

<pre class="Agda"><a id="110" class="Keyword">open</a> <a id="115" class="Keyword">import</a> <a id="122" href="foundation.dependent-pair-types.html" class="Module">foundation.dependent-pair-types</a>
<a id="154" class="Keyword">open</a> <a id="159" class="Keyword">import</a> <a id="166" href="foundation.raising-universe-levels.html" class="Module">foundation.raising-universe-levels</a>
<a id="201" class="Keyword">open</a> <a id="206" class="Keyword">import</a> <a id="213" href="foundation.universe-levels.html" class="Module">foundation.universe-levels</a>

<a id="241" class="Keyword">open</a> <a id="246" class="Keyword">import</a> <a id="253" href="foundation-core.constant-maps.html" class="Module">foundation-core.constant-maps</a>
<a id="283" class="Keyword">open</a> <a id="288" class="Keyword">import</a> <a id="295" href="foundation-core.contractible-types.html" class="Module">foundation-core.contractible-types</a>
<a id="330" class="Keyword">open</a> <a id="335" class="Keyword">import</a> <a id="342" href="foundation-core.equivalences.html" class="Module">foundation-core.equivalences</a>
<a id="371" class="Keyword">open</a> <a id="376" class="Keyword">import</a> <a id="383" href="foundation-core.identity-types.html" class="Module">foundation-core.identity-types</a>
<a id="414" class="Keyword">open</a> <a id="419" class="Keyword">import</a> <a id="426" href="foundation-core.propositions.html" class="Module">foundation-core.propositions</a>
<a id="455" class="Keyword">open</a> <a id="460" class="Keyword">import</a> <a id="467" href="foundation-core.sets.html" class="Module">foundation-core.sets</a>
<a id="488" class="Keyword">open</a> <a id="493" class="Keyword">import</a> <a id="500" href="foundation-core.truncated-types.html" class="Module">foundation-core.truncated-types</a>
<a id="532" class="Keyword">open</a> <a id="537" class="Keyword">import</a> <a id="544" href="foundation-core.truncation-levels.html" class="Module">foundation-core.truncation-levels</a>
</pre>
</details>

## Idea

The unit type is inductively generated by one point.

## Definition

### The unit type

<pre class="Agda"><a id="700" class="Keyword">record</a> <a id="unit"></a><a id="707" href="foundation.unit-type.html#707" class="Record">unit</a> <a id="712" class="Symbol">:</a> <a id="714" href="Agda.Primitive.html#320" class="Primitive">UU</a> <a id="717" href="Agda.Primitive.html#758" class="Primitive">lzero</a> <a id="723" class="Keyword">where</a>
  <a id="731" class="Keyword">instance</a> <a id="740" class="Keyword">constructor</a> <a id="star"></a><a id="752" href="foundation.unit-type.html#752" class="InductiveConstructor">star</a>

<a id="758" class="Symbol">{-#</a> <a id="762" class="Keyword">BUILTIN</a> <a id="770" class="Keyword">UNIT</a> <a id="775" href="foundation.unit-type.html#707" class="Record">unit</a> <a id="780" class="Symbol">#-}</a>
</pre>
### The induction principle of the unit type

<pre class="Agda"><a id="ind-unit"></a><a id="843" href="foundation.unit-type.html#843" class="Function">ind-unit</a> <a id="852" class="Symbol">:</a> <a id="854" class="Symbol">{</a><a id="855" href="foundation.unit-type.html#855" class="Bound">l</a> <a id="857" class="Symbol">:</a> <a id="859" href="Agda.Primitive.html#591" class="Postulate">Level</a><a id="864" class="Symbol">}</a> <a id="866" class="Symbol">{</a><a id="867" href="foundation.unit-type.html#867" class="Bound">P</a> <a id="869" class="Symbol">:</a> <a id="871" href="foundation.unit-type.html#707" class="Record">unit</a> <a id="876" class="Symbol">→</a> <a id="878" href="Agda.Primitive.html#320" class="Primitive">UU</a> <a id="881" href="foundation.unit-type.html#855" class="Bound">l</a><a id="882" class="Symbol">}</a> <a id="884" class="Symbol">→</a> <a id="886" href="foundation.unit-type.html#867" class="Bound">P</a> <a id="888" href="foundation.unit-type.html#752" class="InductiveConstructor">star</a> <a id="893" class="Symbol">→</a> <a id="895" class="Symbol">((</a><a id="897" href="foundation.unit-type.html#897" class="Bound">x</a> <a id="899" class="Symbol">:</a> <a id="901" href="foundation.unit-type.html#707" class="Record">unit</a><a id="905" class="Symbol">)</a> <a id="907" class="Symbol">→</a> <a id="909" href="foundation.unit-type.html#867" class="Bound">P</a> <a id="911" href="foundation.unit-type.html#897" class="Bound">x</a><a id="912" class="Symbol">)</a>
<a id="914" href="foundation.unit-type.html#843" class="Function">ind-unit</a> <a id="923" href="foundation.unit-type.html#923" class="Bound">p</a> <a id="925" href="foundation.unit-type.html#752" class="InductiveConstructor">star</a> <a id="930" class="Symbol">=</a> <a id="932" href="foundation.unit-type.html#923" class="Bound">p</a>
</pre>
### The terminal map out of a type

<pre class="Agda"><a id="terminal-map"></a><a id="983" href="foundation.unit-type.html#983" class="Function">terminal-map</a> <a id="996" class="Symbol">:</a> <a id="998" class="Symbol">{</a><a id="999" href="foundation.unit-type.html#999" class="Bound">l</a> <a id="1001" class="Symbol">:</a> <a id="1003" href="Agda.Primitive.html#591" class="Postulate">Level</a><a id="1008" class="Symbol">}</a> <a id="1010" class="Symbol">{</a><a id="1011" href="foundation.unit-type.html#1011" class="Bound">A</a> <a id="1013" class="Symbol">:</a> <a id="1015" href="Agda.Primitive.html#320" class="Primitive">UU</a> <a id="1018" href="foundation.unit-type.html#999" class="Bound">l</a><a id="1019" class="Symbol">}</a> <a id="1021" class="Symbol">→</a> <a id="1023" href="foundation.unit-type.html#1011" class="Bound">A</a> <a id="1025" class="Symbol">→</a> <a id="1027" href="foundation.unit-type.html#707" class="Record">unit</a>
<a id="1032" href="foundation.unit-type.html#983" class="Function">terminal-map</a> <a id="1045" class="Symbol">=</a> <a id="1047" href="foundation-core.constant-maps.html#198" class="Function">const</a> <a id="1053" class="Symbol">_</a> <a id="1055" href="foundation.unit-type.html#707" class="Record">unit</a> <a id="1060" href="foundation.unit-type.html#752" class="InductiveConstructor">star</a>
</pre>
### Points as maps out of the unit type

<pre class="Agda"><a id="point"></a><a id="1119" href="foundation.unit-type.html#1119" class="Function">point</a> <a id="1125" class="Symbol">:</a> <a id="1127" class="Symbol">{</a><a id="1128" href="foundation.unit-type.html#1128" class="Bound">l</a> <a id="1130" class="Symbol">:</a> <a id="1132" href="Agda.Primitive.html#591" class="Postulate">Level</a><a id="1137" class="Symbol">}</a> <a id="1139" class="Symbol">{</a><a id="1140" href="foundation.unit-type.html#1140" class="Bound">A</a> <a id="1142" class="Symbol">:</a> <a id="1144" href="Agda.Primitive.html#320" class="Primitive">UU</a> <a id="1147" href="foundation.unit-type.html#1128" class="Bound">l</a><a id="1148" class="Symbol">}</a> <a id="1150" class="Symbol">→</a> <a id="1152" href="foundation.unit-type.html#1140" class="Bound">A</a> <a id="1154" class="Symbol">→</a> <a id="1156" class="Symbol">(</a><a id="1157" href="foundation.unit-type.html#707" class="Record">unit</a> <a id="1162" class="Symbol">→</a> <a id="1164" href="foundation.unit-type.html#1140" class="Bound">A</a><a id="1165" class="Symbol">)</a>
<a id="1167" href="foundation.unit-type.html#1119" class="Function">point</a> <a id="1173" href="foundation.unit-type.html#1173" class="Bound">a</a> <a id="1175" class="Symbol">=</a> <a id="1177" href="foundation-core.constant-maps.html#198" class="Function">const</a> <a id="1183" href="foundation.unit-type.html#707" class="Record">unit</a> <a id="1188" class="Symbol">_</a> <a id="1190" href="foundation.unit-type.html#1173" class="Bound">a</a>
</pre>
### Raising the universe level of the unit type

<pre class="Agda"><a id="raise-unit"></a><a id="1254" href="foundation.unit-type.html#1254" class="Function">raise-unit</a> <a id="1265" class="Symbol">:</a> <a id="1267" class="Symbol">(</a><a id="1268" href="foundation.unit-type.html#1268" class="Bound">l</a> <a id="1270" class="Symbol">:</a> <a id="1272" href="Agda.Primitive.html#591" class="Postulate">Level</a><a id="1277" class="Symbol">)</a> <a id="1279" class="Symbol">→</a> <a id="1281" href="Agda.Primitive.html#320" class="Primitive">UU</a> <a id="1284" href="foundation.unit-type.html#1268" class="Bound">l</a>
<a id="1286" href="foundation.unit-type.html#1254" class="Function">raise-unit</a> <a id="1297" href="foundation.unit-type.html#1297" class="Bound">l</a> <a id="1299" class="Symbol">=</a> <a id="1301" href="foundation.raising-universe-levels.html#777" class="Datatype">raise</a> <a id="1307" href="foundation.unit-type.html#1297" class="Bound">l</a> <a id="1309" href="foundation.unit-type.html#707" class="Record">unit</a>

<a id="raise-star"></a><a id="1315" href="foundation.unit-type.html#1315" class="Function">raise-star</a> <a id="1326" class="Symbol">:</a> <a id="1328" class="Symbol">{</a><a id="1329" href="foundation.unit-type.html#1329" class="Bound">l</a> <a id="1331" class="Symbol">:</a> <a id="1333" href="Agda.Primitive.html#591" class="Postulate">Level</a><a id="1338" class="Symbol">}</a> <a id="1340" class="Symbol">→</a> <a id="1342" href="foundation.raising-universe-levels.html#777" class="Datatype">raise</a> <a id="1348" href="foundation.unit-type.html#1329" class="Bound">l</a> <a id="1350" href="foundation.unit-type.html#707" class="Record">unit</a>
<a id="1355" href="foundation.unit-type.html#1315" class="Function">raise-star</a> <a id="1366" class="Symbol">=</a> <a id="1368" href="foundation.raising-universe-levels.html#842" class="InductiveConstructor">map-raise</a> <a id="1378" href="foundation.unit-type.html#752" class="InductiveConstructor">star</a>

<a id="compute-raise-unit"></a><a id="1384" href="foundation.unit-type.html#1384" class="Function">compute-raise-unit</a> <a id="1403" class="Symbol">:</a> <a id="1405" class="Symbol">(</a><a id="1406" href="foundation.unit-type.html#1406" class="Bound">l</a> <a id="1408" class="Symbol">:</a> <a id="1410" href="Agda.Primitive.html#591" class="Postulate">Level</a><a id="1415" class="Symbol">)</a> <a id="1417" class="Symbol">→</a> <a id="1419" href="foundation.unit-type.html#707" class="Record">unit</a> <a id="1424" href="foundation-core.equivalences.html#1440" class="Function Operator">≃</a> <a id="1426" href="foundation.unit-type.html#1254" class="Function">raise-unit</a> <a id="1437" href="foundation.unit-type.html#1406" class="Bound">l</a>
<a id="1439" href="foundation.unit-type.html#1384" class="Function">compute-raise-unit</a> <a id="1458" href="foundation.unit-type.html#1458" class="Bound">l</a> <a id="1460" class="Symbol">=</a> <a id="1462" href="foundation.raising-universe-levels.html#1551" class="Function">compute-raise</a> <a id="1476" href="foundation.unit-type.html#1458" class="Bound">l</a> <a id="1478" href="foundation.unit-type.html#707" class="Record">unit</a>
</pre>
## Properties

### The unit type is contractible

<pre class="Agda"><a id="1546" class="Keyword">abstract</a>
  <a id="is-contr-unit"></a><a id="1557" href="foundation.unit-type.html#1557" class="Function">is-contr-unit</a> <a id="1571" class="Symbol">:</a> <a id="1573" href="foundation-core.contractible-types.html#802" class="Function">is-contr</a> <a id="1582" href="foundation.unit-type.html#707" class="Record">unit</a>
  <a id="1589" href="foundation.dependent-pair-types.html#603" class="Field">pr1</a> <a id="1593" href="foundation.unit-type.html#1557" class="Function">is-contr-unit</a> <a id="1607" class="Symbol">=</a> <a id="1609" href="foundation.unit-type.html#752" class="InductiveConstructor">star</a>
  <a id="1616" href="foundation.dependent-pair-types.html#615" class="Field">pr2</a> <a id="1620" href="foundation.unit-type.html#1557" class="Function">is-contr-unit</a> <a id="1634" href="foundation.unit-type.html#752" class="InductiveConstructor">star</a> <a id="1639" class="Symbol">=</a> <a id="1641" href="foundation-core.identity-types.html#5968" class="InductiveConstructor">refl</a>
</pre>
### Any contractible type is equivalent to the unit type

<pre class="Agda"><a id="1717" class="Keyword">module</a> <a id="1724" href="foundation.unit-type.html#1724" class="Module">_</a>
  <a id="1728" class="Symbol">{</a><a id="1729" href="foundation.unit-type.html#1729" class="Bound">l</a> <a id="1731" class="Symbol">:</a> <a id="1733" href="Agda.Primitive.html#591" class="Postulate">Level</a><a id="1738" class="Symbol">}</a> <a id="1740" class="Symbol">{</a><a id="1741" href="foundation.unit-type.html#1741" class="Bound">A</a> <a id="1743" class="Symbol">:</a> <a id="1745" href="Agda.Primitive.html#320" class="Primitive">UU</a> <a id="1748" href="foundation.unit-type.html#1729" class="Bound">l</a><a id="1749" class="Symbol">}</a>
  <a id="1753" class="Keyword">where</a>

  <a id="1762" class="Keyword">abstract</a>
    <a id="1775" href="foundation.unit-type.html#1775" class="Function">is-equiv-terminal-map-is-contr</a> <a id="1806" class="Symbol">:</a>
      <a id="1814" href="foundation-core.contractible-types.html#802" class="Function">is-contr</a> <a id="1823" href="foundation.unit-type.html#1741" class="Bound">A</a> <a id="1825" class="Symbol">→</a> <a id="1827" href="foundation-core.equivalences.html#1353" class="Function">is-equiv</a> <a id="1836" class="Symbol">(</a><a id="1837" href="foundation.unit-type.html#983" class="Function">terminal-map</a> <a id="1850" class="Symbol">{</a><a id="1851" class="Argument">A</a> <a id="1853" class="Symbol">=</a> <a id="1855" href="foundation.unit-type.html#1741" class="Bound">A</a><a id="1856" class="Symbol">})</a>
    <a id="1863" href="foundation.dependent-pair-types.html#603" class="Field">pr1</a> <a id="1867" class="Symbol">(</a><a id="1868" href="foundation.dependent-pair-types.html#603" class="Field">pr1</a> <a id="1872" class="Symbol">(</a><a id="1873" href="foundation.unit-type.html#1775" class="Function">is-equiv-terminal-map-is-contr</a> <a id="1904" href="foundation.unit-type.html#1904" class="Bound">H</a><a id="1905" class="Symbol">))</a> <a id="1908" class="Symbol">=</a> <a id="1910" href="foundation.unit-type.html#843" class="Function">ind-unit</a> <a id="1919" class="Symbol">(</a><a id="1920" href="foundation-core.contractible-types.html#894" class="Function">center</a> <a id="1927" href="foundation.unit-type.html#1904" class="Bound">H</a><a id="1928" class="Symbol">)</a>
    <a id="1934" href="foundation.dependent-pair-types.html#615" class="Field">pr2</a> <a id="1938" class="Symbol">(</a><a id="1939" href="foundation.dependent-pair-types.html#603" class="Field">pr1</a> <a id="1943" class="Symbol">(</a><a id="1944" href="foundation.unit-type.html#1775" class="Function">is-equiv-terminal-map-is-contr</a> <a id="1975" href="foundation.unit-type.html#1975" class="Bound">H</a><a id="1976" class="Symbol">))</a> <a id="1979" class="Symbol">=</a> <a id="1981" href="foundation.unit-type.html#843" class="Function">ind-unit</a> <a id="1990" href="foundation-core.identity-types.html#5968" class="InductiveConstructor">refl</a>
    <a id="1999" href="foundation.dependent-pair-types.html#603" class="Field">pr1</a> <a id="2003" class="Symbol">(</a><a id="2004" href="foundation.dependent-pair-types.html#615" class="Field">pr2</a> <a id="2008" class="Symbol">(</a><a id="2009" href="foundation.unit-type.html#1775" class="Function">is-equiv-terminal-map-is-contr</a> <a id="2040" href="foundation.unit-type.html#2040" class="Bound">H</a><a id="2041" class="Symbol">))</a> <a id="2044" href="foundation.unit-type.html#2044" class="Bound">x</a> <a id="2046" class="Symbol">=</a> <a id="2048" href="foundation-core.contractible-types.html#894" class="Function">center</a> <a id="2055" href="foundation.unit-type.html#2040" class="Bound">H</a>
    <a id="2061" href="foundation.dependent-pair-types.html#615" class="Field">pr2</a> <a id="2065" class="Symbol">(</a><a id="2066" href="foundation.dependent-pair-types.html#615" class="Field">pr2</a> <a id="2070" class="Symbol">(</a><a id="2071" href="foundation.unit-type.html#1775" class="Function">is-equiv-terminal-map-is-contr</a> <a id="2102" href="foundation.unit-type.html#2102" class="Bound">H</a><a id="2103" class="Symbol">))</a> <a id="2106" class="Symbol">=</a> <a id="2108" href="foundation-core.contractible-types.html#1232" class="Function">contraction</a> <a id="2120" href="foundation.unit-type.html#2102" class="Bound">H</a>

  <a id="2125" class="Keyword">abstract</a>
    <a id="2138" href="foundation.unit-type.html#2138" class="Function">is-contr-is-equiv-const</a> <a id="2162" class="Symbol">:</a> <a id="2164" href="foundation-core.equivalences.html#1353" class="Function">is-equiv</a> <a id="2173" class="Symbol">(</a><a id="2174" href="foundation.unit-type.html#983" class="Function">terminal-map</a> <a id="2187" class="Symbol">{</a><a id="2188" class="Argument">A</a> <a id="2190" class="Symbol">=</a> <a id="2192" href="foundation.unit-type.html#1741" class="Bound">A</a><a id="2193" class="Symbol">})</a> <a id="2196" class="Symbol">→</a> <a id="2198" href="foundation-core.contractible-types.html#802" class="Function">is-contr</a> <a id="2207" href="foundation.unit-type.html#1741" class="Bound">A</a>
    <a id="2213" href="foundation.dependent-pair-types.html#603" class="Field">pr1</a> <a id="2217" class="Symbol">(</a><a id="2218" href="foundation.unit-type.html#2138" class="Function">is-contr-is-equiv-const</a> <a id="2242" class="Symbol">((</a><a id="2244" href="foundation.unit-type.html#2244" class="Bound">g</a> <a id="2246" href="foundation.dependent-pair-types.html#689" class="InductiveConstructor Operator">,</a> <a id="2248" href="foundation.unit-type.html#2248" class="Bound">G</a><a id="2249" class="Symbol">)</a> <a id="2251" href="foundation.dependent-pair-types.html#689" class="InductiveConstructor Operator">,</a> <a id="2253" class="Symbol">(</a><a id="2254" href="foundation.unit-type.html#2254" class="Bound">h</a> <a id="2256" href="foundation.dependent-pair-types.html#689" class="InductiveConstructor Operator">,</a> <a id="2258" href="foundation.unit-type.html#2258" class="Bound">H</a><a id="2259" class="Symbol">)))</a> <a id="2263" class="Symbol">=</a> <a id="2265" href="foundation.unit-type.html#2254" class="Bound">h</a> <a id="2267" href="foundation.unit-type.html#752" class="InductiveConstructor">star</a>
    <a id="2276" href="foundation.dependent-pair-types.html#615" class="Field">pr2</a> <a id="2280" class="Symbol">(</a><a id="2281" href="foundation.unit-type.html#2138" class="Function">is-contr-is-equiv-const</a> <a id="2305" class="Symbol">((</a><a id="2307" href="foundation.unit-type.html#2307" class="Bound">g</a> <a id="2309" href="foundation.dependent-pair-types.html#689" class="InductiveConstructor Operator">,</a> <a id="2311" href="foundation.unit-type.html#2311" class="Bound">G</a><a id="2312" class="Symbol">)</a> <a id="2314" href="foundation.dependent-pair-types.html#689" class="InductiveConstructor Operator">,</a> <a id="2316" class="Symbol">(</a><a id="2317" href="foundation.unit-type.html#2317" class="Bound">h</a> <a id="2319" href="foundation.dependent-pair-types.html#689" class="InductiveConstructor Operator">,</a> <a id="2321" href="foundation.unit-type.html#2321" class="Bound">H</a><a id="2322" class="Symbol">)))</a> <a id="2326" class="Symbol">=</a> <a id="2328" href="foundation.unit-type.html#2321" class="Bound">H</a>
</pre>
### The unit type is a proposition

<pre class="Agda"><a id="2379" class="Keyword">abstract</a>
  <a id="is-prop-unit"></a><a id="2390" href="foundation.unit-type.html#2390" class="Function">is-prop-unit</a> <a id="2403" class="Symbol">:</a> <a id="2405" href="foundation-core.propositions.html#867" class="Function">is-prop</a> <a id="2413" href="foundation.unit-type.html#707" class="Record">unit</a>
  <a id="2420" href="foundation.unit-type.html#2390" class="Function">is-prop-unit</a> <a id="2433" class="Symbol">=</a> <a id="2435" href="foundation-core.contractible-types.html#7810" class="Function">is-prop-is-contr</a> <a id="2452" href="foundation.unit-type.html#1557" class="Function">is-contr-unit</a>

<a id="unit-Prop"></a><a id="2467" href="foundation.unit-type.html#2467" class="Function">unit-Prop</a> <a id="2477" class="Symbol">:</a> <a id="2479" href="foundation-core.propositions.html#949" class="Function">Prop</a> <a id="2484" href="Agda.Primitive.html#758" class="Primitive">lzero</a>
<a id="2490" href="foundation.dependent-pair-types.html#603" class="Field">pr1</a> <a id="2494" href="foundation.unit-type.html#2467" class="Function">unit-Prop</a> <a id="2504" class="Symbol">=</a> <a id="2506" href="foundation.unit-type.html#707" class="Record">unit</a>
<a id="2511" href="foundation.dependent-pair-types.html#615" class="Field">pr2</a> <a id="2515" href="foundation.unit-type.html#2467" class="Function">unit-Prop</a> <a id="2525" class="Symbol">=</a> <a id="2527" href="foundation.unit-type.html#2390" class="Function">is-prop-unit</a>
</pre>
### The unit type is a set

<pre class="Agda"><a id="2581" class="Keyword">abstract</a>
  <a id="is-set-unit"></a><a id="2592" href="foundation.unit-type.html#2592" class="Function">is-set-unit</a> <a id="2604" class="Symbol">:</a> <a id="2606" href="foundation-core.sets.html#614" class="Function">is-set</a> <a id="2613" href="foundation.unit-type.html#707" class="Record">unit</a>
  <a id="2620" href="foundation.unit-type.html#2592" class="Function">is-set-unit</a> <a id="2632" class="Symbol">=</a> <a id="2634" href="foundation-core.truncated-types.html#1973" class="Function">is-trunc-succ-is-trunc</a> <a id="2657" href="foundation-core.truncation-levels.html#422" class="Function">neg-one-𝕋</a> <a id="2667" href="foundation.unit-type.html#2390" class="Function">is-prop-unit</a>

<a id="unit-Set"></a><a id="2681" href="foundation.unit-type.html#2681" class="Function">unit-Set</a> <a id="2690" class="Symbol">:</a> <a id="2692" href="foundation-core.sets.html#689" class="Function">Set</a> <a id="2696" href="Agda.Primitive.html#758" class="Primitive">lzero</a>
<a id="2702" href="foundation.dependent-pair-types.html#603" class="Field">pr1</a> <a id="2706" href="foundation.unit-type.html#2681" class="Function">unit-Set</a> <a id="2715" class="Symbol">=</a> <a id="2717" href="foundation.unit-type.html#707" class="Record">unit</a>
<a id="2722" href="foundation.dependent-pair-types.html#615" class="Field">pr2</a> <a id="2726" href="foundation.unit-type.html#2681" class="Function">unit-Set</a> <a id="2735" class="Symbol">=</a> <a id="2737" href="foundation.unit-type.html#2592" class="Function">is-set-unit</a>
</pre>
<pre class="Agda"><a id="2762" class="Keyword">abstract</a>
  <a id="is-contr-raise-unit"></a><a id="2773" href="foundation.unit-type.html#2773" class="Function">is-contr-raise-unit</a> <a id="2793" class="Symbol">:</a>
    <a id="2799" class="Symbol">{</a><a id="2800" href="foundation.unit-type.html#2800" class="Bound">l1</a> <a id="2803" class="Symbol">:</a> <a id="2805" href="Agda.Primitive.html#591" class="Postulate">Level</a><a id="2810" class="Symbol">}</a> <a id="2812" class="Symbol">→</a> <a id="2814" href="foundation-core.contractible-types.html#802" class="Function">is-contr</a> <a id="2823" class="Symbol">(</a><a id="2824" href="foundation.unit-type.html#1254" class="Function">raise-unit</a> <a id="2835" href="foundation.unit-type.html#2800" class="Bound">l1</a><a id="2837" class="Symbol">)</a>
  <a id="2841" href="foundation.unit-type.html#2773" class="Function">is-contr-raise-unit</a> <a id="2861" class="Symbol">{</a><a id="2862" href="foundation.unit-type.html#2862" class="Bound">l1</a><a id="2864" class="Symbol">}</a> <a id="2866" class="Symbol">=</a>
    <a id="2872" href="foundation-core.contractible-types.html#3627" class="Function">is-contr-equiv&#39;</a> <a id="2888" href="foundation.unit-type.html#707" class="Record">unit</a> <a id="2893" class="Symbol">(</a><a id="2894" href="foundation.raising-universe-levels.html#1551" class="Function">compute-raise</a> <a id="2908" href="foundation.unit-type.html#2862" class="Bound">l1</a> <a id="2911" href="foundation.unit-type.html#707" class="Record">unit</a><a id="2915" class="Symbol">)</a> <a id="2917" href="foundation.unit-type.html#1557" class="Function">is-contr-unit</a>

<a id="2932" class="Keyword">abstract</a>
  <a id="is-prop-raise-unit"></a><a id="2943" href="foundation.unit-type.html#2943" class="Function">is-prop-raise-unit</a> <a id="2962" class="Symbol">:</a>
    <a id="2968" class="Symbol">{</a><a id="2969" href="foundation.unit-type.html#2969" class="Bound">l1</a> <a id="2972" class="Symbol">:</a> <a id="2974" href="Agda.Primitive.html#591" class="Postulate">Level</a><a id="2979" class="Symbol">}</a> <a id="2981" class="Symbol">→</a> <a id="2983" href="foundation-core.propositions.html#867" class="Function">is-prop</a> <a id="2991" class="Symbol">(</a><a id="2992" href="foundation.unit-type.html#1254" class="Function">raise-unit</a> <a id="3003" href="foundation.unit-type.html#2969" class="Bound">l1</a><a id="3005" class="Symbol">)</a>
  <a id="3009" href="foundation.unit-type.html#2943" class="Function">is-prop-raise-unit</a> <a id="3028" class="Symbol">{</a><a id="3029" href="foundation.unit-type.html#3029" class="Bound">l1</a><a id="3031" class="Symbol">}</a> <a id="3033" class="Symbol">=</a>
    <a id="3039" href="foundation-core.propositions.html#4426" class="Function">is-prop-equiv&#39;</a> <a id="3054" class="Symbol">(</a><a id="3055" href="foundation.raising-universe-levels.html#1551" class="Function">compute-raise</a> <a id="3069" href="foundation.unit-type.html#3029" class="Bound">l1</a> <a id="3072" href="foundation.unit-type.html#707" class="Record">unit</a><a id="3076" class="Symbol">)</a> <a id="3078" href="foundation.unit-type.html#2390" class="Function">is-prop-unit</a>

<a id="raise-unit-Prop"></a><a id="3092" href="foundation.unit-type.html#3092" class="Function">raise-unit-Prop</a> <a id="3108" class="Symbol">:</a>
  <a id="3112" class="Symbol">(</a><a id="3113" href="foundation.unit-type.html#3113" class="Bound">l1</a> <a id="3116" class="Symbol">:</a> <a id="3118" href="Agda.Primitive.html#591" class="Postulate">Level</a><a id="3123" class="Symbol">)</a> <a id="3125" class="Symbol">→</a> <a id="3127" href="foundation-core.propositions.html#949" class="Function">Prop</a> <a id="3132" href="foundation.unit-type.html#3113" class="Bound">l1</a>
<a id="3135" href="foundation.dependent-pair-types.html#603" class="Field">pr1</a> <a id="3139" class="Symbol">(</a><a id="3140" href="foundation.unit-type.html#3092" class="Function">raise-unit-Prop</a> <a id="3156" href="foundation.unit-type.html#3156" class="Bound">l1</a><a id="3158" class="Symbol">)</a> <a id="3160" class="Symbol">=</a> <a id="3162" href="foundation.unit-type.html#1254" class="Function">raise-unit</a> <a id="3173" href="foundation.unit-type.html#3156" class="Bound">l1</a>
<a id="3176" href="foundation.dependent-pair-types.html#615" class="Field">pr2</a> <a id="3180" class="Symbol">(</a><a id="3181" href="foundation.unit-type.html#3092" class="Function">raise-unit-Prop</a> <a id="3197" href="foundation.unit-type.html#3197" class="Bound">l1</a><a id="3199" class="Symbol">)</a> <a id="3201" class="Symbol">=</a> <a id="3203" href="foundation.unit-type.html#2943" class="Function">is-prop-raise-unit</a>

<a id="3223" class="Keyword">abstract</a>
  <a id="is-set-raise-unit"></a><a id="3234" href="foundation.unit-type.html#3234" class="Function">is-set-raise-unit</a> <a id="3252" class="Symbol">:</a>
    <a id="3258" class="Symbol">{</a><a id="3259" href="foundation.unit-type.html#3259" class="Bound">l1</a> <a id="3262" class="Symbol">:</a> <a id="3264" href="Agda.Primitive.html#591" class="Postulate">Level</a><a id="3269" class="Symbol">}</a> <a id="3271" class="Symbol">→</a> <a id="3273" href="foundation-core.sets.html#614" class="Function">is-set</a> <a id="3280" class="Symbol">(</a><a id="3281" href="foundation.unit-type.html#1254" class="Function">raise-unit</a> <a id="3292" href="foundation.unit-type.html#3259" class="Bound">l1</a><a id="3294" class="Symbol">)</a>
  <a id="3298" href="foundation.unit-type.html#3234" class="Function">is-set-raise-unit</a> <a id="3316" class="Symbol">=</a> <a id="3318" href="foundation-core.truncated-types.html#1973" class="Function">is-trunc-succ-is-trunc</a> <a id="3341" href="foundation-core.truncation-levels.html#422" class="Function">neg-one-𝕋</a> <a id="3351" href="foundation.unit-type.html#2943" class="Function">is-prop-raise-unit</a>

<a id="raise-unit-Set"></a><a id="3371" href="foundation.unit-type.html#3371" class="Function">raise-unit-Set</a> <a id="3386" class="Symbol">:</a> <a id="3388" href="foundation-core.sets.html#689" class="Function">Set</a> <a id="3392" href="Agda.Primitive.html#758" class="Primitive">lzero</a>
<a id="3398" href="foundation.dependent-pair-types.html#603" class="Field">pr1</a> <a id="3402" href="foundation.unit-type.html#3371" class="Function">raise-unit-Set</a> <a id="3417" class="Symbol">=</a> <a id="3419" href="foundation.unit-type.html#707" class="Record">unit</a>
<a id="3424" href="foundation.dependent-pair-types.html#615" class="Field">pr2</a> <a id="3428" href="foundation.unit-type.html#3371" class="Function">raise-unit-Set</a> <a id="3443" class="Symbol">=</a> <a id="3445" href="foundation.unit-type.html#2592" class="Function">is-set-unit</a>
</pre>