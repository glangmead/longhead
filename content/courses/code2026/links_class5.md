# Class 5: suggested links

Checked 2026-09-18. Bullets are in index.md style; copy what you want. "(research.md)" = already in your research notes.

### Storage, games (and game state trees)

Storage:

* [Software Eng for Vibe Coders: Databases + Storage](https://read.technically.dev/p/software-eng-for-vibe-coders-databases) (Technically) -- the storage half: files and blobs vs a database. (Also suggested under Class 2.)
* [Serialization](https://en.wikipedia.org/wiki/Serialization) (Wikipedia) -- the word for "write it out so it can come back"; lead is dense.
* JSON, CSV, SQLite pages: see Class 4 and Class 2 lists.

Games:

* [Game tree](https://en.wikipedia.org/wiki/Game_tree) (Wikipedia) -- first two levels of tic-tac-toe drawn; 255,168 possible games.
* [Tic-tac-toe, Combinatorics section](https://en.wikipedia.org/wiki/Tic-tac-toe#Combinatorics) (Wikipedia) -- 765 distinct boards, 26,830 games. Note these count different things from your 549,946 (tree nodes) and 5,478 (reachable boards); worth saying which is which.
* [xkcd 832: Tic-Tac-Toe](https://xkcd.com/832/) -- the complete optimal-move map on one page.
* [Minimax](https://en.wikipedia.org/wiki/Minimax) (Wikipedia) -- animated tree diagram. [Tic-Tac-Toe: Understanding the Minimax Algorithm](https://www.neverstopbuilding.com/blog/minimax) (Jake Trent) walks it with board pictures; code is Ruby, use the diagrams.
* [Solved game](https://en.wikipedia.org/wiki/Solved_game) (Wikipedia) -- tic-tac-toe, Connect Four, checkers; what "solved" means.
* [Binary search](https://en.wikipedia.org/wiki/Binary_search) (Wikipedia) -- halving; the Timeline insertion idea.
* [A Tic-Tac-Toe Board](https://automatetheboringstuff.com/2e/chapter5/) (Automate the Boring Stuff, 2nd ed., chapter 5) -- the board as a dict. The 3rd edition swapped this for a chess example.

### Specs

* Joel Spolsky, Painless Functional Specifications: [Part 1, Why Bother?](https://www.joelonsoftware.com/2000/10/02/painless-functional-specifications-part-1-why-bother/), [Part 2, What's a Spec?](https://www.joelonsoftware.com/2000/10/03/painless-functional-specifications-part-2-whats-a-spec/) -- part 2 links a sample spec (WhatTimeIsIt). 2000, conversational.
* [User story](https://en.wikipedia.org/wiki/User_story) (Wikipedia) -- "As a ..., I want ..., so that ..." template.
* [Software requirements specification](https://en.wikipedia.org/wiki/Software_requirements_specification), [Product requirements document](https://en.wikipedia.org/wiki/Product_requirements_document) (Wikipedia) -- references.
* [An insider look at Amazon's culture and processes](https://www.aboutamazon.com/news/workplace/an-insider-look-at-amazons-culture-and-processes) (About Amazon) -- the PR/FAQ section: write the press release before building. No worked example.
* (research.md) [How to Design Programs](https://htdp.org/) -- the design recipe: problem, signature, examples, body, tests. Examples before code is the spec habit. No short standalone page; the thoughtbot writeup I checked assumes Ruby.
* Nothing good found for "a prompt is a spec" written for non-coders. The one Substack post on it drifts into jargon; Anthropic's prompting docs are for developers.

### The notional machine

* [Notional Machines](https://textbooks.cs.ksu.edu/tlcs/2-learning-cs/09-notional-machines/) (KSU open textbook, Teaching and Learning CS) -- 3-min definition: an idealized computer whose behavior the learner has to model; misconceptions are flaws in that model. No citations.
* [Mental Models and Formative Assessment](https://teachtogether.tech/en/index.html#s:models) (Teaching Tech Together, ch. 2) -- has a "Notional Machines" subsection. You already link the book under Pedagogy.
* [Call stack](https://en.wikipedia.org/wiki/Call_stack) (Wikipedia) -- frames diagram; the piece of the machine that explains function calls.
* Sorva, [Notional machines and introductory programming education](https://doi.org/10.1145/2483710.2483713) (ACM TOCE 2013) -- the survey paper; paywalled (403 on fetch). Instructor reading.
* Already here: Python Tutor (Notes) is the notional machine drawn live; Ned Batchelder's names talk (Class 2 list) is the correction "names are labels, not boxes."
* (research.md) [Learnable Programming](http://worrydream.com/LearnableProgramming/) (Bret Victor) -- long; the opening section "People understand what they can see."
