# Pointed types

<pre class="Agda"><a id="26" class="Keyword">module</a> <a id="33" href="structured-types.pointed-types.html" class="Module">structured-types.pointed-types</a> <a id="64" class="Keyword">where</a>
</pre>
<details><summary>Imports</summary>

<pre class="Agda"><a id="120" class="Keyword">open</a> <a id="125" class="Keyword">import</a> <a id="132" href="foundation.dependent-pair-types.html" class="Module">foundation.dependent-pair-types</a>
<a id="164" class="Keyword">open</a> <a id="169" class="Keyword">import</a> <a id="176" href="foundation.universe-levels.html" class="Module">foundation.universe-levels</a>
</pre>
</details>

## Idea

A **pointed type** is a type `A` equipped with an element `a : A`.

## Definition

### The universe of pointed types

<pre class="Agda"><a id="Pointed-Type"></a><a id="355" href="structured-types.pointed-types.html#355" class="Function">Pointed-Type</a> <a id="368" class="Symbol">:</a> <a id="370" class="Symbol">(</a><a id="371" href="structured-types.pointed-types.html#371" class="Bound">l</a> <a id="373" class="Symbol">:</a> <a id="375" href="Agda.Primitive.html#591" class="Postulate">Level</a><a id="380" class="Symbol">)</a> <a id="382" class="Symbol">→</a> <a id="384" href="Agda.Primitive.html#320" class="Primitive">UU</a> <a id="387" class="Symbol">(</a><a id="388" href="Agda.Primitive.html#774" class="Primitive">lsuc</a> <a id="393" href="structured-types.pointed-types.html#371" class="Bound">l</a><a id="394" class="Symbol">)</a>
<a id="396" href="structured-types.pointed-types.html#355" class="Function">Pointed-Type</a> <a id="409" href="structured-types.pointed-types.html#409" class="Bound">l</a> <a id="411" class="Symbol">=</a> <a id="413" href="foundation.dependent-pair-types.html#505" class="Record">Σ</a> <a id="415" class="Symbol">(</a><a id="416" href="Agda.Primitive.html#320" class="Primitive">UU</a> <a id="419" href="structured-types.pointed-types.html#409" class="Bound">l</a><a id="420" class="Symbol">)</a> <a id="422" class="Symbol">(λ</a> <a id="425" href="structured-types.pointed-types.html#425" class="Bound">X</a> <a id="427" class="Symbol">→</a> <a id="429" href="structured-types.pointed-types.html#425" class="Bound">X</a><a id="430" class="Symbol">)</a>

<a id="433" class="Keyword">module</a> <a id="440" href="structured-types.pointed-types.html#440" class="Module">_</a>
  <a id="444" class="Symbol">{</a><a id="445" href="structured-types.pointed-types.html#445" class="Bound">l</a> <a id="447" class="Symbol">:</a> <a id="449" href="Agda.Primitive.html#591" class="Postulate">Level</a><a id="454" class="Symbol">}</a> <a id="456" class="Symbol">(</a><a id="457" href="structured-types.pointed-types.html#457" class="Bound">A</a> <a id="459" class="Symbol">:</a> <a id="461" href="structured-types.pointed-types.html#355" class="Function">Pointed-Type</a> <a id="474" href="structured-types.pointed-types.html#445" class="Bound">l</a><a id="475" class="Symbol">)</a>
  <a id="479" class="Keyword">where</a>

  <a id="488" href="structured-types.pointed-types.html#488" class="Function">type-Pointed-Type</a> <a id="506" class="Symbol">:</a> <a id="508" href="Agda.Primitive.html#320" class="Primitive">UU</a> <a id="511" href="structured-types.pointed-types.html#445" class="Bound">l</a>
  <a id="515" href="structured-types.pointed-types.html#488" class="Function">type-Pointed-Type</a> <a id="533" class="Symbol">=</a> <a id="535" href="foundation.dependent-pair-types.html#603" class="Field">pr1</a> <a id="539" href="structured-types.pointed-types.html#457" class="Bound">A</a>

  <a id="544" href="structured-types.pointed-types.html#544" class="Function">point-Pointed-Type</a> <a id="563" class="Symbol">:</a> <a id="565" href="structured-types.pointed-types.html#488" class="Function">type-Pointed-Type</a>
  <a id="585" href="structured-types.pointed-types.html#544" class="Function">point-Pointed-Type</a> <a id="604" class="Symbol">=</a> <a id="606" href="foundation.dependent-pair-types.html#615" class="Field">pr2</a> <a id="610" href="structured-types.pointed-types.html#457" class="Bound">A</a>
</pre>
### Evaluation at the base point

<pre class="Agda"><a id="ev-point-Pointed-Type"></a><a id="659" href="structured-types.pointed-types.html#659" class="Function">ev-point-Pointed-Type</a> <a id="681" class="Symbol">:</a>
  <a id="685" class="Symbol">{</a><a id="686" href="structured-types.pointed-types.html#686" class="Bound">l1</a> <a id="689" href="structured-types.pointed-types.html#689" class="Bound">l2</a> <a id="692" class="Symbol">:</a> <a id="694" href="Agda.Primitive.html#591" class="Postulate">Level</a><a id="699" class="Symbol">}</a> <a id="701" class="Symbol">(</a><a id="702" href="structured-types.pointed-types.html#702" class="Bound">A</a> <a id="704" class="Symbol">:</a> <a id="706" href="structured-types.pointed-types.html#355" class="Function">Pointed-Type</a> <a id="719" href="structured-types.pointed-types.html#686" class="Bound">l1</a><a id="721" class="Symbol">)</a> <a id="723" class="Symbol">{</a><a id="724" href="structured-types.pointed-types.html#724" class="Bound">B</a> <a id="726" class="Symbol">:</a> <a id="728" href="Agda.Primitive.html#320" class="Primitive">UU</a> <a id="731" href="structured-types.pointed-types.html#689" class="Bound">l2</a><a id="733" class="Symbol">}</a> <a id="735" class="Symbol">→</a>
  <a id="739" class="Symbol">(</a><a id="740" href="structured-types.pointed-types.html#488" class="Function">type-Pointed-Type</a> <a id="758" href="structured-types.pointed-types.html#702" class="Bound">A</a> <a id="760" class="Symbol">→</a> <a id="762" href="structured-types.pointed-types.html#724" class="Bound">B</a><a id="763" class="Symbol">)</a> <a id="765" class="Symbol">→</a> <a id="767" href="structured-types.pointed-types.html#724" class="Bound">B</a>
<a id="769" href="structured-types.pointed-types.html#659" class="Function">ev-point-Pointed-Type</a> <a id="791" href="structured-types.pointed-types.html#791" class="Bound">A</a> <a id="793" href="structured-types.pointed-types.html#793" class="Bound">f</a> <a id="795" class="Symbol">=</a> <a id="797" href="structured-types.pointed-types.html#793" class="Bound">f</a> <a id="799" class="Symbol">(</a><a id="800" href="structured-types.pointed-types.html#544" class="Function">point-Pointed-Type</a> <a id="819" href="structured-types.pointed-types.html#791" class="Bound">A</a><a id="820" class="Symbol">)</a>
</pre>
## See also

- The notion of _nonempty types_ is treated in
  [`foundation.empty-types`](foundation.empty-types.md).

- The notion of _inhabited types_ is treated in
  [`foundation.inhabited-types`](foundation.inhabited-types.md).
