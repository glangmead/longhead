# Class 6: the menu

Ask the group to pick. There is room for **two, maybe three** of these in one
session, and the choice should be theirs — by this point they'll have a much
better sense of what they actually want than we did in week one.

Each entry below is written so it can be handed straight to a student: a
one-line pitch, what they'd be able to do afterwards, and a prompt they can
run immediately.

Suggested ballot mechanics: everyone gets three votes, one of which must go to
something they'd never have picked in week one. Read the menu aloud first —
half of these are things a non-coder has heard of but has never had explained.

---

## Group A — "the same loop, but a thousand times faster"

### 1. NumPy
**The pitch.** Every loop over numbers you've written this term is slow, and
there is one line that replaces it.
**Afterwards.** You can do arithmetic on a million numbers at once, and you
know why images, sound and neural networks are all secretly the same object.
**Prompt.**
> I know Python lists and loops. Show me the same calculation — the average
> of a million numbers, then scaling all of them by 1.5 — written as a loop
> and written with NumPy, with timings for both. Then explain what an "array"
> is that a list isn't, and what "vectorised" means, using my example.

### 2. Pandas
**The pitch.** A spreadsheet you can program, and the tool that actually gets
used for the boring parts of most real jobs.
**Afterwards.** You can load a CSV, filter it, group it and chart it in five
lines, and you understand what a DataFrame is.
**Prompt.**
> Here's my `library.csv` from the files lesson. Show me pandas doing the
> things I did by hand: load it, filter, sort, group by author, add a computed
> column, and save it back. Put my hand-written version next to the pandas
> version line for line.

*Note: A and B pair naturally. Pandas alone is the most immediately useful
thing on this menu for most people.*

---

## Group B — "what is actually going on inside AI"

### 3. A neural network from scratch, then PyTorch
**The pitch.** Build one that learns something, in about forty lines, with no
libraries. Then see PyTorch do the same thing and understand what it took away.
**Afterwards.** "Training" stops being a metaphor. You've seen the loop.
**Prompt.**
> Write a neural network from scratch in pure Python — no NumPy — that learns
> XOR. Show the loss going down as it trains. Keep it under 60 lines and
> comment every line of the training loop. Then write the same thing in
> PyTorch and tell me exactly which of my lines each PyTorch line replaced.

### 4. Calling an LLM from your own code
**The pitch.** Everything we've done this term, but the assistant is now
*inside* your program instead of in a chat window.
**Afterwards.** You can build a thing that summarises, classifies or extracts
— and you know why API keys are passwords and what a token costs.
**Prompt.**
> Write a Python script that reads my `library.csv` and asks Claude for a
> one-sentence pitch for each book. Show me how to keep the API key out of the
> code, how to handle the request failing, and how to work out what this will
> cost before I run it on 500 rows.

*This is the reflexive one: the course's own subject matter, in code. It's the
option most likely to change what someone does at work next week.*

---

## Group C — "make it a real thing other people can use"

### 5. A web app
**The pitch.** Your script gets a URL, and other people can use it without
installing Python.
**Afterwards.** You know what a route, a request handler and a template are,
and the frontend/backend picture from Class 1 has real code under it.
**Prompt.**
> Turn my book library script into a small FastAPI web app: a page listing the
> books, a form to add one, and the data in the SQLite database I already
> built. Explain what each part does in terms of the restaurant analogy —
> which bits are dining room and which are kitchen.

### 6. Packaging and sharing
**The pitch.** The difference between "it works on my machine" and something
you can send to a colleague.
**Afterwards.** You can hand someone a program that runs.
**Prompt.**
> I have a folder of Python scripts. Walk me through turning it into something
> a non-programmer colleague can install and run, on both Mac and Windows.
> Tell me what a virtual environment is and why every tutorial starts with one.

### 7. A command-line tool
**The pitch.** `books --author "Powers" --unread` instead of editing the code
each time you want a different answer.
**Afterwards.** You understand every command-line tool you've ever been told
to run.
**Prompt.**
> Turn my book library script into a proper command-line tool with argparse:
> options for filtering, sorting and output format, plus `--help`. Show me the
> before and after, and explain what argparse gave me that `input()` didn't.

---

## Group D — "how do you know it works?"

### 8. Testing
**The pitch.** The one thing you cannot outsource to an AI is checking that
the code does what you wanted.
**Afterwards.** You can write a test, and — more usefully — you can ask an
assistant for tests and tell a good one from a useless one.
**Prompt.**
> Write pytest tests for my `pages_per_dollar` and `best_value` functions,
> including the awkward cases. Then deliberately break one function and show
> me what a failing test looks like. Which of these tests would have caught a
> bug I actually made?

### 9. Debugging properly
**The pitch.** Stop the program in the middle and look around, instead of
adding `print()` everywhere.
**Afterwards.** You can read a traceback fluently and use a real debugger.
**Prompt.**
> Here's a program with three bugs: one crashes, one gives a wrong answer
> silently, and one only fails on certain input. Don't fix them. Walk me
> through finding each one with the debugger, and tell me which kind is
> the most dangerous and why.

---

## Group E — "the ideas, not the tools"

### 10. Why some programs take forever
**The pitch.** We counted 549,946 tic-tac-toe positions in half a second and
said chess has 10^45. This is the gap between those two sentences.
**Afterwards.** You can look at a loop inside a loop and know what it will cost.
**Prompt.**
> Using the tic-tac-toe program from Class 5: show me searching a list versus
> searching a dictionary, at 100, 10,000 and 1,000,000 items, with timings.
> Then explain Big-O notation using only those numbers. No maths I haven't
> already seen on screen.

### 11. SymPy — algebra that doesn't round
**The pitch.** `0.1 + 0.2 != 0.3` was a lie the float told us. SymPy doesn't
lie; it does algebra the way a person does, with symbols.
**Afterwards.** You can solve, differentiate and simplify exactly, and you
understand the difference between a number and an expression.
**Prompt.**
> Show me SymPy doing things floats can't: exact 1/3, solving an equation
> symbolically, and simplifying an expression. Contrast each with the float
> version, and tell me when I'd reach for SymPy over a calculator.

### 12. Regular expressions
**The pitch.** A tiny, hostile, extremely powerful language for finding
patterns in text. You will meet it whether you choose it or not.
**Afterwards.** You can read the ones an AI writes for you, which is the
realistic goal.
**Prompt.**
> Teach me regular expressions by building one up a piece at a time to find
> dates in messy text, showing what each addition changes. Then give me three
> regexes an AI might hand me and ask me to say what they do.

---

## Two that aren't on the ballot but should be mentioned

**Where your secrets go.** Not a topic, a five-minute warning that belongs
somewhere in Class 6 regardless of the vote: API keys, `.env` files,
`.gitignore`, what happens when a key lands on GitHub, and why you don't paste
a customer list into a chat window. It's the highest-consequence thing on this
page and takes the least time.

**Reading someone else's codebase.** Also five minutes, also regardless of the
vote: open [the CPython repository](https://github.com/python/cpython) — the
Python they've been running all term is *written down*, and mostly in Python.
Find `Lib/csv.py`, the module from Class 4, and read the top of it. The point
isn't to understand it. The point is that there's no floor below which it
stops being code somebody wrote.

---

## If nobody has a preference

Pandas (2) and calling an LLM from code (4). The first is the one most likely
to be useful at work on Monday; the second is the one that makes the whole
course reflexive — using an AI to write code that uses an AI. Both build
directly on the files and network lessons they've already done.
