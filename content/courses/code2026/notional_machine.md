# The notional machine in five Python Tutor programs

Draft 2026-09-18. Goal: someone who can narrate these five in the step machine has the 12-point notional machine (Teaching Tech Together, after Sorva 2013). Built around the 12 points, not the five class headings.

## Setup

* Every link turns on **"show strings and numbers as objects"** (`primitivesAsObjects=true`). With it off, ints and strings are drawn inside the frame, which contradicts point 2 and hides point 3. Look for "Non-default options" under the code pane. Old links use `heapPrimitives=true`; still accepted.
* "Run" links are `visualize.html` with `mode=display`: straight into the visualizer, no click. `render.html` is a 301 alias. "Edit" links open the editor with the code prefilled. `curInstr=N` opens at step N; the run links below open on the step named in the first "watch for" line.
* Each program has an iframe line for embedding in index.md. Python Tutor's own generator emits the same form.
* Limits, all verified today: 1000 steps; no `open()` ("use io.StringIO() to simulate a file"); no network; source under ~2000 chars, link under ~5600. Importable modules: __future__, abc, array, bisect, calendar, cmath, collections, copy, datetime, decimal, doctest, fractions, functools, hashlib, heapq, io, itertools, json, locale, math, operator, pprint, random, re, string, types, typing, unittest. No `csv`.
* Python 3.11 (`py=311`). Guo's own page for link-builders: [pythontutor.com/for-ai-assistants.html](https://pythontutor.com/for-ai-assistants.html).

## Coverage

| Point | Program | Where it is visible |
|---|---|---|
| 1 stack + heap | all | Frames column left, Objects column right |
| 2 all data in heap | 1 | `start = 0` puts a box on the right, not a value in the frame |
| 3 type + value | 1, 2, 4 | box labels: int, float, str, bool, list, dict, function, module instance |
| 4 immutables never change | 1, 3 | `count = count + 1` makes a new box; `name.upper()` changes nothing; `word = word + "!"` |
| 5 collections hold references, mutable | 2, 3 | alias vs copy; `[book, book]`; `add_item` |
| 6 code is data | 3, 4 | function boxes appear at `def`; `twice = double`; list of functions; `fn` parameter; module box |
| 7 step through instructions | all | the slider; 1 is the 10-step warm-up |
| 8 compute / control / call | 2, 5, 3 | loop arrow jumps back; `if`; call adds a frame |
| 9 call pushes a frame | 3, 4, 5 | |
| 10 frame = names + arrows; params are variables | 3, 4, 5 | `word`, `items`, `fn`, `stones` |
| 11 lookup: top frame, then global | 3, 5 | `bump` reads global `count`; `reset` shadows it; `seen` inside `can_win` |
| 12 return erases frame, resumes caller; no caller = done | 3, 5, all | `describe` -> `bump`; recursion unwinding; "Program terminated" |

Not in the 12 points, so not here: classes and `self`, tuples, exceptions. Guo's OOP examples cover the first if wanted.

## 1. Values are typed boxes

Points 1, 2, 3, 4, 7. 10 steps.

