---
header-includes: |
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Libre+Baskerville&family=Belanosima">
  <style>
  body {
    font-family: 'Libre Baskerville', serif;
  }
  h2 {
    font-family: Belanosima, sans-serif;
  }
  </style>
---

\newcommand{\ff}{\mathbb{F}}
\newcommand{\rr}{\mathbb{R}}
\newcommand{\BAut}{\mathsf{BAut}}
\newcommand{\C}{\mathscr{C}}
\newcommand{\E}{\mathscr{E}}
\newcommand{\G}{\mathscr{G}}

## Abstract

We will show how to formalize parts of differential geometry, gauge theory, and Chern-Weil theory in homotopy type theory.

Test diagram
\begin{tikzcd}
	{(x:X)\times (f(x)=f(x))} && {(b:BG)\times (b=b)} \\
	X && BG
	\arrow["{\mathrm{pr}_1}", from=1-3, to=2-3]
	\arrow["{\lambda(x, p).(f(x),p)}", from=1-1, to=1-3]
	\arrow["f"', from=2-1, to=2-3]
	\arrow["{\mathrm{pr}_1}"', from=1-1, to=2-1]
\end{tikzcd}



<pre class="Agda"><a id="879" class="Symbol">{-#</a> <a id="883" class="Keyword">OPTIONS</a> <a id="891" class="Pragma">--without-K</a> <a id="903" class="Pragma">--exact-split</a> <a id="917" class="Symbol">#-}</a>

<a id="922" class="Keyword">module</a> <a id="929" href="group_extensions.html" class="Module Operator">group_extensions</a> <a id="946" class="Keyword">where</a>

<a id="953" class="Keyword">open</a> <a id="958" class="Keyword">import</a> <a id="965" href="foundation-core.universe-levels.html" class="Module">foundation-core.universe-levels</a>
<a id="997" class="Keyword">open</a> <a id="1002" class="Keyword">import</a> <a id="1009" href="foundation-core.functions.html" class="Module">foundation-core.functions</a>
<a id="1035" class="Keyword">open</a> <a id="1040" class="Keyword">import</a> <a id="1047" href="foundation-core.identity-types.html" class="Module">foundation-core.identity-types</a>

<a id="1079" class="Comment">-- What is the analogue in HoTT of the fact from group extensions that we classify an extension by </a>
<a id="1179" class="Comment">-- taking a set-based section of the splitting, seeing that those elements act on the left hand group,</a>
<a id="1282" class="Comment">-- noting that this map into Aut G is not a homomorphism. There is a 2-cell that we can conjugate with that makes</a>
<a id="1396" class="Comment">-- it a homomorphism. So together, the extension (plus the arbitrary choice of splitting) yeilds a 2-map to the 2-group</a>
<a id="1516" class="Comment">-- AUT(G).</a>
<a id="1527" class="Comment">-- For us, a splitting will be a section of a type family. This acts on loops with apd.</a>
<a id="1615" class="Comment">-- So we want to prove some facts about apd and to what extent it&#39;s a homomorphism of loops.</a>
<a id="1708" class="Comment">-- It doesn&#39;t send loops to loops, because it sends the loop p to a loop from fx to ap p fx.</a>
<a id="1801" class="Comment">-- apd-hom :</a>
<a id="1814" class="Comment">--   {l1 l2 : Level} {A : UU l1} {B : A → UU l2} (f : (a : A) → B a) {x : A}</a>
<a id="1891" class="Comment">--   (p q : x ＝ x) → (apd f (p ∙ q)) ＝ ((apd ((tr B p) ∘ f) q) ∙ (apd (f) p))</a>
<a id="1969" class="Comment">-- apd-hom f refl q = ?</a>

</pre>