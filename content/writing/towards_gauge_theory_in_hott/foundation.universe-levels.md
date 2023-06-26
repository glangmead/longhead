# Universe levels

<pre class="Agda"><a id="28" class="Symbol">{-#</a> <a id="32" class="Keyword">OPTIONS</a> <a id="40" class="Pragma">--no-import-sorts</a> <a id="58" class="Symbol">#-}</a>

<a id="63" class="Keyword">module</a> <a id="70" href="foundation.universe-levels.html" class="Module">foundation.universe-levels</a> <a id="97" class="Keyword">where</a>

<a id="104" class="Keyword">open</a> <a id="109" class="Keyword">import</a> <a id="116" href="Agda.Primitive.html" class="Module">Agda.Primitive</a>
  <a id="133" class="Keyword">using</a> <a id="139" class="Symbol">(</a><a id="140" href="Agda.Primitive.html#591" class="Postulate">Level</a> <a id="146" class="Symbol">;</a> <a id="148" href="Agda.Primitive.html#758" class="Primitive">lzero</a> <a id="154" class="Symbol">;</a> <a id="156" href="Agda.Primitive.html#774" class="Primitive">lsuc</a> <a id="161" class="Symbol">;</a> <a id="163" href="Agda.Primitive.html#804" class="Primitive Operator">_⊔_</a><a id="166" class="Symbol">)</a>
  <a id="170" class="Keyword">renaming</a> <a id="179" class="Symbol">(</a><a id="180" href="Agda.Primitive.html#320" class="Primitive">Set</a> <a id="184" class="Symbol">to</a> <a id="187" class="Primitive">UU</a> <a id="190" class="Symbol">;</a> <a id="192" href="Agda.Primitive.html#375" class="Primitive">Setω</a> <a id="197" class="Symbol">to</a> <a id="200" class="Primitive">UUω</a><a id="203" class="Symbol">)</a>
  <a id="207" class="Keyword">public</a>
</pre>
## Idea

We import Agda's built in mechanism of universe levels. The universes are called
`UU`, which stands for _univalent universe_, although we will not immediately
assume that universes are univalent.