[Run](<https://pythontutor.com/visualize.html#code=start%20%3D%200%0Acount%20%3D%20start%20%20%20%20%20%20%20%20%20%20%20%20%23%20two%20names%2C%20one%20box%0Acount%20%3D%20count%20%2B%201%20%20%20%20%20%20%20%20%23%20a%20new%20box%20holding%201%3B%20start%20still%20points%20at%200%0Ahalf%20%3D%20count%20%2F%202%20%20%20%20%20%20%20%20%20%23%20a%20float%3A%20a%20different%20type%20of%20box%0Apages%20%3D%20%22412%22%20%20%20%20%20%20%20%20%20%20%20%20%23%20text%20that%20looks%20like%20a%20number%0An%20%3D%20int%28pages%29%20%20%20%20%20%20%20%20%20%20%20%23%20a%20new%20int%20box%3B%20pages%20is%20still%20text%0Aname%20%3D%20%22ann%22%0Aname.upper%28%29%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20makes%20%22ANN%22%20and%20drops%20it%3B%20name%20is%20untouched%0Aloud%20%3D%20name.upper%28%29%20%20%20%20%20%20%23%20keep%20it%20this%20time%3A%20two%20strings%2C%20two%20boxes%0Adone%20%3D%20n%20%3E%20400%20%20%20%20%20%20%20%20%20%20%20%23%20a%20bool%20box%0A&cumulative=false&curInstr=10&mode=display&origin=opt-frontend.js&primitivesAsObjects=true&py=311&rawInputLstJSON=%5B%5D&textReferences=false>) · [Edit](<https://pythontutor.com/visualize.html#code=start%20%3D%200%0Acount%20%3D%20start%20%20%20%20%20%20%20%20%20%20%20%20%23%20two%20names%2C%20one%20box%0Acount%20%3D%20count%20%2B%201%20%20%20%20%20%20%20%20%23%20a%20new%20box%20holding%201%3B%20start%20still%20points%20at%200%0Ahalf%20%3D%20count%20%2F%202%20%20%20%20%20%20%20%20%20%23%20a%20float%3A%20a%20different%20type%20of%20box%0Apages%20%3D%20%22412%22%20%20%20%20%20%20%20%20%20%20%20%20%23%20text%20that%20looks%20like%20a%20number%0An%20%3D%20int%28pages%29%20%20%20%20%20%20%20%20%20%20%20%23%20a%20new%20int%20box%3B%20pages%20is%20still%20text%0Aname%20%3D%20%22ann%22%0Aname.upper%28%29%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20makes%20%22ANN%22%20and%20drops%20it%3B%20name%20is%20untouched%0Aloud%20%3D%20name.upper%28%29%20%20%20%20%20%20%23%20keep%20it%20this%20time%3A%20two%20strings%2C%20two%20boxes%0Adone%20%3D%20n%20%3E%20400%20%20%20%20%20%20%20%20%20%20%20%23%20a%20bool%20box%0A&cumulative=false&curInstr=0&mode=edit&origin=opt-frontend.js&primitivesAsObjects=true&py=311&rawInputLstJSON=%5B%5D&textReferences=false>)

```python
start = 0
count = start            # two names, one box
count = count + 1        # a new box holding 1; start still points at 0
half = count / 2         # a float: a different type of box
pages = "412"            # text that looks like a number
n = int(pages)           # a new int box; pages is still text
name = "ann"
name.upper()             # makes "ANN" and drops it; name is untouched
loud = name.upper()      # keep it this time: two strings, two boxes
done = n > 400           # a bool box
```

Watch for:

* Right pane: every value is a box labelled with its type: int, float, str, bool. The label is the "type" half of point 3. Only visible with "show strings and numbers as objects" on.
* Line 3: a new box holding 1 appears; `start` still points at 0. The 0 was not modified (4).
* Line 8: `name.upper()` runs and nothing on the right changes. Line 9: the new string appears only once a name points at it.
* "412" and 412 side by side: same digits, different type.
* Last step: "Program terminated". No "before" to return to (12).

Embed:

```html
<iframe width="800" height="500" frameborder="0" src="https://pythontutor.com/iframe-embed.html#code=start%20%3D%200%0Acount%20%3D%20start%20%20%20%20%20%20%20%20%20%20%20%20%23%20two%20names%2C%20one%20box%0Acount%20%3D%20count%20%2B%201%20%20%20%20%20%20%20%20%23%20a%20new%20box%20holding%201%3B%20start%20still%20points%20at%200%0Ahalf%20%3D%20count%20%2F%202%20%20%20%20%20%20%20%20%20%23%20a%20float%3A%20a%20different%20type%20of%20box%0Apages%20%3D%20%22412%22%20%20%20%20%20%20%20%20%20%20%20%20%23%20text%20that%20looks%20like%20a%20number%0An%20%3D%20int%28pages%29%20%20%20%20%20%20%20%20%20%20%20%23%20a%20new%20int%20box%3B%20pages%20is%20still%20text%0Aname%20%3D%20%22ann%22%0Aname.upper%28%29%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20makes%20%22ANN%22%20and%20drops%20it%3B%20name%20is%20untouched%0Aloud%20%3D%20name.upper%28%29%20%20%20%20%20%20%23%20keep%20it%20this%20time%3A%20two%20strings%2C%20two%20boxes%0Adone%20%3D%20n%20%3E%20400%20%20%20%20%20%20%20%20%20%20%20%23%20a%20bool%20box%0A&codeDivHeight=400&codeDivWidth=350&curInstr=10&origin=opt-frontend.js&primitivesAsObjects=true&py=311"></iframe>
```

## 2. Collections hold arrows

Points 3, 5, 8. 16 steps.

[Run](<https://pythontutor.com/visualize.html#code=scores%20%3D%20%5B10%2C%2020%5D%20%20%20%20%20%20%20%20%23%20a%20list%20holds%20arrows%20to%20boxes%2C%20not%20the%20boxes%0Aalias%20%3D%20scores%20%20%20%20%20%20%20%20%20%20%20%23%20two%20names%2C%20one%20list%0Aalias.append%2830%29%20%20%20%20%20%20%20%20%20%23%20scores%20sees%20it%0Acopy%20%3D%20list%28scores%29%20%20%20%20%20%20%23%20a%20second%20list%2C%20pointing%20at%20the%20same%20boxes%0Ascores%5B0%5D%20%3D%2011%20%20%20%20%20%20%20%20%20%20%20%23%20alias%20sees%20it%3B%20copy%20does%20not%0Abook%20%3D%20%7B%22title%22%3A%20%22Dune%22%2C%20%22pages%22%3A%20412%7D%0Ashelf%20%3D%20%5Bbook%2C%20book%5D%20%20%20%20%20%23%20the%20same%20dict%20twice%0Abook%5B%22pages%22%5D%20%3D%20500%20%20%20%20%20%20%23%20both%20shelf%20entries%20change%0Atotal%20%3D%200%0Afor%20s%20in%20scores%3A%20%20%20%20%20%20%20%20%20%23%20the%20loop%20jumps%20back%20here%20after%20each%20pass%0A%20%20%20%20total%20%3D%20total%20%2B%20s%0A&cumulative=false&curInstr=8&mode=display&origin=opt-frontend.js&primitivesAsObjects=true&py=311&rawInputLstJSON=%5B%5D&textReferences=false>) · [Edit](<https://pythontutor.com/visualize.html#code=scores%20%3D%20%5B10%2C%2020%5D%20%20%20%20%20%20%20%20%23%20a%20list%20holds%20arrows%20to%20boxes%2C%20not%20the%20boxes%0Aalias%20%3D%20scores%20%20%20%20%20%20%20%20%20%20%20%23%20two%20names%2C%20one%20list%0Aalias.append%2830%29%20%20%20%20%20%20%20%20%20%23%20scores%20sees%20it%0Acopy%20%3D%20list%28scores%29%20%20%20%20%20%20%23%20a%20second%20list%2C%20pointing%20at%20the%20same%20boxes%0Ascores%5B0%5D%20%3D%2011%20%20%20%20%20%20%20%20%20%20%20%23%20alias%20sees%20it%3B%20copy%20does%20not%0Abook%20%3D%20%7B%22title%22%3A%20%22Dune%22%2C%20%22pages%22%3A%20412%7D%0Ashelf%20%3D%20%5Bbook%2C%20book%5D%20%20%20%20%20%23%20the%20same%20dict%20twice%0Abook%5B%22pages%22%5D%20%3D%20500%20%20%20%20%20%20%23%20both%20shelf%20entries%20change%0Atotal%20%3D%200%0Afor%20s%20in%20scores%3A%20%20%20%20%20%20%20%20%20%23%20the%20loop%20jumps%20back%20here%20after%20each%20pass%0A%20%20%20%20total%20%3D%20total%20%2B%20s%0A&cumulative=false&curInstr=0&mode=edit&origin=opt-frontend.js&primitivesAsObjects=true&py=311&rawInputLstJSON=%5B%5D&textReferences=false>)

```python
scores = [10, 20]        # a list holds arrows to boxes, not the boxes
alias = scores           # two names, one list
alias.append(30)         # scores sees it
copy = list(scores)      # a second list, pointing at the same boxes
scores[0] = 11           # alias sees it; copy does not
book = {"title": "Dune", "pages": 412}
shelf = [book, book]     # the same dict twice
book["pages"] = 500      # both shelf entries change
total = 0
for s in scores:         # the loop jumps back here after each pass
    total = total + s
```

Watch for:

* A list is a box of arrows, not a box of values (5). Step 4: `copy` is a second list whose arrows point at the same int boxes.
* Step 5: `scores[0] = 11` changes the list box in place; `alias` sees it, `copy` does not.
* Steps 7-8: `shelf` holds two arrows to one dict. Changing `book["pages"]` changes "both" entries.
* Loop: the red arrow jumps from line 11 back to line 10 three times. Some instructions choose the next instruction (8).

Embed:

```html
<iframe width="800" height="500" frameborder="0" src="https://pythontutor.com/iframe-embed.html#code=scores%20%3D%20%5B10%2C%2020%5D%20%20%20%20%20%20%20%20%23%20a%20list%20holds%20arrows%20to%20boxes%2C%20not%20the%20boxes%0Aalias%20%3D%20scores%20%20%20%20%20%20%20%20%20%20%20%23%20two%20names%2C%20one%20list%0Aalias.append%2830%29%20%20%20%20%20%20%20%20%20%23%20scores%20sees%20it%0Acopy%20%3D%20list%28scores%29%20%20%20%20%20%20%23%20a%20second%20list%2C%20pointing%20at%20the%20same%20boxes%0Ascores%5B0%5D%20%3D%2011%20%20%20%20%20%20%20%20%20%20%20%23%20alias%20sees%20it%3B%20copy%20does%20not%0Abook%20%3D%20%7B%22title%22%3A%20%22Dune%22%2C%20%22pages%22%3A%20412%7D%0Ashelf%20%3D%20%5Bbook%2C%20book%5D%20%20%20%20%20%23%20the%20same%20dict%20twice%0Abook%5B%22pages%22%5D%20%3D%20500%20%20%20%20%20%20%23%20both%20shelf%20entries%20change%0Atotal%20%3D%200%0Afor%20s%20in%20scores%3A%20%20%20%20%20%20%20%20%20%23%20the%20loop%20jumps%20back%20here%20after%20each%20pass%0A%20%20%20%20total%20%3D%20total%20%2B%20s%0A&codeDivHeight=400&codeDivWidth=350&curInstr=8&origin=opt-frontend.js&primitivesAsObjects=true&py=311"></iframe>
```

## 3. Calls, frames, lookup

Points 6, 9, 10, 11, 12. 35 steps.

[Run](<https://pythontutor.com/visualize.html#code=count%20%3D%207%0Agreeting%20%3D%20%22hi%22%0A%0Adef%20add_excited%28word%29%3A%0A%20%20%20%20word%20%3D%20word%20%2B%20%22%21%22%20%20%20%20%20%20%20%20%20%20%20%23%20rebinds%20the%20local%3B%20greeting%20is%20untouched%0A%20%20%20%20return%20word%0A%0Adef%20add_item%28items%2C%20thing%29%3A%0A%20%20%20%20items.append%28thing%29%20%20%20%20%20%20%20%20%20%23%20changes%20the%20caller%27s%20list%0A%0Adef%20bump%28%29%3A%0A%20%20%20%20return%20count%20%2B%201%20%20%20%20%20%20%20%20%20%20%20%20%23%20count%20is%20not%20in%20this%20frame%3B%20found%20in%20the%20global%20frame%0A%0Adef%20reset%28%29%3A%0A%20%20%20%20count%20%3D%200%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20a%20new%20local%3B%20the%20global%20count%20is%20untouched%0A%20%20%20%20return%20count%0A%0Adef%20describe%28items%29%3A%0A%20%20%20%20return%20len%28items%29%20%2B%20bump%28%29%20%20%23%20a%20call%20in%20the%20middle%20of%20another%20call%0A%0Aloud%20%3D%20add_excited%28greeting%29%0Acart%20%3D%20%5B%5D%0Aadd_item%28cart%2C%20%22milk%22%29%0An%20%3D%20bump%28%29%0Az%20%3D%20reset%28%29%0Asize%20%3D%20describe%28cart%29%0A&cumulative=false&curInstr=30&mode=display&origin=opt-frontend.js&primitivesAsObjects=true&py=311&rawInputLstJSON=%5B%5D&textReferences=false>) · [Edit](<https://pythontutor.com/visualize.html#code=count%20%3D%207%0Agreeting%20%3D%20%22hi%22%0A%0Adef%20add_excited%28word%29%3A%0A%20%20%20%20word%20%3D%20word%20%2B%20%22%21%22%20%20%20%20%20%20%20%20%20%20%20%23%20rebinds%20the%20local%3B%20greeting%20is%20untouched%0A%20%20%20%20return%20word%0A%0Adef%20add_item%28items%2C%20thing%29%3A%0A%20%20%20%20items.append%28thing%29%20%20%20%20%20%20%20%20%20%23%20changes%20the%20caller%27s%20list%0A%0Adef%20bump%28%29%3A%0A%20%20%20%20return%20count%20%2B%201%20%20%20%20%20%20%20%20%20%20%20%20%23%20count%20is%20not%20in%20this%20frame%3B%20found%20in%20the%20global%20frame%0A%0Adef%20reset%28%29%3A%0A%20%20%20%20count%20%3D%200%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20a%20new%20local%3B%20the%20global%20count%20is%20untouched%0A%20%20%20%20return%20count%0A%0Adef%20describe%28items%29%3A%0A%20%20%20%20return%20len%28items%29%20%2B%20bump%28%29%20%20%23%20a%20call%20in%20the%20middle%20of%20another%20call%0A%0Aloud%20%3D%20add_excited%28greeting%29%0Acart%20%3D%20%5B%5D%0Aadd_item%28cart%2C%20%22milk%22%29%0An%20%3D%20bump%28%29%0Az%20%3D%20reset%28%29%0Asize%20%3D%20describe%28cart%29%0A&cumulative=false&curInstr=0&mode=edit&origin=opt-frontend.js&primitivesAsObjects=true&py=311&rawInputLstJSON=%5B%5D&textReferences=false>)

```python
count = 7
greeting = "hi"

def add_excited(word):
    word = word + "!"           # rebinds the local; greeting is untouched
    return word

def add_item(items, thing):
    items.append(thing)         # changes the caller's list

def bump():
    return count + 1            # count is not in this frame; found in the global frame

def reset():
    count = 0                   # a new local; the global count is untouched
    return count

def describe(items):
    return len(items) + bump()  # a call in the middle of another call

loud = add_excited(greeting)
cart = []
add_item(cart, "milk")
n = bump()
z = reset()
size = describe(cart)
```

Watch for:

* Each `def` adds a function box on the right and a name in the global frame before anything is called (6).
* Every call adds a frame (9). The frame holds parameter names with arrows; parameters are variables (10).
* `add_excited`: `word` is rebound inside the frame; `greeting` still points at "hi" (4, 10).
* `add_item`: returns nothing, but the caller's list grew. Frames hold arrows, so the callee reached the caller's list (5).
* `bump`: `count` is not in its frame; Python looks in the global frame (11).
* `reset`: `count = 0` makes a local `count`; the global stays 7 (11). The classic bug.
* `describe` calls `bump`: two frames. `bump`'s frame vanishes and execution resumes mid-expression in `describe` (12).

Embed:

```html
<iframe width="800" height="500" frameborder="0" src="https://pythontutor.com/iframe-embed.html#code=count%20%3D%207%0Agreeting%20%3D%20%22hi%22%0A%0Adef%20add_excited%28word%29%3A%0A%20%20%20%20word%20%3D%20word%20%2B%20%22%21%22%20%20%20%20%20%20%20%20%20%20%20%23%20rebinds%20the%20local%3B%20greeting%20is%20untouched%0A%20%20%20%20return%20word%0A%0Adef%20add_item%28items%2C%20thing%29%3A%0A%20%20%20%20items.append%28thing%29%20%20%20%20%20%20%20%20%20%23%20changes%20the%20caller%27s%20list%0A%0Adef%20bump%28%29%3A%0A%20%20%20%20return%20count%20%2B%201%20%20%20%20%20%20%20%20%20%20%20%20%23%20count%20is%20not%20in%20this%20frame%3B%20found%20in%20the%20global%20frame%0A%0Adef%20reset%28%29%3A%0A%20%20%20%20count%20%3D%200%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20a%20new%20local%3B%20the%20global%20count%20is%20untouched%0A%20%20%20%20return%20count%0A%0Adef%20describe%28items%29%3A%0A%20%20%20%20return%20len%28items%29%20%2B%20bump%28%29%20%20%23%20a%20call%20in%20the%20middle%20of%20another%20call%0A%0Aloud%20%3D%20add_excited%28greeting%29%0Acart%20%3D%20%5B%5D%0Aadd_item%28cart%2C%20%22milk%22%29%0An%20%3D%20bump%28%29%0Az%20%3D%20reset%28%29%0Asize%20%3D%20describe%28cart%29%0A&codeDivHeight=400&codeDivWidth=350&curInstr=30&origin=opt-frontend.js&primitivesAsObjects=true&py=311"></iframe>
```

## 4. Code is data

Points 6, 9, 10. 27 steps.

[Run](<https://pythontutor.com/visualize.html#code=import%20math%0A%0Adef%20double%28x%29%3A%0A%20%20%20%20return%20x%20%2A%202%0A%0Adef%20square%28x%29%3A%0A%20%20%20%20return%20x%20%2A%20x%0A%0Adef%20apply%28fn%2C%20value%29%3A%0A%20%20%20%20return%20fn%28value%29%20%20%20%20%20%20%20%20%20%20%20%20%23%20fn%20is%20a%20parameter%3B%20its%20value%20is%20a%20function%0A%0Atwice%20%3D%20double%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20a%20second%20name%20for%20the%20same%20function%20object%0Asteps%20%3D%20%5Bdouble%2C%20square%2C%20math.sqrt%5D%0Aresults%20%3D%20%5B%5D%0Afor%20f%20in%20steps%3A%0A%20%20%20%20results.append%28f%289%29%29%0Abest%20%3D%20apply%28square%2C%204%29%0A&cumulative=false&curInstr=22&mode=display&origin=opt-frontend.js&primitivesAsObjects=true&py=311&rawInputLstJSON=%5B%5D&textReferences=false>) · [Edit](<https://pythontutor.com/visualize.html#code=import%20math%0A%0Adef%20double%28x%29%3A%0A%20%20%20%20return%20x%20%2A%202%0A%0Adef%20square%28x%29%3A%0A%20%20%20%20return%20x%20%2A%20x%0A%0Adef%20apply%28fn%2C%20value%29%3A%0A%20%20%20%20return%20fn%28value%29%20%20%20%20%20%20%20%20%20%20%20%20%23%20fn%20is%20a%20parameter%3B%20its%20value%20is%20a%20function%0A%0Atwice%20%3D%20double%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20a%20second%20name%20for%20the%20same%20function%20object%0Asteps%20%3D%20%5Bdouble%2C%20square%2C%20math.sqrt%5D%0Aresults%20%3D%20%5B%5D%0Afor%20f%20in%20steps%3A%0A%20%20%20%20results.append%28f%289%29%29%0Abest%20%3D%20apply%28square%2C%204%29%0A&cumulative=false&curInstr=0&mode=edit&origin=opt-frontend.js&primitivesAsObjects=true&py=311&rawInputLstJSON=%5B%5D&textReferences=false>)

```python
import math

def double(x):
    return x * 2

def square(x):
    return x * x

def apply(fn, value):
    return fn(value)            # fn is a parameter; its value is a function

twice = double                  # a second name for the same function object
steps = [double, square, math.sqrt]
results = []
for f in steps:
    results.append(f(9))
best = apply(square, 4)
```

Watch for:

* `import math` makes a "module instance" box: a library is a bag of names, like a frame you reach by dot.
* `def double` makes a function box; `twice = double` is a second arrow to the same box (6).
* `steps` is a list of three arrows to functions. `math.sqrt` shows as "imported function".
* In the `apply` frame, `fn` is an ordinary variable whose arrow points at `square` (6, 10).

Embed:

```html
<iframe width="800" height="500" frameborder="0" src="https://pythontutor.com/iframe-embed.html#code=import%20math%0A%0Adef%20double%28x%29%3A%0A%20%20%20%20return%20x%20%2A%202%0A%0Adef%20square%28x%29%3A%0A%20%20%20%20return%20x%20%2A%20x%0A%0Adef%20apply%28fn%2C%20value%29%3A%0A%20%20%20%20return%20fn%28value%29%20%20%20%20%20%20%20%20%20%20%20%20%23%20fn%20is%20a%20parameter%3B%20its%20value%20is%20a%20function%0A%0Atwice%20%3D%20double%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20a%20second%20name%20for%20the%20same%20function%20object%0Asteps%20%3D%20%5Bdouble%2C%20square%2C%20math.sqrt%5D%0Aresults%20%3D%20%5B%5D%0Afor%20f%20in%20steps%3A%0A%20%20%20%20results.append%28f%289%29%29%0Abest%20%3D%20apply%28square%2C%204%29%0A&codeDivHeight=400&codeDivWidth=350&curInstr=22&origin=opt-frontend.js&primitivesAsObjects=true&py=311"></iframe>
```

## 5. The stack in motion

Points 8, 9, 10, 11, 12. 87 steps.

[Run](<https://pythontutor.com/visualize.html#code=seen%20%3D%20%7B%7D%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20remembered%20answers%3A%20stones%20-%3E%20can%20the%20mover%20win%3F%0A%0Adef%20can_win%28stones%29%3A%0A%20%20%20%20if%20stones%20%3D%3D%200%3A%0A%20%20%20%20%20%20%20%20return%20False%20%20%20%20%20%20%20%20%20%20%20%20%23%20nothing%20left%20to%20take%3A%20the%20mover%20has%20lost%0A%20%20%20%20if%20stones%20in%20seen%3A%0A%20%20%20%20%20%20%20%20return%20seen%5Bstones%5D%0A%20%20%20%20answer%20%3D%20False%0A%20%20%20%20for%20take%20in%20%281%2C%202%29%3A%0A%20%20%20%20%20%20%20%20left%20%3D%20stones%20-%20take%0A%20%20%20%20%20%20%20%20if%20left%20%3E%3D%200%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20not%20can_win%28left%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20answer%20%3D%20True%20%20%20%23%20a%20move%20that%20leaves%20the%20other%20player%20losing%0A%20%20%20%20seen%5Bstones%5D%20%3D%20answer%0A%20%20%20%20return%20answer%0A%0Aresult%20%3D%20can_win%284%29%0A&cumulative=false&curInstr=31&mode=display&origin=opt-frontend.js&primitivesAsObjects=true&py=311&rawInputLstJSON=%5B%5D&textReferences=false>) · [Edit](<https://pythontutor.com/visualize.html#code=seen%20%3D%20%7B%7D%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20remembered%20answers%3A%20stones%20-%3E%20can%20the%20mover%20win%3F%0A%0Adef%20can_win%28stones%29%3A%0A%20%20%20%20if%20stones%20%3D%3D%200%3A%0A%20%20%20%20%20%20%20%20return%20False%20%20%20%20%20%20%20%20%20%20%20%20%23%20nothing%20left%20to%20take%3A%20the%20mover%20has%20lost%0A%20%20%20%20if%20stones%20in%20seen%3A%0A%20%20%20%20%20%20%20%20return%20seen%5Bstones%5D%0A%20%20%20%20answer%20%3D%20False%0A%20%20%20%20for%20take%20in%20%281%2C%202%29%3A%0A%20%20%20%20%20%20%20%20left%20%3D%20stones%20-%20take%0A%20%20%20%20%20%20%20%20if%20left%20%3E%3D%200%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20not%20can_win%28left%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20answer%20%3D%20True%20%20%20%23%20a%20move%20that%20leaves%20the%20other%20player%20losing%0A%20%20%20%20seen%5Bstones%5D%20%3D%20answer%0A%20%20%20%20return%20answer%0A%0Aresult%20%3D%20can_win%284%29%0A&cumulative=false&curInstr=0&mode=edit&origin=opt-frontend.js&primitivesAsObjects=true&py=311&rawInputLstJSON=%5B%5D&textReferences=false>)

```python
seen = {}                       # remembered answers: stones -> can the mover win?

def can_win(stones):
    if stones == 0:
        return False            # nothing left to take: the mover has lost
    if stones in seen:
        return seen[stones]
    answer = False
    for take in (1, 2):
        left = stones - take
        if left >= 0:
            if not can_win(left):
                answer = True   # a move that leaves the other player losing
    seen[stones] = answer
    return answer

result = can_win(4)
```

Watch for:

* Step 31: three `can_win` frames, each with its own `stones`, `take`, `left`, `answer` (9, 10). Same code, separate variables.
* `seen` and `can_win` are not in any `can_win` frame; found in the global frame (11).
* Returns unwind: a frame disappears and its value drops into `if not can_win(left)` in the frame below (12).
* `if` and `for` choose the next instruction (8). Frames stacking and unstacking is the game tree being walked.
* Nim, take 1 or 2, start with 4. The mover wins by taking 1. `seen` is memoisation; it also keeps the step count small.

Embed:

```html
<iframe width="800" height="500" frameborder="0" src="https://pythontutor.com/iframe-embed.html#code=seen%20%3D%20%7B%7D%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20remembered%20answers%3A%20stones%20-%3E%20can%20the%20mover%20win%3F%0A%0Adef%20can_win%28stones%29%3A%0A%20%20%20%20if%20stones%20%3D%3D%200%3A%0A%20%20%20%20%20%20%20%20return%20False%20%20%20%20%20%20%20%20%20%20%20%20%23%20nothing%20left%20to%20take%3A%20the%20mover%20has%20lost%0A%20%20%20%20if%20stones%20in%20seen%3A%0A%20%20%20%20%20%20%20%20return%20seen%5Bstones%5D%0A%20%20%20%20answer%20%3D%20False%0A%20%20%20%20for%20take%20in%20%281%2C%202%29%3A%0A%20%20%20%20%20%20%20%20left%20%3D%20stones%20-%20take%0A%20%20%20%20%20%20%20%20if%20left%20%3E%3D%200%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20not%20can_win%28left%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20answer%20%3D%20True%20%20%20%23%20a%20move%20that%20leaves%20the%20other%20player%20losing%0A%20%20%20%20seen%5Bstones%5D%20%3D%20answer%0A%20%20%20%20return%20answer%0A%0Aresult%20%3D%20can_win%284%29%0A&codeDivHeight=400&codeDivWidth=350&curInstr=31&origin=opt-frontend.js&primitivesAsObjects=true&py=311"></iframe>
```

## Guo's own list

[pythontutor.com/articles/python-visualizer.html](https://pythontutor.com/articles/python-visualizer.html): about 15 programs. Loop with conditional, `input()`, checkout/tax functions, list aliasing, list mutation through a function, dict counter, nested `s['scores'][0]`, matrix, class and instances, inheritance, recursive factorial, exceptions, closures, generators, lambda and sort.

* Covers 5, 8, 9, 10, 12 well. His aliasing and mutation-through-function programs are the same idea as mine.
* Does not target 2, 3, 4, 6, 11. His links use the default inline rendering, so ints live in the frame. No program shows a string method leaving the string alone, a local shadowing a global, a function assigned or passed, or a module.
* Against your five headings: 1-3 yes; "Files, network, scraping" no (Python Tutor cannot); "Storage, games" no (factorial is the only recursion).
* Closures, generators, inheritance, lambda are outside your syllabus.
* The tool's own Examples dropdown has 45 Python programs. The "Pointer Aliasing" group (aliasing1-8) is the one worth mining for point 5.

## Existing sets online

Nobody has published a Python Tutor set built to the 12 points. Teaching Tech Together, the source of the list, links no programs. Closest raw material:

* [CS Circles](https://cscircles.cemc.uwaterloo.ca/) (Waterloo; Pritchard and Vasiga) -- a beginner course with Python Tutor embedded in most lessons. The useful ones: [11B How functions work](https://cscircles.cemc.uwaterloo.ca/11b-how-functions-work/) (three embeds: a local shadowing a global, a parameter rebound inside a function, `global`), [13 Lists](https://cscircles.cemc.uwaterloo.ca/13-lists/) (in-place mutation in a loop), [16 Recursion](https://cscircles.cemc.uwaterloo.ca/16-recursion/) (countdown; runaway recursion filling memory), [17 Is](https://cscircles.cemc.uwaterloo.ca/17-is/) (the `newSize = oldSize` aliasing bug). Old Python Tutor fork, default rendering. Points 3, 4, 5, 9, 10, 11, 12.
* Ned Batchelder's [names and values](https://nedbatchelder.com/text/names.html) essay has two Python Tutor links: `augment_twice` (append inside a function, caller sees it) and `augment_twice_bad` (`a_list = a_list + [...]`, caller does not). The sharpest minimal pair found. Links are `py=2`; the code runs under 3.
* Guo's SIGCSE 2013 paper ([PDF](https://pg.ucsd.edu/publications/Online-Python-Tutor-web-based-program-visualization_SIGCSE-2013.pdf)) shows a recursive linked-list sum with four frames, and list/tuple/set/dict side by side. Figures, not a set.
* Runestone's "How to Think Like a Computer Scientist" embeds Python Tutor as CodeLens (aliasing section, "Visualizing recursion" section). Not fetched; Cloudflare challenge.
* Not Python Tutor: [notionalmachines.github.io](https://notionalmachines.github.io/notional-machines.html) (Dagstuhl catalog; a "Python Computer" slide model and a recursion-demo entry with no program), Toronto CSC110's memory model (static diagrams plus their own MemoryViz), Sorva's UUhistle. composingprograms.com dropped its Python Tutor embeds in the current edition.
