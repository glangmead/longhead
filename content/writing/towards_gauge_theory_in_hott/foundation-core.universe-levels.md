---
title: Universe levels
---

<pre class="Agda"><a id="41" class="Symbol">{-#</a> <a id="45" class="Keyword">OPTIONS</a> <a id="53" class="Pragma">--without-K</a> <a id="65" class="Pragma">--exact-split</a> <a id="79" class="Pragma">--safe</a> <a id="86" class="Pragma">--no-import-sorts</a> <a id="104" class="Symbol">#-}</a>

<a id="109" class="Keyword">module</a> <a id="116" href="foundation-core.universe-levels.html" class="Module">foundation-core.universe-levels</a> <a id="148" class="Keyword">where</a>

<a id="155" class="Keyword">open</a> <a id="160" class="Keyword">import</a> <a id="167" href="Agda.Primitive.html" class="Module">Agda.Primitive</a>
  <a id="184" class="Keyword">using</a> <a id="190" class="Symbol">(</a><a id="191" href="Agda.Primitive.html#591" class="Postulate">Level</a><a id="196" class="Symbol">;</a> <a id="198" href="Agda.Primitive.html#758" class="Primitive">lzero</a><a id="203" class="Symbol">;</a> <a id="205" href="Agda.Primitive.html#774" class="Primitive">lsuc</a><a id="209" class="Symbol">;</a> <a id="211" href="Agda.Primitive.html#804" class="Primitive Operator">_⊔_</a><a id="214" class="Symbol">)</a>
  <a id="218" class="Keyword">renaming</a> <a id="227" class="Symbol">(</a><a id="228" href="Agda.Primitive.html#320" class="Primitive">Set</a> <a id="232" class="Symbol">to</a> <a id="235" class="Primitive">UU</a><a id="237" class="Symbol">;</a> <a id="239" href="Agda.Primitive.html#375" class="Primitive">Setω</a> <a id="244" class="Symbol">to</a> <a id="247" class="Primitive">UUω</a><a id="250" class="Symbol">)</a>
  <a id="254" class="Keyword">public</a>
</pre>
## Idea

We import Agda's built in mechanism of universe levels. The universes are called `UU`, which stands for `univalent universe`, although we will not immediately assume that universes are univalent.
