# Class 6: suggested links

Checked 2026-09-18. Bullets are in index.md style; copy what you want. "(research.md)" = already in your research notes.

### Security and privacy

* [Software Eng for Vibe Coders: Auth + Security](https://read.technically.dev/p/security-for-vibe-coders) (Technically) -- part 3 of the series; authentication (who you are) vs authorization (what you may touch); a role-by-feature matrix. Free.
* [How HTTPS works](https://howhttps.works/) (DNSimple comic) -- "why does a lock icon appear?" Plus [TLS certificates](https://wizardzines.com/comics/certificates/) (Julia Evans, one page).
* [How NOT to Store Passwords!](https://www.youtube.com/watch?v=8ZtInClXe1Q) (Computerphile, 9 min) -- hashing vs encryption, salting. References: [Cryptographic hash function](https://en.wikipedia.org/wiki/Cryptographic_hash_function), [Salt (cryptography)](https://en.wikipedia.org/wiki/Salt_(cryptography)) (Wikipedia; skip the leads, read the worked examples).
* [SQL injection](https://en.wikipedia.org/wiki/SQL_injection) (Wikipedia) -- worked `' or 1=1` example. [Hacking Websites with SQL Injection](https://www.youtube.com/watch?v=_jKylhJtPmI) (Computerphile) demos it live.
* [xkcd 936: Password Strength](https://xkcd.com/936/).
* [Exif, Privacy and security section](https://en.wikipedia.org/wiki/Exif#Privacy_and_security) (Wikipedia) -- GPS in photos; the McAfee geotag story.
* [Have I Been Pwned](https://haveibeenpwned.com/) -- check an email address. You already link its Adobe record.
* [OWASP Top 10:2025](https://top10.owasp.org/2025) -- the ten titles are readable; detail pages are for developers.
* Technically glossary: [authentication](https://technically.dev/universe/authentication).

### QA

* [Errors and Exceptions](https://docs.python.org/3/tutorial/errors.html) (official tutorial) -- the first traceback example and how to read it. Stop before `try`.
* Automate the Boring Stuff, 3rd ed.: [Debugging](https://automatetheboringstuff.com/3e/chapter5.html) -- tracebacks, assertions, the debugger.
* [How I got better at debugging](https://wizardzines.com/comics/better-at-debugging/) (Julia Evans comic) -- "it's never magic."
* [Debugging](https://technically.dev/universe/debugging) (Technically glossary) -- one paragraph.
* [pytest: Get Started](https://docs.pytest.org/en/stable/getting-started.html) -- the 4-line first test. Stop there.
* [Software testing](https://en.wikipedia.org/wiki/Software_testing), [Unit testing](https://en.wikipedia.org/wiki/Unit_testing), [Software bug](https://en.wikipedia.org/wiki/Software_bug) (Wikipedia) -- references.
* [List of software bugs](https://en.wikipedia.org/wiki/List_of_software_bugs) (Wikipedia) -- Ariane 5, Therac-25, Mars Climate Orbiter. Stories, in the vein of your breach list.
* [Rubber duck debugging](https://en.wikipedia.org/wiki/Rubber_duck_debugging) (Wikipedia) -- 1 min.
* (research.md) Willison, [Here's how I use LLMs to help me write code](https://simonwillison.net/2025/Mar/11/using-llms-for-code/) -- "the one thing you absolutely cannot outsource to the machine is testing." The Atomic Object post on the same point assumes TDD jargon; skipped.

### Theory of programming languages

* [A Map of the Territory](https://craftinginterpreters.com/a-map-of-the-territory.html) (Crafting Interpreters, Robert Nystrom; free chapter) -- scanning, parsing, syntax tree, compile vs interpret, with pictures and a mountain-climb analogy. Skip the "alternatives" subsection. Assumes comfort with technical reading.
* [Abstract syntax tree](https://en.wikipedia.org/wiki/Abstract_syntax_tree) (Wikipedia) -- diagram of a real one at top.
* [Type system](https://en.wikipedia.org/wiki/Type_system) (Wikipedia) -- static vs dynamic; dry lead.
* [Turing completeness](https://en.wikipedia.org/wiki/Turing_completeness) (Wikipedia) -- "HTML is not Turing complete; Conway's Game of Life is."
* [Esoteric programming language](https://en.wikipedia.org/wiki/Esoteric_programming_language) (Wikipedia) -- Brainfuck, Whitespace, Shakespeare; what a language needs and does not need.
* [Syntax (programming languages)](https://en.wikipedia.org/wiki/Syntax_(programming_languages)), [Semantics (computer science)](https://en.wikipedia.org/wiki/Semantics_(computer_science)) (Wikipedia) -- references.
* Cross-refs: Crash Course #11 (first compiler) and Technically's "compile" entry are in the Class 4 list; Wikipedia "Programming language" too.
