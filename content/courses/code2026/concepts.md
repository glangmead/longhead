# What to teach, and what to leave out

A working list of the concepts each lesson carries, and the Python you need in
order to show them. This is a syllabus, not a reference. It is deliberately
short.

## The three filters

1. **Does it survive the port?** Run the PORT IT prompt in your head: same
   program in Java, Swift, JavaScript, C#. If the idea is still there, it's
   programming. If it evaporates, it's Python vocabulary — look it up when you
   need it, don't spend class on it.
2. **Can the AI rescue you?** You can ask an assistant for `.extend()`. You
   cannot ask your way out of not knowing that `=` doesn't copy, because you
   won't know there's a question. Teach the things you can't look up because
   you don't know they exist.
3. **Does getting it wrong fail silently?** Anything that produces a wrong
   answer with no error message goes near the top. Errors teach themselves.
   Silence doesn't.

**The named exception: Python's opinions.** A few things fail filter 1 and
matter anyway — truthiness, `None`, significant whitespace, arbitrary-precision
integers, insertion-ordered dicts. Teach them explicitly as *this is Python's
opinion; other languages chose differently*. That framing is itself a
programming idea: languages have opinions, and you should know when you're
learning one.

---

## 1. Lists

| Teach | Because it teaches |
|---|---|
| `[a, b, c]`, `len(x)` | A collection is one value holding many. `len` is a *function*, `.append` is a *method* — first sighting of "who owns this operation" |
| `x[0]`, `x[-1]` | Zero-based indexing. The off-by-one universe |
| `x[a:b]` | **Half-open ranges.** `b - a` is the length; adjacent slices don't overlap. This convention is everywhere — `range`, slices, every array API you'll ever touch |
| `.append()` / `.remove()` / `in` / `.index()` | Enough verbs to write a real program. Also: `in` is a linear scan (sets up dicts) |
| **`sorted(x)` vs `x.sort()`** | **Mutate or return-new.** The single most transferable idea in the lesson. `.sort()` returns `None` — show it printing |
| `y = x` then `y.append(...)` | Aliasing. Two names, one list |
| Removing from a list you're looping over | The bug with no error message. Steal MIT's `remove_dups` |
| `x.pop(0)` vs `x.pop()` | Cost is real and invisible. ~11,000× at two million items |

**Leave out:** `.count()`, `.extend()`, `.insert()`, `.reverse()`, `.clear()`,
negative-step slicing, `sorted(key=...)` beyond one example, list
comprehensions (they belong to a later lesson, as *reading* practice).

---

## 2. Loops

| Teach | Because it teaches |
|---|---|
| `for x in things` | A loop runs over a **collection**, not a counter. Most beginners imagine a counter; Python's for-each is closer to the idea |
| The accumulator: `total = 0` outside, `total += n` inside | The most reused shape in programming. Move the init inside and watch it break |
| **The loop invariant** | *What is true every time round?* "After each pass, `total` is the sum of the books seen so far." This is how you actually reason about a loop, and almost nobody teaches it to beginners |
| `range(a, b)` | Half-open again — same convention, second sighting |
| `while` | You don't know the count, only the stopping condition. **Every loop needs an argument for why it terminates** |
| `break` / `continue` | The search pattern: loop until found, then stop |
| A loop inside a loop | Work multiplies. n² sneaks up on you. Sets up complexity |
| `enumerate` / `zip` | One example each. `zip` exists here mainly to make parallel lists feel bad |

**Leave out:** `else` on a loop, `itertools`, comprehensions, generator
expressions, `reversed`, loop-variable leakage.

---

## 3. Arithmetic

| Teach | Because it teaches |
|---|---|
| `int` vs `float` | Exact vs approximate. Two kinds of number, and `/` always gives you the second |
| `//` and `%` together | They're one operation. Every "convert seconds to minutes and seconds" problem is this pair |
| `0.1 + 0.2 != 0.3` | **Representation.** Some numbers can't be written down in binary, same as 1/3 in decimal. Never `==` two floats |
| Money as integer cents | The professional consequence of the line above |
| Order of operations, parentheses | Cheap, and the AI will hand you unparenthesised expressions |
| `2 ** 1000` works | **Python has no integer overflow — and every other language does.** Teaches representation by its absence. A great port-it moment |
| `ZeroDivisionError` | An error is a value your program can catch and handle, not just a crash |

**Leave out:** the `math` module, `abs`, `divmod` as a name, complex numbers.
**Footnote worth 30 seconds:** `round(0.5)` is `0` and `round(1.5)` is `2`.
Banker's rounding. Mention it, don't dwell.

---

