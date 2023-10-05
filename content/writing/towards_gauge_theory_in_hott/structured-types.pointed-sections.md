# Pointed sections of pointed maps

<pre class="Agda"><a id="45" class="Keyword">module</a> <a id="52" href="structured-types.pointed-sections.html" class="Module">structured-types.pointed-sections</a> <a id="86" class="Keyword">where</a>
</pre>
<details><summary>Imports</summary>

<pre class="Agda"><a id="142" class="Keyword">open</a> <a id="147" class="Keyword">import</a> <a id="154" href="foundation.dependent-pair-types.html" class="Module">foundation.dependent-pair-types</a>
<a id="186" class="Keyword">open</a> <a id="191" class="Keyword">import</a> <a id="198" href="foundation.universe-levels.html" class="Module">foundation.universe-levels</a>

<a id="226" class="Keyword">open</a> <a id="231" class="Keyword">import</a> <a id="238" href="structured-types.pointed-homotopies.html" class="Module">structured-types.pointed-homotopies</a>
<a id="274" class="Keyword">open</a> <a id="279" class="Keyword">import</a> <a id="286" href="structured-types.pointed-maps.html" class="Module">structured-types.pointed-maps</a>
<a id="316" class="Keyword">open</a> <a id="321" class="Keyword">import</a> <a id="328" href="structured-types.pointed-types.html" class="Module">structured-types.pointed-types</a>
</pre>
</details>

## Idea

A **pointed section** of a pointed map `f : A →∗ B` consists of a pointed map
`g : B →∗ A` equipped with a pointed homotopy `H : (f ∘∗ g) ~∗ id`.

<pre class="Agda"><a id="pointed-section-Pointed-Type"></a><a id="540" href="structured-types.pointed-sections.html#540" class="Function">pointed-section-Pointed-Type</a> <a id="569" class="Symbol">:</a>
  <a id="573" class="Symbol">{</a><a id="574" href="structured-types.pointed-sections.html#574" class="Bound">l1</a> <a id="577" href="structured-types.pointed-sections.html#577" class="Bound">l2</a> <a id="580" class="Symbol">:</a> <a id="582" href="Agda.Primitive.html#591" class="Postulate">Level</a><a id="587" class="Symbol">}</a> <a id="589" class="Symbol">(</a><a id="590" href="structured-types.pointed-sections.html#590" class="Bound">A</a> <a id="592" class="Symbol">:</a> <a id="594" href="structured-types.pointed-types.html#355" class="Function">Pointed-Type</a> <a id="607" href="structured-types.pointed-sections.html#574" class="Bound">l1</a><a id="609" class="Symbol">)</a> <a id="611" class="Symbol">(</a><a id="612" href="structured-types.pointed-sections.html#612" class="Bound">B</a> <a id="614" class="Symbol">:</a> <a id="616" href="structured-types.pointed-types.html#355" class="Function">Pointed-Type</a> <a id="629" href="structured-types.pointed-sections.html#577" class="Bound">l2</a><a id="631" class="Symbol">)</a> <a id="633" class="Symbol">→</a>
  <a id="637" class="Symbol">(</a><a id="638" href="structured-types.pointed-sections.html#590" class="Bound">A</a> <a id="640" href="structured-types.pointed-maps.html#1014" class="Function Operator">→∗</a> <a id="643" href="structured-types.pointed-sections.html#612" class="Bound">B</a><a id="644" class="Symbol">)</a> <a id="646" class="Symbol">→</a> <a id="648" href="Agda.Primitive.html#320" class="Primitive">UU</a> <a id="651" class="Symbol">(</a><a id="652" href="structured-types.pointed-sections.html#574" class="Bound">l1</a> <a id="655" href="Agda.Primitive.html#804" class="Primitive Operator">⊔</a> <a id="657" href="structured-types.pointed-sections.html#577" class="Bound">l2</a><a id="659" class="Symbol">)</a>
<a id="661" href="structured-types.pointed-sections.html#540" class="Function">pointed-section-Pointed-Type</a> <a id="690" href="structured-types.pointed-sections.html#690" class="Bound">A</a> <a id="692" href="structured-types.pointed-sections.html#692" class="Bound">B</a> <a id="694" href="structured-types.pointed-sections.html#694" class="Bound">f</a> <a id="696" class="Symbol">=</a>
  <a id="700" href="foundation.dependent-pair-types.html#505" class="Record">Σ</a> <a id="702" class="Symbol">(</a> <a id="704" href="structured-types.pointed-sections.html#692" class="Bound">B</a> <a id="706" href="structured-types.pointed-maps.html#1014" class="Function Operator">→∗</a> <a id="709" href="structured-types.pointed-sections.html#690" class="Bound">A</a><a id="710" class="Symbol">)</a>
    <a id="716" class="Symbol">(</a> <a id="718" class="Symbol">λ</a> <a id="720" href="structured-types.pointed-sections.html#720" class="Bound">g</a> <a id="722" class="Symbol">→</a> <a id="724" class="Symbol">(</a><a id="725" href="structured-types.pointed-sections.html#694" class="Bound">f</a> <a id="727" href="structured-types.pointed-maps.html#3900" class="Function Operator">∘∗</a> <a id="730" href="structured-types.pointed-sections.html#720" class="Bound">g</a><a id="731" class="Symbol">)</a> <a id="733" href="structured-types.pointed-homotopies.html#2334" class="Function Operator">~∗</a> <a id="736" href="structured-types.pointed-maps.html#4165" class="Function">id-pointed-map</a><a id="750" class="Symbol">)</a>
</pre>