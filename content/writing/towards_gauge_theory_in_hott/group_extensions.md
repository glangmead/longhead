---
header-includes: |
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Libre+Baskerville&family=Quattrocento:wght@700">
  <style>
  body {
    font-family: Baskerville, 'Libre Baskerville', serif;
  }
  h1, h2, h3, h4, h5, h6 {
    font-family: Quattrocento, sans-serif;
    font-weight: bold;
    text-align: center;
  }
  </style>
title:
summary: In-progress masters thesis relating connections and curvature to group extensions, building on the Symmetry book of Bezem et. al.
date: 2023-06-26
bibliography: connections.bib
---

<!-- https://pandoc.org/MANUAL.html -->
\newcommand{\defeq}{\stackrel{\textup{def}}{=}}
\newcommand{\U}{\mathcal{U}}
\newcommand{\Copy}{\mathrm{Copy}}
\newcommand{\Tor}{\mathsf{Tor}}
\newcommand{\id}{\mathrm{id}}
\newcommand{\Pr}{\mathrm{Pr}}
\newcommand{\gset}{G\text{-}\Set}
\newcommand{\torg}{\Tor_G}
\newcommand{\ad}{\mathrm{ad}}
\newcommand{\pt}{\mathrm{pt}}
\newcommand{\dotto}{\,\cdot\!\to}
\newcommand{\dottol}[1]{\stackrel{#1}{\dotto}}
\newcommand{\icol}[2]{{{#1} \choose {#2}}}
\newcommand{\twist}[2]{{#1}^{\circlearrowleft {#2}}}
\newcommand{\apd}{\mathrm{apd}}
\newcommand{\ap}{\mathrm{ap}}
\newcommand{\tr}{\mathrm{tr}}
\newcommand{\Type}{\mathsf{Type}}
\newcommand{\Inn}{\mathrm{Inn}}
\newcommand{\refl}{\mathrm{refl}}
\newcommand{\Aut}{\mathrm{Aut}}
\newcommand{\im}{\mathrm{im}}
\newcommand{\shape}{\text{∫}}
\newcommand{\flatdr}{\flat_\mathrm{dR}}
\newcommand{\fbar}{\overline{f}}
\newcommand{\ff}{\mathbb{F}}
\newcommand{\Id}{\mathrm{Id}}
\newcommand{\rr}{\mathbb{R}}
\newcommand{\rrn}{\mathbb{R}^n}
\newcommand{\rrm}{\mathbb{R}^m}
\newcommand{\rrx}{\mathbb{R}[x]/x^2}
\newcommand{\rry}{\mathbb{R}[y]/y^2}
\newcommand{\cc}{\mathbb{C}}
\newcommand{\nn}{\mathbb{N}}
\newcommand{\zz}{\mathbb{Z}}
\newcommand{\kk}{\mathbb{K}}
\newcommand{\ss}{\mathbb{S}}
\newcommand{\dd}{\mathbb{D}}
\newcommand{\vv}{\mathbb{V}}
\newcommand{\Hom}{\mathrm{Hom}}
\newcommand{\Set}{\mathsf{Set}}
\newcommand{\BAut}{\mathsf{BAut}}
\newcommand{\Binn}{\mathsf{Binn}}
\newcommand{\CartSp}{\mathsf{CartSp}}
\newcommand{\fib}{\mathrm{fib}}
\newcommand{\infg}{\infty\text{-groupoid}}
\newcommand{\hquot}{/\!\!/}
\newcommand{\C}{\mathscr{C}}
\newcommand{\E}{\mathscr{E}}
\newcommand{\G}{\mathscr{G}}
\newcommand{\uni}{\mathcal{U}}
\newcommand{\gauge}{\mathcal{G}}
\newcommand{\Ad}{\mathrm{Ad}}

<center>
![](geb-logo.png "Image of the book cover of Godel Escher Bach"){ width=500 }
</center>

## Abstract

Homotopy type theory offers simplified access to several constructions that were harder to understand in classical mathematics. We want to leverage those and extend them into the fields of differential geometry and gauge theory.
Building on homotopy type theory and the _Symmetry_ book, we will define the type of extensions of a type by a group. 
Then we will look inside an extension to find types that correspond to principal bundles with connection and curvature.

## Agda

This document is a literate Agda file which contains a formalization of all the concepts and results. It is written with the intent that you can skip all the Agda if you like. But as an author, requiring a parallel formalization has been an invaluable tool to solidify my own understanding and increase my confidence and self-sufficiency.

I am grateful for the `agda-unimath` library [@agda-unimath] which this library is built on top of.

## Extensions: vertical and horizontal

As Jon Sterling has recently emphasized [@sterling2023geometry], homotopy type theory allows us to seamlessly move between objects _over_ a type $B$ and maps from $B$ into a universal (classifying) type, and that this facility simplifies our access to Grothendieck's _relative point of view_. If we have a morphism $E \to B$ then we can view it as a type family of fibers. And if we have a morphism $f:B\to \mathcal{U}$ into a type of types, we can form the type $E\defeq \sum_{x:B}f(x)$ and the projection map $E\to B$.

Fix a connected 1-type $BG$ with chosen point $*:BG$ (i.e. a group $G$) and a connected 2-type $B$ with a chosen point $x:B$.

Following Myers, we define the type of extensions of $B$ by $G$ to consist of

* a type $E$ with point $e:E$
* a map $p:E\to B$ and a proof of pointedness, i.e. a term $p(e)=_B x$
* a term $F:\prod_{y:B}||\fib_p(y)=BG||_{-1}$ that all the fibers of $p$ are merely equivalent to $BG$.

We can then form the _fiber sequence_ $$BG\dottol{i} E\dottol{p} B$$ where $i$ is a specified equivalence of $BG$ with the fiber over $x$.



## Groups

<!-- https://q.uiver.app/?q=WzAsNCxbMiwwLCIoYjpCKVxcdGltZXMgUChiKVxccXVhZFxccXVhZCJdLFsyLDEsIkIiXSxbMCwwLCIoYTpBKVxcdGltZXMgUChmKGEpKSJdLFswLDEsIkEiXSxbMCwxLCJcXG1hdGhybXtwcn1fMSJdLFsyLDAsIlxcbGFtYmRhKGEsIHApLihmKGEpLHApIl0sWzMsMSwiZiIsMl0sWzIsMywiXFxtYXRocm17cHJ9XzEiLDJdXQ== -->
\begin{tikzcd}
	{(a:A)\times P(f(a))} && {(b:B)\times P(b)} \\
	A && B
	\arrow["{\mathrm{pr}_1}", from=1-3, to=2-3]
	\arrow["{\lambda(a, p).(f(a),p)}", from=1-1, to=1-3]
	\arrow["f"', from=2-1, to=2-3]
	\arrow["{\mathrm{pr}_1}"', from=1-1, to=2-1]
\end{tikzcd}



<pre class="Agda"><a id="5048" class="Symbol">{-#</a> <a id="5052" class="Keyword">OPTIONS</a> <a id="5060" class="Pragma">--without-K</a> <a id="5072" class="Pragma">--exact-split</a> <a id="5086" class="Symbol">#-}</a>

<a id="5091" class="Keyword">module</a> <a id="5098" href="group_extensions.html" class="Module Operator">group_extensions</a> <a id="5115" class="Keyword">where</a>

<a id="5122" class="Keyword">open</a> <a id="5127" class="Keyword">import</a> <a id="5134" href="foundation.dependent-identifications.html" class="Module">foundation.dependent-identifications</a> <a id="5171" class="Keyword">public</a>
<a id="5178" class="Keyword">open</a> <a id="5183" class="Keyword">import</a> <a id="5190" href="foundation.action-on-identifications-functions.html" class="Module">foundation.action-on-identifications-functions</a>
<a id="5237" class="Keyword">open</a> <a id="5242" class="Keyword">import</a> <a id="5249" href="foundation.dependent-pair-types.html" class="Module">foundation.dependent-pair-types</a>
<a id="5281" class="Keyword">open</a> <a id="5286" class="Keyword">import</a> <a id="5293" href="foundation.transport-along-higher-identifications.html" class="Module">foundation.transport-along-higher-identifications</a>
<a id="5343" class="Keyword">open</a> <a id="5348" class="Keyword">import</a> <a id="5355" href="foundation.transport-along-identifications.html" class="Module">foundation.transport-along-identifications</a>
<a id="5398" class="Keyword">open</a> <a id="5403" class="Keyword">import</a> <a id="5410" href="foundation.universe-levels.html" class="Module">foundation.universe-levels</a>

<a id="5438" class="Keyword">open</a> <a id="5443" class="Keyword">import</a> <a id="5450" href="foundation-core.equivalences.html" class="Module">foundation-core.equivalences</a>
<a id="5479" class="Keyword">open</a> <a id="5484" class="Keyword">import</a> <a id="5491" href="foundation-core.function-types.html" class="Module">foundation-core.function-types</a>
<a id="5522" class="Keyword">open</a> <a id="5527" class="Keyword">import</a> <a id="5534" href="foundation-core.homotopies.html" class="Module">foundation-core.homotopies</a>
<a id="5561" class="Keyword">open</a> <a id="5566" class="Keyword">import</a> <a id="5573" href="foundation-core.identity-types.html" class="Module">foundation-core.identity-types</a>

<a id="5605" class="Keyword">module</a> <a id="5612" href="group_extensions.html#5612" class="Module">_</a>
  <a id="5616" class="Symbol">{</a><a id="5617" href="group_extensions.html#5617" class="Bound">l1</a> <a id="5620" href="group_extensions.html#5620" class="Bound">l2</a> <a id="5623" class="Symbol">:</a> <a id="5625" href="Agda.Primitive.html#591" class="Postulate">Level</a><a id="5630" class="Symbol">}</a> <a id="5632" class="Symbol">{</a><a id="5633" href="group_extensions.html#5633" class="Bound">A</a> <a id="5635" class="Symbol">:</a> <a id="5637" href="Agda.Primitive.html#320" class="Primitive">UU</a> <a id="5640" href="group_extensions.html#5617" class="Bound">l1</a><a id="5642" class="Symbol">}</a> <a id="5644" class="Symbol">(</a><a id="5645" href="group_extensions.html#5645" class="Bound">B</a> <a id="5647" class="Symbol">:</a> <a id="5649" href="group_extensions.html#5633" class="Bound">A</a> <a id="5651" class="Symbol">→</a> <a id="5653" href="Agda.Primitive.html#320" class="Primitive">UU</a> <a id="5656" href="group_extensions.html#5620" class="Bound">l2</a><a id="5658" class="Symbol">)</a>
  <a id="5662" class="Keyword">where</a>

  <a id="5671" href="group_extensions.html#5671" class="Function">compute-concat-dependent-identification-refl-greg</a> <a id="5721" class="Symbol">:</a>
    <a id="5727" class="Symbol">{</a> <a id="5729" href="group_extensions.html#5729" class="Bound">y</a> <a id="5731" href="group_extensions.html#5731" class="Bound">z</a> <a id="5733" class="Symbol">:</a> <a id="5735" href="group_extensions.html#5633" class="Bound">A</a> <a id="5737" class="Symbol">}</a> <a id="5739" class="Symbol">(</a><a id="5740" href="group_extensions.html#5740" class="Bound">q</a> <a id="5742" class="Symbol">:</a> <a id="5744" href="group_extensions.html#5729" class="Bound">y</a> <a id="5746" href="foundation-core.identity-types.html#5999" class="Function Operator">＝</a> <a id="5748" href="group_extensions.html#5731" class="Bound">z</a><a id="5749" class="Symbol">)</a> <a id="5751" class="Symbol">→</a> 
    <a id="5758" class="Symbol">{</a> <a id="5760" href="group_extensions.html#5760" class="Bound">x&#39;</a> <a id="5763" href="group_extensions.html#5763" class="Bound">y&#39;</a> <a id="5766" class="Symbol">:</a> <a id="5768" href="group_extensions.html#5645" class="Bound">B</a> <a id="5770" href="group_extensions.html#5729" class="Bound">y</a><a id="5771" class="Symbol">}</a> <a id="5773" class="Symbol">{</a><a id="5774" href="group_extensions.html#5774" class="Bound">z&#39;</a> <a id="5777" class="Symbol">:</a> <a id="5779" href="group_extensions.html#5645" class="Bound">B</a> <a id="5781" href="group_extensions.html#5731" class="Bound">z</a><a id="5782" class="Symbol">}</a> <a id="5784" class="Symbol">(</a><a id="5785" href="group_extensions.html#5785" class="Bound">p&#39;</a> <a id="5788" class="Symbol">:</a> <a id="5790" href="group_extensions.html#5760" class="Bound">x&#39;</a> <a id="5793" href="foundation-core.identity-types.html#5999" class="Function Operator">＝</a> <a id="5795" href="group_extensions.html#5763" class="Bound">y&#39;</a><a id="5797" class="Symbol">)</a> <a id="5799" class="Symbol">→</a> 
    <a id="5806" class="Symbol">(</a> <a id="5808" href="group_extensions.html#5808" class="Bound">q&#39;</a> <a id="5811" class="Symbol">:</a> <a id="5813" href="foundation-core.dependent-identifications.html#964" class="Function">dependent-identification</a> <a id="5838" href="group_extensions.html#5645" class="Bound">B</a> <a id="5840" href="group_extensions.html#5740" class="Bound">q</a> <a id="5842" href="group_extensions.html#5763" class="Bound">y&#39;</a> <a id="5845" href="group_extensions.html#5774" class="Bound">z&#39;</a><a id="5847" class="Symbol">)</a> <a id="5849" class="Symbol">→</a> 
    <a id="5856" class="Symbol">(</a> <a id="5858" href="foundation.dependent-identifications.html#3934" class="Function">concat-dependent-identification</a> <a id="5890" class="Symbol">{</a><a id="5891" href="group_extensions.html#5617" class="Bound">l1</a><a id="5893" class="Symbol">}</a> <a id="5895" class="Symbol">{</a><a id="5896" href="group_extensions.html#5620" class="Bound">l2</a><a id="5898" class="Symbol">}</a> <a id="5900" class="Symbol">{</a><a id="5901" href="group_extensions.html#5633" class="Bound">A</a><a id="5902" class="Symbol">}</a> <a id="5904" href="group_extensions.html#5645" class="Bound">B</a> <a id="5906" class="Symbol">{</a><a id="5907" href="group_extensions.html#5729" class="Bound">y</a><a id="5908" class="Symbol">}</a> <a id="5910" class="Symbol">{</a><a id="5911" href="group_extensions.html#5729" class="Bound">y</a><a id="5912" class="Symbol">}</a> <a id="5914" class="Symbol">{</a><a id="5915" href="group_extensions.html#5731" class="Bound">z</a><a id="5916" class="Symbol">}</a> <a id="5918" href="foundation-core.identity-types.html#5968" class="InductiveConstructor">refl</a> <a id="5923" href="group_extensions.html#5740" class="Bound">q</a> <a id="5925" class="Symbol">{</a><a id="5926" href="group_extensions.html#5760" class="Bound">x&#39;</a><a id="5928" class="Symbol">}</a> <a id="5930" class="Symbol">{</a><a id="5931" href="group_extensions.html#5763" class="Bound">y&#39;</a><a id="5933" class="Symbol">}</a> <a id="5935" class="Symbol">{</a><a id="5936" href="group_extensions.html#5774" class="Bound">z&#39;</a><a id="5938" class="Symbol">}</a> <a id="5940" href="group_extensions.html#5785" class="Bound">p&#39;</a> <a id="5943" href="group_extensions.html#5808" class="Bound">q&#39;</a><a id="5945" class="Symbol">)</a> <a id="5947" href="foundation-core.identity-types.html#5999" class="Function Operator">＝</a> <a id="5949" href="foundation.action-on-identifications-functions.html#790" class="Function">ap</a> <a id="5952" class="Symbol">(</a><a id="5953" href="foundation-core.transport-along-identifications.html#729" class="Function">tr</a> <a id="5956" href="group_extensions.html#5645" class="Bound">B</a> <a id="5958" href="group_extensions.html#5740" class="Bound">q</a><a id="5959" class="Symbol">)</a> <a id="5961" href="group_extensions.html#5785" class="Bound">p&#39;</a> <a id="5964" href="foundation-core.identity-types.html#6948" class="Function Operator">∙</a> <a id="5966" href="group_extensions.html#5808" class="Bound">q&#39;</a>
  <a id="5971" href="group_extensions.html#5671" class="Function">compute-concat-dependent-identification-refl-greg</a> <a id="6021" href="foundation-core.identity-types.html#5968" class="InductiveConstructor">refl</a> <a id="6026" href="foundation-core.identity-types.html#5968" class="InductiveConstructor">refl</a> <a id="6031" href="group_extensions.html#6031" class="Bound">q&#39;</a> <a id="6034" class="Symbol">=</a> <a id="6036" href="foundation-core.identity-types.html#5968" class="InductiveConstructor">refl</a>

</pre>