## 4. Functions

| Teach | Because it teaches |
|---|---|
| **`print` vs `return`** | The most common beginner bug in any language. A function with no `return` gives you `None` |
| `def` defines, `f()` runs | Two separate moments |
| Parameter names are local | Scope, in its smallest possible form |
| One job per function, named for what it gives you | Design. The name is a promise |
| Default arguments; calling by keyword | `resize(img, 100, 200, True, False)` vs the keyword version. Free documentation |
| A function calling a function | Decomposition — the #1 skill in the AI-era lists |
| **Pure vs side-effecting** | Does it compute a value or change the world? Same idea as mutate-vs-return-new from lesson 1, second sighting |

**Leave out:** `*args`/`**kwargs`, lambdas as a topic, decorators, closures,
recursion (it belongs to the games lesson, where there's a tree to walk).

---

## 5. Variables — values and references

| Teach | Because it teaches |
|---|---|
| **`=` binds a name to a value. It never copies** | The whole lesson. Everything else follows |
| **Rebind vs mutate** | Ned Batchelder's vocabulary. Adopt it and use it consistently for the rest of the course |
| Mutable vs immutable | Why the surprise happens for lists and never for numbers |
| `is` vs `==` | Identity vs equivalence. Use `==` always, `is` only for `None` |
| Passing a list to a function that changes it | The caller's data is not safe. Ask of every function: does this mutate what I gave it? |
| `.copy()`, and why it isn't enough for nested data | Shallow vs deep |
| `def f(x, items=[])` | The default is created once, at `def` time. Fails silently and permanently |
| `None` | Python's word for "no value." Not zero, not empty |

**Leave out:** `id()` beyond one demonstration, garbage collection, interning,
`copy` module beyond `deepcopy`.

---

## 6. Dictionaries

| Teach | Because it teaches |
|---|---|
| `d[key]` vs `list[position]` | **The fundamental choice**: do I know the name, or the position? |
| Lookup cost: O(1) vs a list's O(n) | Why dictionaries exist at all. At ten items you'll never notice; at ten million it's the whole ballgame |
| Keys are unique, and must be immutable | Callback to lesson 5 — you can't use a list as a key, and now you know why |
| `d[k]` vs `d.get(k, default)` | Error philosophy: is a missing key a bug that should stop the program, or a normal event? |
| The counting pattern | The most useful five lines in this course |
| Record vs lookup table | Same syntax, opposite intent. Sets up objects |
| Dicts inside lists inside dicts | The shape of every web API you will ever touch |

**Leave out:** `defaultdict`/`Counter` (show `Counter` once as a payoff, don't
teach it), dict comprehensions, `setdefault`, `|` merging, `OrderedDict`.

---

## 7. Objects

| Teach | Because it teaches |
|---|---|
| A class bundles data with the operations on it | The one-sentence definition |
| **`self` is just the first argument** | `x.method()` is `method(x)`. Demystifies the whole topic in one line |
| Attribute typo → `AttributeError`; dict key typo → silent new key | **The reason to prefer a class.** Design-time names vs run-time keys |
| `__init__` | Where you guarantee the object is born valid |
| `__repr__` | Making a thing inspectable. Without it, printing is useless |
| Objects containing objects | Composition. A `Library` has `Book`s |
| `@dataclass` | When the class is just a bundle of named fields |
| Objects are mutable | Lesson 5, third sighting. Two names for one `Book` is the same trap |

**Leave out — deliberately:** inheritance, `super()`, class vs instance
attributes, properties, `__slots__`, ABCs, magic methods beyond `__repr__`.
At this level objects are simple, and they should leave believing that.

---

## 8. Files

| Teach | Because it teaches |
|---|---|
| A path is a *name*, not a file. Relative vs absolute; "where am I?" | The #1 cause of "it worked on my machine" |
| `encoding="utf-8"`, always | **Text is bytes plus a convention.** Leave it out and it works on your laptop and mangles every accent on someone else's |
| `"w"` destroys, `"a"` appends | Read the mode before you run code you didn't write |
| `with` | Resources have a lifetime and must be released, even when things crash |
| Everything read from a file is a string | **Parsing.** Where a large share of all real bugs live |
| Use the `csv` module, don't split on commas | *The recurring rule, sighting 1 of 4* |

**Leave out:** binary mode, `seek`/`tell`, `os.path` (use `pathlib`), file
locking, temp files.

---

## 9. Network

| Teach | Because it teaches |
|---|---|
| Request → response; the status code | First digit is the story: 2 fine, 3 elsewhere, 4 your fault, 5 theirs |
| A URL has parts | And `urlencode` escapes them — *the recurring rule, sighting 2 of 4* |
| **Everything that can fail, will** | This is where beginners first meet it honestly. Timeouts, DNS, refused, slow |
| `HTTPError` vs `URLError` | Did you reach the server and get refused, or never arrive? Halves your debugging |
| JSON in → nested dicts and lists out | Lesson 6, second sighting. Same `json` module as the file lesson |
| `.get()` on data from outside | Index into data you made; `.get()` on data that arrived. You control one and not the other |
| Keys are passwords | Environment variables. Never in code, never in a chat window |
| A network call is ~1000× slower than memory | Why caching exists, which is why the storage lesson exists |

**Leave out:** async, sessions, HTTP verbs beyond GET, headers beyond
User-Agent, OAuth, `httpx` vs `requests`.

---

## 10. Scraping

| Teach | Because it teaches |
|---|---|
| **The decision tree, before any code** | API? bulk download? robots.txt? terms? personal data? Only then scrape |
| robots.txt is a request, not a lock (RFC 9309) | It's a real standard, and it explicitly is *not* access authorisation |
| A page is a **tree** | Same shape as folders in folders, and as the game-state tree in lesson 12 |
| Selectors are paths through that tree — and you read them off DevTools, not out of your head | The actual professional workflow |
| No contract → it rots | An API promises a field name. A scraper promises nothing |
| **Check you got a sensible number of results** | `if len(items) == 0: raise` is the most valuable line in any scraper. It fails silently otherwise |
| What you download ≠ what you see | Client-side rendering. View Source vs Inspect |
| Use a parser, don't regex HTML | *The recurring rule, sighting 3 of 4* |

**Leave out:** Scrapy, Selenium/Playwright (mention as the answer to JS pages),
XPath, proxies, anything about evading detection.

---

## 11. Storage

| Teach | Because it teaches |
|---|---|
| The ladder: memory → JSON → CSV → SQLite | And how to pick a rung. Default to JSON; move when you catch yourself writing a loop to search a file |
| **Serialisation loses things** | Tuples come back as lists, int keys as strings, dates not at all. Show the round trip |
| Schema vs no schema | `NOT NULL` refuses bad data; a JSON file accepts anything |
| **Query vs loop** | Say *what* you want, not *how* to get it. At five rows it's showing off; at five million it's the only option |
| Commit / transactions | All-or-nothing. A large part of why databases exist |
| `?` placeholders | *The recurring rule, sighting 4 of 4 — and this one has a CVE attached* |
| Caching | The reason the Timeline deck doesn't hit the API twenty times per game |

**Leave out:** ORMs, migrations, JOINs beyond one example, normalisation,
`autocommit` semantics, indexes (mention, don't teach).

---

## 12. Games and state

| Teach | Because it teaches |
|---|---|
| **State**: what is the complete description of "now"? | The central modelling question of the whole course |
| Rules as four functions: what's legal, what a move does, is it over, who won | Change those four and the same program plays a different game |
| Immutable state (tuples) | So one branch of a search can't corrupt another. Lesson 5, final sighting, doing real work |
| The tree of possibilities; branching factor and depth | 549,946 tic-tac-toe positions; 10⁴⁵ for chess |
| Recursion = walking a tree | Handle the ending, otherwise ask the children. Three functions, one shape |
| Memoisation | 549,946 nodes but only 5,478 distinct boards. Don't re-solve what you've solved |
| Exhaustive vs heuristic search | Why chess engines guess, and what AlphaGo actually changed |
| Separating rules from interface | If the AI can bolt on a GUI without touching the rules, you separated them properly |

**For Timeline specifically:** inserting into a sorted list *is* binary search;
each guess halves the possibilities; `log₂(n+1)` questions. The tree here is
about **information**, not an opponent — the other half of the same idea.

---

## The threads worth naming out loud

Four ideas recur across topics. Say so each time — recurrence is what turns a
fact into a concept.

| Thread | Sightings |
|---|---|
| **Mutate or return new?** | lists (`sort`/`sorted`) → functions (pure vs side-effecting) → variables (rebind vs mutate) → objects → game states |
| **Never build a language with an f-string** | csv → urlencode → BeautifulSoup → SQL placeholders |
| **Half-open ranges** | slices → `range()` → pagination → binary search |
| **Position or name?** | list vs dict → dict vs object → CSV columns vs SQL fields |

## The other half of the answer

None of the above teaches problem decomposition, testing, or reading unfamiliar
code — and the research is unanimous that those are the skills that matter most
now. They aren't topics. They're what the live prompts and the projects are
for. Don't try to put them in a table.
