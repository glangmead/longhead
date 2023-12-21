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
\newcommand{\todo}[1]{\textbf{[TODO: {#1}]}}
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

There are other avenues one could pursue to treat the theory of connections in category theory or homotopy type theory. John Baez and collaborators [@baez_schreiber_higher_gauge] [@baez_huerta_higher_gauge] have emphasized the *path groupoid* $\mathcal{P}_1(X)$ of a manifold $X$, which is a sort of infinitary higher inductive type whose points are the points of $X$, whose paths are so-called *thin homotopy* classes of smooth paths (paths up to a homotopy that is 1-dimensional, for example a reparameterization of the path that simply changes speed), and where composition of paths is carefully defined so that compositions are always smooth. A connection is then simply a functor $\mathcal{P}_1(X)\to BG$ where $BG$ is a one-object groupoid whose paths are a given group $G$. 

The path groupoid construction has not been defined in HoTT, and it's not clear that it can be done, or whether it's worthwhile to do so. A related object which does exist in HoTT is the *fundamental groupoid* of $X$, whose points are the points of $X$ and whose paths are homotopy classes of paths. This is the 1-truncation of the full *fundamental $\infty$-groupoid* of $X$ which does not take equivalence classes but retains all the paths and adds higher equalities for the homotopies. Mike Shulman [@shulman_cohesion] and others have developed and extended a system of functions and higher inductive types that act as *modal operators* inside HoTT, with a corresponding topos-theoretic interpretation that extends ideas of Lawvere known as *cohesion*. One of the higher inductive types is called *shape* and when applied to a 0-type such as a manifold, constructs its fundamental $\infty$-groupoid as a higher type. This offers a pathway for classical objects to be imported into type theory, and for us to then define type-theoretic versions of classical constructions such as bundles and connections.

But the fundamental $\infty$-groupoid of a space is a relatively impoverished object, since paths that are homotopic are made equal. Connections that agree on homotopy-equivalent paths are called *flat* and are so special that we cannot build gauge theory with them! We need non-flat connections.

## Combinatorial manifolds

Per Hatcher [@hatcher_at] a *CW complex* is a space $X$ constructed through the following recursive procedure. Start with a set $X_0$, the 0-cells of $X$. Then inductively form the $n$-skeleton from the $n-1$-skeleton by attaching a set of disks via attaching maps of the boundary spheres. If $I_{n}$ is the indexing set at stage $n$, this means forming the pushout
$$\begin{CD}
\coprod_{I_n} S^{n-1} @>\mathrm{attach}>> X_{n-1} \\
@V\mathrm{incl}VV @VVV \\
\coprod_{I_n} D^{n} @>\phi_{I_n}>> X_{n}
\end{CD}
$$
We require each map in the set $\phi_{I_n}$ to be a homeomorphism on the interior of the disk. We will assume we stop at a finite dimension. We will be left with maps $X_0\hookrightarrow X_1\hookrightarrow\cdots\hookrightarrow X_n$ for some finite dimension $n$. 

What spaces are equivalent to a CW complex, and which CW complexes have other structures such as a piecewise linear structure or a smooth structure? Here's a quick rundown. $\todo{Get some clarity and present it.}$

It's easy to see how to take the data of a classical CW complex and convert it into a higher inductive type. Just replace the pushout with the homotopy pushout, and we have constructed a type that has $n$-cells living in path level $n$. Of course we may end up obtaining more paths than we put in the constructor, since even simple spaces like spheres have nontrivial higher homotopy. And on the other hand our space may turn out to be equivalent to a type with lower truncation level than $n$, for example if we create an interval with two points and a path between them, which nominally is a 1-type but is equivalent to a single point. But the situation should mirror the classical picture, so these are all features and not bugs.

But even a CW complex is not obviously amenable to defining discrete forms or connections. Why? Because the "bulk" of the manifold, the top-dimensional cells, have been thrust up to level $n$ in the type theory. 

Imagine trying to approximate a function $f:X\to \rr$ on a manifold with some sort of sampling or averaging. Start by forming a fine triangulation on the manifold (i.e. using lots of triangles). To construct a discrete approximation $f_d$ it seems natural to assign to each triangle a value that approximates $f$ in that region, say by taking the average of $f$ over the triangle. What would play the role of the differential $df$? It makes sense to look at two triangles $t_1$ and $t_2$ that share an edge $e_{12}$ and look at the difference $f_d(t_2)-f_d(t_1)$ and assign that to the edge $e_{12}$. This is a *dual* edge to the triangulation, and the two vertices that it joins are $t_1$ and $t_2$ considered as single points, i.e. *dual* vertices.

In HoTT terms we would like the top-dimensional classical information to live at level 0 in the type theory, and the connectivity to live at level 1 and so on. So instead of forming a triangulation or CW structure for our manifold, we want to form a *Cech nerve of an open cover*.

$\todo{define this, and cite theorems about its homotopy type, focusing on the niceness or other special conditions}$

So let's form HITs whose points correspond to the bulk, that is to open sets in $X$, so as to capture combinatorially structures that are samples or averages of their classical counterparts.

This is calculus without infinitesimals and without tangent spaces. Paths and higher paths have finite length. There is no de Rham cohomology, only cellular cohomology.

Consider the surface of a Rubik's cube as a stand-in for a 2-sphere. Let's call the face that has a white center the white face, even if the cube is scrambled. If the white face is on top and the green face is facing you, then yellow is on the bottom, blue is at the back, red is to the right and orange is to the left. Form an open cover whose open sets are faces plus a little spillover to the four neighboring faces. The nerve of this cover is an octahedron with vertices colored white, green and so on, with edges that correspond to adjacent faces, and with 2-cells for the 3-way intersections taking place at the original corners. We can define a non-flat connection on this space, one that captures the intrinsic curvature of the embedding into 3-dimensional space, in the following way. 

Imagine a closed path on the original cube that starts at the white center square, moves along the top face and then the red face to the red center square, then comes around to the front green square, then back up to the white north pole. This path traverses three faces. In the dual octahedron this path picks out the white-red edge, then the red-green edge, then green-white. So it's also a closed path in the dual space. We will assign to this curve a point in $SO(2)$, which is the structure group of the tangent bundle of the sphere. In particular we assign the value "clockwise rotation by 90 degrees". That's what happens to an imaginary tangent vector as it is transported around this curve. I haven't defined tangent vectors, but I don't need to, they are just to help us understand why we made this choice of group element.

Classically a connection is usually defined to be a 1-form with values in the Lie algebra of the structure group. That's just the infinitesimal version of what we did, which is the assignment of group elements to paths.




