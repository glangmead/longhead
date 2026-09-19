# Class 1: suggested links

Checked 2026-09-18. Bullets are in index.md style; copy what you want. "(research.md)" = already in your research notes.

### Arithmetic, loops, lists

* [Why does 0.1 + 0.2 = 0.30000000000000004?](https://jvns.ca/blog/2023/02/08/why-does-0-1-plus-0-2-equal-0-30000000000000004/) (Julia Evans) -- conversational; first half is enough, second half is 64-bit internals.
* [Floating point is weird](https://wizardzines.com/comics/floating-point-weird/) (Julia Evans comic) -- one page: `0.1 + 0.2 - 0.3 != 0`, never `==` two floats.
* [Modulo, floor division, and modular arithmetic](https://www.uvm.edu/~cbcafier/cs1210/book/04_variables,_statements,_and_expressions/modulo_and_floor.html) (Clayton Cafiero, UVM course notes) -- `//` and `%` as one operation, via clock arithmetic and egg cartons. Long; skip the modular-arithmetic tail.
* [Zero-based numbering](https://en.wikipedia.org/wiki/Zero-based_numbering) (Wikipedia) -- why lists start at 0. First two paragraphs.
* [Lists](https://docs.python.org/3/tutorial/introduction.html#lists) in the official tutorial -- indexing and slicing; "the start is always included, and the end always excluded."
* [Sorting Techniques](https://docs.python.org/3/howto/sorting.html) (python.org) -- `.sort()` mutates and returns `None`, `sorted()` returns a new list. First third only.
* Automate the Boring Stuff, 3rd ed.: [Loops](https://automatetheboringstuff.com/3e/chapter3.html), [Lists](https://automatetheboringstuff.com/3e/chapter6.html) -- free book, second voice alongside Practical Python.

### Front end, back end

* Technically glossary: [frontend](https://technically.dev/universe/frontend), [backend](https://technically.dev/universe/backend), [database](https://technically.dev/universe/database), [API](https://technically.dev/universe/api), [server](https://technically.dev/universe/server), [client](https://technically.dev/universe/client) -- one paragraph each, same restaurant analogy.
* [What's an API?](https://read.technically.dev/p/whats-an-api) (Technically) -- "like drive-thru windows, but in code." ~7 min, free, not gated.
* [Front end and back end](https://en.wikipedia.org/wiki/Frontend_and_backend) (Wikipedia) -- reference page for the same split.
* Series note: parts 2 and 3 of "Software Eng for Vibe Coders" exist ([Databases + Storage](https://read.technically.dev/p/software-eng-for-vibe-coders-databases), [Auth + Security](https://read.technically.dev/p/security-for-vibe-coders)); both free. Suggested under Class 2 Databases and Class 6 Security. Parts 4-6 not published as of today.
* Skipped: Technically's `technically.dev/posts/...` pages ("APIs for the rest of us", "What's version control and GitHub") gate partway through with a subscription wall. The `read.technically.dev` newsletter posts and `/universe` glossary entries are free.

### Addition circuits

* [NandGame](https://nandgame.com/) (browser game) -- build from a NAND gate up through a half adder, full adder, ALU, CPU. Free, no login. Fetch returned only the title, so verify in a browser.
* [Logic Gate Simulator](https://academo.org/demos/logic-gate-simulator/) (Academo) -- drag-and-drop AND/OR/XOR with truth tables. No prebuilt adder; build one live from the Wikipedia diagram.
* Crash Course Computer Science [#3 Boolean Logic & Logic Gates](https://www.youtube.com/watch?v=gI-qXk7XojA), [#5 How Computers Calculate: the ALU](https://www.youtube.com/watch?v=1I5ZMmrOfnA) -- 11 min each; #5 builds the adder on screen.
* [Exploring How Computers Work](https://www.youtube.com/watch?v=QZwneRb-zqA) (Sebastian Lague) -- 17 min, animated; transistors to gates to an adder.
* [Logic gate](https://en.wikipedia.org/wiki/Logic_gate) (Wikipedia; scroll to "Symbols"), [Binary number](https://en.wikipedia.org/wiki/Binary_number) (Wikipedia; table at top) -- reference pages.
* Ben Eater: [Making logic gates from transistors](https://www.youtube.com/watch?v=sTu3LwpF6XI) (13 min), [the ALU](https://eater.net/8bit/alu) (the "Binary addition" video, 14 min) -- real breadboards.
