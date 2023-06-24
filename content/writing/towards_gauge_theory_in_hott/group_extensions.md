---
header-includes: |
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Libre+Baskerville&family=Belanosima">
  <style>
  body {
    font-family: 'Libre Baskerville', serif;
  }
  h1, h2, h3, h4, h5, h6 {
    font-family: Belanosima, sans-serif;
  }
  </style>
bibliography: connections.bib
---

[//]: # "https://pandoc.org/MANUAL.html"

\newcommand{\ff}{\mathbb{F}}
\newcommand{\rr}{\mathbb{R}}
\newcommand{\zz}{\mathbb{Z}}
\newcommand{\BAut}{\mathsf{BAut}}
\newcommand{\Aut}{\mathsf{Aut}}
\newcommand{\C}{\mathscr{C}}
\newcommand{\E}{\mathscr{E}}
\newcommand{\G}{\mathscr{G}}
\newcommand{\uni}{\mathcal{U}}
\newcommand{\gauge}{\mathcal{G}}
\newcommand{\ad}{\mathrm{ad}}
\newcommand{\Ad}{\mathrm{Ad}}

# Abstract

We will show how to formalize parts of differential geometry, gauge theory, and Chern-Weil theory in homotopy type theory.

The background on group extensions are [^baez_schreier], [^myers_schreier], [^nlab_group_ext].

[^baez_schreier]: John Baez, "Week 223": https://math.ucr.edu/home/baez/week223.html
[^myers_schreier]: David Jaz Myers, Dissertation: https://jscholarship.library.jhu.edu/handle/1774.2/67618
[^nlab_group_ext]: https://ncatlab.org/nlab/show/group+extension

One way of thinking about bringing smooth manifolds into this group theoretic picture is in a post by Schreiber [^schreiber_atiyah]

[^schreiber_atiyah]: Urs Schreiber, "n-Transport and Higher Schreier Theory": https://golem.ph.utexas.edu/category/2006/09/nconnections_and_higher_schrei.html

# Introduction

Differential geometry [@kobayashinomizu] [@baez1994gauge], gauge theory [@hamilton2017] [@atiyah1983yang], and Chern-Weil theory[@freed2013chernweil] lie at the intersection of mathematics and physics. The theory of general relativity is expressed as formulas relating the curvature of spacetime to the distribution of energy and matter. The standard model of particle physics is expressed as a collection of principal bundles and associated vector bundles, sections of which represent the fields of matter and forces. And in the latter decades of the 20th century the tools of the standard model were applied back into mathematics to make discoveries about the geometry of 3- and 4-dimensional manifolds[@scorpan_wild_2005].

Homotopy type theory[@hottbook] seems at first like it's from a different universe entirely. It grew out of questions of a foundational nature inside mathematics and computer science. It brings a synthetic stance, where we are invited to stop thinking of mathematical objects as sets with structure, and instead to assemble the objects into higher categories with collective properties like being locally cartesian closed, or having homotopical model structures. Such categories have internal languages, which are syntactic structures much like programming languages, which allow us to reason about the objects in a generic way.

# Groups

Group theory including the theory of higher groups is built directly into HoTT, via the identity types. A thorough introductory treatment of group theory that adopts this philosophy can be found in the book *Symmetry* [@Symmetry]. We will build on this synthetic framework to explore gauge theory. But it's important to be clear that this is a choice, and there is an alternate approach. Namely we could define a group to be a type together with some extra structure: an identity, a multiplication operation, and an inverse operation, satisfying some properties. We would do the same for higher groups, and we'd prove an equivalence between the type of higher groups and the type of pointed, connected types. Such a project has been undertaken in the context of higher topos theory, but at the time of this writing it hasn't been done inside HoTT. We certainly can define the type of groups which are sets, and prove that this type of 0-groups is equivalent to connected 1-types, and this is done in *Symmetry*. But in the case of higher groups we only have one definition: pointed connected types. This happens to be a lovely theory, and so we'll be glad to run with that.

**Definition**. A (higher) group is a pointed 1-type $BG$ with basepoint $*$, which is connected, i.e. that we have a term of the type $(a:BG)\to||*=a||_{-1}$. We denote the type $*=*$ by $G$, and so if we have a particular group in mind then we think of that group as being installed as the identity type of the basepoint in a type we call $BG$.

This notation is fairly confusing, since we have stated that $BG$ is a group, but that $G$ is the group we really mean. Let's see how much trouble it ends up causing.

**Lemma**
If $X$ is a pointed, connected 1-type with basepoint $*$,$x:X$ is any term, and $p:*=x$ any term, then the sets $*=*$ and $*=x$ are isomorphic. Furthermore, $*=*$ acts on $*=x$ freely and transitively, by concatenation.

**Proof**
For the first statement, define $-\cdot p:*=*\to *=x$, by concatenating with $p$. Then $-\cdot p^{-1}:*=x\to *=*$ is a two-sided inverse. For the second statement, if $g:*=*$ then $g\cdot p:*=x$, giving an action. Transitivity can be seen by solving the equation $q = g\cdot p$ for $g$ by concatenating both sides by $p^{-1}$ on the right. Freeness can be seen by observing that $g\cdot p = h\cdot p$ implies that $g=h$.

So identity types with unequal endpoints like $*=x$ are torsors, and it's noteworthy to find torsors appearing to close to the foundations of HoTT.

## Group actions

Given any pointed type $X$ with basepoint $x$ we can form the type $\BAut_x(X)$ by taking the connected component of $x$. If we consider the terms of $X$ to be at type-theoretic level 0, then $\Aut_x$ brings one of the identity types from level 1 down to level 0 to look at it on its own. Then the B can be thought of as reinstalling the identity type at level 1 of the new type, which contains only the connected component of $x$. When we do this, though, we don't forget the identity types of all the other terms in the connected component. That's why there really isn't a true B operator, just a notation that is meant to evoke the classical idea of a classifying space, since as we'll see we really have captured that idea.

A homomorphism of groups is a pointed map $f:BG\to X$. The rules of type theory will ensure that this map contains a map between the identity types inside the types, forming a group homomorphism in the usual sense. We can think of $G$ acting on $x$ since the homomorphism is $*=*\to x=x$. If we take $X=\uni$ to be the universe, and if $f(*)=H$, then we can think of $G$ acting on the type $H$.

## Equivariant maps

If $BG\xrightarrow[]{r_X} \BAut_x X$ and $BG\xrightarrow[]{r_Y} \BAut_y Y$ are two group actions

# Principal bundles

## Bundles over $BG$

Pointed connected types $BG$ come with three built-in type families by choosing identity types with different endpoints. There's $LG:=(a:BG)\times a=a$ which is at each point the group of self-identifications of that point. There's $EG:=(a:BG)\times *=a$ which aren't groups, but which are similar to the self-identifications, and in fact are torsors over $G$! At each point $a:BG$ we can concatenate a term of $EG(a)$ with a term of $LG(a)$ by concatenating the latter to the $a$ endpoint of $EG(a)$. And lastly there's the non-dependent type $BG\times G$ which I'm mentioning because we can also concatenate a term of $EG(a)$ with a term of $G$, by attaching it to the $*$ endpoint.

$EG$ is contractible (Lemma 3.11.8 of The HoTT Book\cite{hottbook}). It's worth reflecting for a moment on the fact that $EG$ is contractible but $BG$ is not. After all, $BG$ is connected and so all its terms are equal to the base point via some path. But we don't select any specific paths as part of the data. Forming $EG$ is simply to install all the solutions to this missing data as the fibers of a bundle over $BG$.

Example: for $G=\zz, \zz^n, \zz_2$ provide $BG$, $EG$, and $LG$.

## Mapping into $BG$

Pulling back $EG$ via a map $X\to BG$ deserves to be called a principal $G$-bundle over $X$, and pulling back $LG$ via the same map deserves to be called a gauge transformation.

In HoTT given a map $f:A\to B$ and a type family $P:B\to \uni$ we can form the following square and it will commute and be a pullback:

[//]: # "https://q.uiver.app/?q=WzAsNCxbMiwwLCIoYjpCKVxcdGltZXMgUChiKVxccXVhZFxccXVhZCJdLFsyLDEsIkIiXSxbMCwwLCIoYTpBKVxcdGltZXMgUChmKGEpKSJdLFswLDEsIkEiXSxbMCwxLCJcXG1hdGhybXtwcn1fMSJdLFsyLDAsIlxcbGFtYmRhKGEsIHApLihmKGEpLHApIl0sWzMsMSwiZiIsMl0sWzIsMywiXFxtYXRocm17cHJ9XzEiLDJdXQ=="
\begin{tikzcd}
	{(a:A)\times P(f(a))} && {(b:B)\times P(b)} \\
	A && B
	\arrow["{\mathrm{pr}_1}", from=1-3, to=2-3]
	\arrow["{\lambda(a, p).(f(a),p)}", from=1-1, to=1-3]
	\arrow["f"', from=2-1, to=2-3]
	\arrow["{\mathrm{pr}_1}"', from=1-1, to=2-1]
\end{tikzcd}

If we have an arbitrary type $X$ and $f:X\to BG$ then we can pull back $EG$ this way:

[//]: # "https://q.uiver.app/?q=WzAsNCxbMiwwLCIoYjpCRylcXHRpbWVzICgqPWIpIl0sWzIsMSwiQkciXSxbMCwwLCIoeDpYKVxcdGltZXMgKCo9Zih4KSkiXSxbMCwxLCJYIl0sWzAsMSwiXFxtYXRocm17cHJ9XzEiXSxbMiwwLCJcXGxhbWJkYSh4LCBwKS4oZih4KSxwKSJdLFszLDEsImYiLDJdLFsyLDMsIlxcbWF0aHJte3ByfV8xIiwyXV0="
\begin{tikzcd}
	{(x:X)\times (*=f(x))} && {(b:BG)\times (*=b)} \\
	X && BG
	\arrow["{\mathrm{pr}_1}", from=1-3, to=2-3]
	\arrow["{\lambda(x, p).(f(x),p)}", from=1-1, to=1-3]
	\arrow["f"', from=2-1, to=2-3]
	\arrow["{\mathrm{pr}_1}"', from=1-1, to=2-1]
\end{tikzcd}

or we can pull back $LG$:

[//]: # "https://q.uiver.app/?q=WzAsNCxbMiwwLCIoYjpCRylcXHRpbWVzIChiPWIpIl0sWzIsMSwiQkciXSxbMCwwLCIoeDpYKVxcdGltZXMgKGYoeCk9Zih4KSkiXSxbMCwxLCJYIl0sWzAsMSwiXFxtYXRocm17cHJ9XzEiXSxbMiwwLCJcXGxhbWJkYSh4LCBwKS4oZih4KSxwKSJdLFszLDEsImYiLDJdLFsyLDMsIlxcbWF0aHJte3ByfV8xIiwyXV0="
\begin{tikzcd}
	{(x:X)\times (f(x)=f(x))} && {(b:BG)\times (b=b)} \\
	X && BG
	\arrow["{\mathrm{pr}_1}", from=1-3, to=2-3]
	\arrow["{\lambda(x, p).(f(x),p)}", from=1-1, to=1-3]
	\arrow["f"', from=2-1, to=2-3]
	\arrow["{\mathrm{pr}_1}"', from=1-1, to=2-1]
\end{tikzcd}

Let's name these pullbacks $E_fX$ and $L_fX$ respectively. We include the classifying map $f$ in the notation but maybe we'll leave it out sometimes. Terms of $E_fX$ are a pair $(x, p)$: a term of $X$ and a term of the torsor $*=f(x)$. Terms of $L_fX$ are also a pair $(x, l)$: a term of $X$ and a term of the loop space $f(x)=f(x)$. We can form $(x, p\cdot l)$ and in fact we can act on all of $E_fX$ with a section of $L_fX$: $$\gauge X:=((x,l):L_fX)\to E_fX\to E_fX$$ which acts fiberwise by concatenating $l$ to any torsor.

The bundle $E_fX$ would classically be called something like $P$, a principal bundle with gauge group $G$ over $X$. The bundle $L_fX$ would then be referred to as $\Ad P$. Why is that? 

\includegraphics[height=3in,width=4.5in]{torsors_and_gauge}
\caption{Torsors and gauge transformations over $X$. $p$ and $q$ are terms in the fibers of the total spaces $E_fX$ and $L_fX$ respectively. Similarly for $p'$ and $q'$. We can then form $p\cdot q$ and $p'\cdot q'$. If we had a whole section of such $q$ then we could use that to act on the whole of $E_fX$.}

## $BG$ classifies bundles, not just equivalence classes

The classical theorems take the form: taking the pullback of $EG\to BG$ forms a bijection between homotopy classes of maps $f:X\to BG$ and equivalence classes of principal $G$-bundles over $X$. 

## Universes versus bundles

## Eilenberg-Mac Lane spaces

*Inductive types* are collections of data and rules for mapping out of instances of the collection. For example here is an inductive type defining the natural numbers in Agda:

This theory can be extended to support data having values in the identity types of data that was specified earlier in the definition. Here is the circle defined as a HIT in Cubical Agda:

Given a group $G$ (meaning, a 0-type) with identity $G.1g$ and multiplication $G.mul$, we can form the Eilenberg-Mac Lane type $K(G, 1)$ as the following HIT:

## Associated bundles

## Group extensions

<pre class="Agda"><a id="11926" class="Symbol">{-#</a> <a id="11930" class="Keyword">OPTIONS</a> <a id="11938" class="Pragma">--without-K</a> <a id="11950" class="Pragma">--exact-split</a> <a id="11964" class="Symbol">#-}</a>

<a id="11969" class="Keyword">module</a> <a id="11976" href="group_extensions.html" class="Module Operator">group_extensions</a> <a id="11993" class="Keyword">where</a>

<a id="12000" class="Keyword">open</a> <a id="12005" class="Keyword">import</a> <a id="12012" href="foundation-core.universe-levels.html" class="Module">foundation-core.universe-levels</a>
<a id="12044" class="Keyword">open</a> <a id="12049" class="Keyword">import</a> <a id="12056" href="foundation-core.functions.html" class="Module">foundation-core.functions</a>
<a id="12082" class="Keyword">open</a> <a id="12087" class="Keyword">import</a> <a id="12094" href="foundation-core.identity-types.html" class="Module">foundation-core.identity-types</a>

<a id="12126" class="Comment">-- What is the analogue in HoTT of the fact from group extensions that we classify an extension by </a>
<a id="12226" class="Comment">-- taking a set-based section of the splitting, seeing that those elements act on the left hand group,</a>
<a id="12329" class="Comment">-- noting that this map into Aut G is not a homomorphism. There is a 2-cell that we can conjugate with that makes</a>
<a id="12443" class="Comment">-- it a homomorphism. So together, the extension (plus the arbitrary choice of splitting) yeilds a 2-map to the 2-group</a>
<a id="12563" class="Comment">-- AUT(G).</a>
<a id="12574" class="Comment">-- For us, a splitting will be a section of a type family. This acts on loops with apd.</a>
<a id="12662" class="Comment">-- So we want to prove some facts about apd and to what extent it&#39;s a homomorphism of loops.</a>
<a id="12755" class="Comment">-- It doesn&#39;t send loops to loops, because it sends the loop p to a loop from fx to ap p fx.</a>
<a id="12848" class="Comment">-- apd-hom :</a>
<a id="12861" class="Comment">--   {l1 l2 : Level} {A : UU l1} {B : A → UU l2} (f : (a : A) → B a) {x : A}</a>
<a id="12938" class="Comment">--   (p q : x ＝ x) → (apd f (p ∙ q)) ＝ ((apd ((tr B p) ∘ f) q) ∙ (apd (f) p))</a>
<a id="13016" class="Comment">-- apd-hom f refl q = ?</a>

</pre>
# Cohomology and characteristic classes

# Connections and Chern-Weil theory
    
# Appendix
