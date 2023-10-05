# Truncation levels

<pre class="Agda"><a id="30" class="Keyword">module</a> <a id="37" href="foundation-core.truncation-levels.html" class="Module">foundation-core.truncation-levels</a> <a id="71" class="Keyword">where</a>
</pre>
<details><summary>Imports</summary>

<pre class="Agda"><a id="127" class="Keyword">open</a> <a id="132" class="Keyword">import</a> <a id="139" href="foundation.universe-levels.html" class="Module">foundation.universe-levels</a>
</pre>
</details>

## Idea

The type of truncation levels is a type similar to the type of natural numbers,
but starting the count at -2, so that sets have truncation level 0.

## Definition

<pre class="Agda"><a id="364" class="Keyword">data</a> <a id="𝕋"></a><a id="369" href="foundation-core.truncation-levels.html#369" class="Datatype">𝕋</a> <a id="371" class="Symbol">:</a> <a id="373" href="Agda.Primitive.html#320" class="Primitive">UU</a> <a id="376" href="Agda.Primitive.html#758" class="Primitive">lzero</a> <a id="382" class="Keyword">where</a>
  <a id="𝕋.neg-two-𝕋"></a><a id="390" href="foundation-core.truncation-levels.html#390" class="InductiveConstructor">neg-two-𝕋</a> <a id="400" class="Symbol">:</a> <a id="402" href="foundation-core.truncation-levels.html#369" class="Datatype">𝕋</a>
  <a id="𝕋.succ-𝕋"></a><a id="406" href="foundation-core.truncation-levels.html#406" class="InductiveConstructor">succ-𝕋</a> <a id="413" class="Symbol">:</a> <a id="415" href="foundation-core.truncation-levels.html#369" class="Datatype">𝕋</a> <a id="417" class="Symbol">→</a> <a id="419" href="foundation-core.truncation-levels.html#369" class="Datatype">𝕋</a>

<a id="neg-one-𝕋"></a><a id="422" href="foundation-core.truncation-levels.html#422" class="Function">neg-one-𝕋</a> <a id="432" class="Symbol">:</a> <a id="434" href="foundation-core.truncation-levels.html#369" class="Datatype">𝕋</a>
<a id="436" href="foundation-core.truncation-levels.html#422" class="Function">neg-one-𝕋</a> <a id="446" class="Symbol">=</a> <a id="448" href="foundation-core.truncation-levels.html#406" class="InductiveConstructor">succ-𝕋</a> <a id="455" href="foundation-core.truncation-levels.html#390" class="InductiveConstructor">neg-two-𝕋</a>

<a id="zero-𝕋"></a><a id="466" href="foundation-core.truncation-levels.html#466" class="Function">zero-𝕋</a> <a id="473" class="Symbol">:</a> <a id="475" href="foundation-core.truncation-levels.html#369" class="Datatype">𝕋</a>
<a id="477" href="foundation-core.truncation-levels.html#466" class="Function">zero-𝕋</a> <a id="484" class="Symbol">=</a> <a id="486" href="foundation-core.truncation-levels.html#406" class="InductiveConstructor">succ-𝕋</a> <a id="493" href="foundation-core.truncation-levels.html#422" class="Function">neg-one-𝕋</a>

<a id="one-𝕋"></a><a id="504" href="foundation-core.truncation-levels.html#504" class="Function">one-𝕋</a> <a id="510" class="Symbol">:</a> <a id="512" href="foundation-core.truncation-levels.html#369" class="Datatype">𝕋</a>
<a id="514" href="foundation-core.truncation-levels.html#504" class="Function">one-𝕋</a> <a id="520" class="Symbol">=</a> <a id="522" href="foundation-core.truncation-levels.html#406" class="InductiveConstructor">succ-𝕋</a> <a id="529" href="foundation-core.truncation-levels.html#466" class="Function">zero-𝕋</a>

<a id="two-𝕋"></a><a id="537" href="foundation-core.truncation-levels.html#537" class="Function">two-𝕋</a> <a id="543" class="Symbol">:</a> <a id="545" href="foundation-core.truncation-levels.html#369" class="Datatype">𝕋</a>
<a id="547" href="foundation-core.truncation-levels.html#537" class="Function">two-𝕋</a> <a id="553" class="Symbol">=</a> <a id="555" href="foundation-core.truncation-levels.html#406" class="InductiveConstructor">succ-𝕋</a> <a id="562" href="foundation-core.truncation-levels.html#504" class="Function">one-𝕋</a>
</pre>