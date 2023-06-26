# Constant maps

<pre class="Agda"><a id="26" class="Keyword">module</a> <a id="33" href="foundation-core.constant-maps.html" class="Module">foundation-core.constant-maps</a> <a id="63" class="Keyword">where</a>
</pre>
<details><summary>Imports</summary>

<pre class="Agda"><a id="119" class="Keyword">open</a> <a id="124" class="Keyword">import</a> <a id="131" href="foundation.universe-levels.html" class="Module">foundation.universe-levels</a>
</pre>
</details>

## Definition

<pre class="Agda"><a id="const"></a><a id="198" href="foundation-core.constant-maps.html#198" class="Function">const</a> <a id="204" class="Symbol">:</a> <a id="206" class="Symbol">{</a><a id="207" href="foundation-core.constant-maps.html#207" class="Bound">l1</a> <a id="210" href="foundation-core.constant-maps.html#210" class="Bound">l2</a> <a id="213" class="Symbol">:</a> <a id="215" href="Agda.Primitive.html#591" class="Postulate">Level</a><a id="220" class="Symbol">}</a> <a id="222" class="Symbol">(</a><a id="223" href="foundation-core.constant-maps.html#223" class="Bound">A</a> <a id="225" class="Symbol">:</a> <a id="227" href="Agda.Primitive.html#320" class="Primitive">UU</a> <a id="230" href="foundation-core.constant-maps.html#207" class="Bound">l1</a><a id="232" class="Symbol">)</a> <a id="234" class="Symbol">(</a><a id="235" href="foundation-core.constant-maps.html#235" class="Bound">B</a> <a id="237" class="Symbol">:</a> <a id="239" href="Agda.Primitive.html#320" class="Primitive">UU</a> <a id="242" href="foundation-core.constant-maps.html#210" class="Bound">l2</a><a id="244" class="Symbol">)</a> <a id="246" class="Symbol">→</a> <a id="248" href="foundation-core.constant-maps.html#235" class="Bound">B</a> <a id="250" class="Symbol">→</a> <a id="252" href="foundation-core.constant-maps.html#223" class="Bound">A</a> <a id="254" class="Symbol">→</a> <a id="256" href="foundation-core.constant-maps.html#235" class="Bound">B</a>
<a id="258" href="foundation-core.constant-maps.html#198" class="Function">const</a> <a id="264" href="foundation-core.constant-maps.html#264" class="Bound">A</a> <a id="266" href="foundation-core.constant-maps.html#266" class="Bound">B</a> <a id="268" href="foundation-core.constant-maps.html#268" class="Bound">b</a> <a id="270" href="foundation-core.constant-maps.html#270" class="Bound">x</a> <a id="272" class="Symbol">=</a> <a id="274" href="foundation-core.constant-maps.html#268" class="Bound">b</a>
</pre>