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
summary: In-progress masters thesis defining connections, curvature, and Chern-Weil theory in the discrete setting of homotopy type theory.
date: 2023-12-20
bibliography: connections.bib
csl: ima.csl
---

<!-- https://pandoc.org/MANUAL.html -->
\newcommand{\defeq}{\stackrel{\textup{def}}{=}}
\newcommand{\U}{\mathcal{U}}
\newcommand{\BG}{\mathsf{B}G}
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
\newcommand{\Gg}{\mathscr{G}}
\newcommand{\Aa}{\mathscr{A}}
\newcommand{\Bb}{\mathscr{B}}

<center>
![](geb-logo.png "Image of the book cover of Godel Escher Bach"){ width=500 }
</center>

## Outline
1. Combinatorial topology
	1. Cech, PL, CW
	2. Contrast with the path groupoid narratives
2. We'll use the k-skeleton inclusions to control maps
3. Torsors, deloopings, BAut
4. Where is the principal bundle, where is the connection, where is the curvature?
5. Arriving at the gauge group and its delooping without using the "space of connections for a fixed bundle"
6. Using the homotopy type of the gauge group
	1. characteristic classes
	2. seeing Chern-Weil in characteristic classes
7. Examples, including with maximal tori

## Abstract

We introduce discrete gauge theory.

## Introduction

[Gauge theory](https://en.wikipedia.org/wiki/Gauge_theory) is a general methodology for defining invariants of spaces, whether those be invariants of the homotopy type, the homomorphism class, or the diffeomorphism class. We make use of mediating objects such as principal bundles over the space, connections on the bundles, and morphisms of these. These additional objects provide access to information beyond the homology and homotopy groups of the space, but they are also of direct interest as well. In physics, the fields that model matter particles are sections of bundles, and those that model force fields are connections. The laws of nature are postulated to be invariant under automorphisms of all the underlying principal bundles, and so all the objects we need to study topology are relevant in physics as well!

The standard introductions to differential geometry and gauge theory work at the infinitesimal level. Connections are differential forms with values in the Lie algebra of a Lie group, forms are sections of a skew symmetric product of cotangent spaces. This fine local structure is so far inaccessible to homotopy type theory, even with modalities such as those offered by differential cohesion. These modalities are intriguing but very alien to classical intuitions. We won't be saying more about that line of investigation.

There is another approach, which is to draw inspiration from discrete and combinatorial methods. [Discrete differential geometry](https://en.wikipedia.org/wiki/Discrete_differential_geometry) is an active field of applied mathematics and computer science, which has reused or created definitions of vector field, differential form, connection and curvature, that apply to a triangulated surface embedded in 3-dimensional space (as might be used in a computer graphics engine).

Algebraic topology of course has always had a train of thought devoted to combinatorial approximations to smooth or continuous spaces, a major example of which is the notion of a CW complex. The theory of piecewise linear (PL) manifolds is another important example where a finite structure is used to capture important properties of a space.

Such complexes are easy to define in homotopy type theory, as [higher inductive types](https://en.wikipedia.org/wiki/Homotopy_type_theory#The_univalence_axiom,_synthetic_homotopy_theory,_and_higher_inductive_types). We will see a lot of examples shortly. Can we define bundles, forms and connections on these?

## Survey of classical results

Here is a brief overview of the kinds of results we want to gain access to in HoTT. 

* Freed-Hopkins
* $B\Gg$
* hairy ball theorem
* characteristic classes

## Not the fundamental groupoid, not the path groupoid

There are other avenues one could pursue to treat the theory of connections in category theory or homotopy type theory.



