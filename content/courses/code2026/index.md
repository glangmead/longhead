---
title: "code2026"
subtitle: "Resources for learning to code with the help of AI in 2026"
summary: "Links and materials for a course on learning to code with the help of AI in 2026"
authors: []
tags: []
categories: []
date: 2026-08-19T08:36:26-04:00
lastmod: 2026-08-22T12:00:00-04:00
featured: false
draft: false
image:
  caption: ""
  focal_point: ""
  preview_only: false
projects: []
---

This is a resource for someone wanting to learn how to code (with the help of AI) from scratch. It has three parts, which aren't in any order.

1. To understand code, you need to understand a little about how computers work, and about the abstract **notional machine** that the programming language targets. It's a model of how computer programs execute, and it's what you're talking to when you code. This extra material is not usually included in coding classes, but it's the wax-on-wax-off portion that will make you the Karate Kid.

2. You need to learn a specific language, in this case python. You need to look at the code the agent writes, so we'll focus on *reading* code moreso than *writing*.

3. You need to know what to ask the agent for. You need to know what kinds of software there are, such as web sites and apps. You need to look more closely at the ones you use every day and see what all their ingredients are, what screens they have. You need to know when you need a database. You need to know about security and privacy. You need to know about app stores.

Then you'll be an expert!

## The Computer

### Addition circuits

Computers add numbers together by putting two simple electrical circuits together. It's a trick, to cause hardware to do something we can call "adding numbers." I hope this can demystify a lot.

* [Adders: circuits that add numbers](https://en.wikipedia.org/wiki/Adder_(electronics))
* [Video on said circuits](https://www.youtube.com/watch?v=ecn-8iGDRSo)

Additional resources about this idea

* [NandGame](https://nandgame.com/): a game where you build from a NAND gate up through a half adder, full adder, even a CPU.
* [Logic Gate Simulator](https://academo.org/demos/logic-gate-simulator/): drag-and-drop AND/OR/XOR with truth tables.
* Crash Course Computer Science [#3 Boolean Logic & Logic Gates](https://www.youtube.com/watch?v=gI-qXk7XojA), [#5 How Computers Calculate: the ALU](https://www.youtube.com/watch?v=1I5ZMmrOfnA) (builds an adder).
* [Exploring How Computers Work](https://www.youtube.com/watch?v=QZwneRb-zqA) (Sebastian Lague): animated, transistors to gates to an adder.
* [Logic gate](https://en.wikipedia.org/wiki/Logic_gate) (Wikipedia; scroll to "Symbols"), [Binary number](https://en.wikipedia.org/wiki/Binary_number) (Wikipedia; table at top).
* Ben Eater: [Making logic gates from transistors](https://www.youtube.com/watch?v=sTu3LwpF6XI) (13 min), [the ALU](https://eater.net/8bit/alu) (the "Binary addition" video, 14 min), using breadboards.

### Computer organization

* Crash Course Computer Science [#6 Registers and RAM](https://www.youtube.com/watch?v=fpnE6UAfbtU), [#7 The CPU](https://www.youtube.com/watch?v=FZGugFqdr60), [#8 Instructions & Programs](https://www.youtube.com/watch?v=zltgXvg6r3k): 11 min each; fetch-decode-execute on screen. (#5, the ALU, is under Class 1.)
* Technically glossary: [CPU](https://technically.dev/universe/cpu-processor), [RAM](https://technically.dev/universe/ram-memory), [disk/SSD](https://technically.dev/universe/disk-ssd-hdd), [binary](https://technically.dev/universe/binary), [operating system](https://technically.dev/universe/operating-system), [kernel](https://technically.dev/universe/kernel).
* [Central processing unit](https://en.wikipedia.org/wiki/Central_processing_unit) (Wikipedia; "Operation" section names the instruction cycle), [Von Neumann architecture](https://en.wikipedia.org/wiki/Von_Neumann_architecture) (Wikipedia; diagram at top: instructions and data share one memory).
* [Little Man Computer](https://peterhigginson.co.uk/lmc/) (Peter Higginson simulator): watch a program run one instruction at a time. Retro UI. [Wikipedia page](https://en.wikipedia.org/wiki/Little_man_computer) has the mailroom metaphor.
* [Build an 8-bit computer](https://eater.net/8bit) (Ben Eater): going deeper; registers, RAM, program counter, bus, each as a breadboard module.
* Already in Notes: Code.org "How Computers Work" playlist fits here.

### The apps that run our code

* [The github repository of python itself](https://github.com/python/cpython)
* [The python Wikipedia page](https://en.wikipedia.org/wiki/CPython)
* [Read-eval-print loop](https://en.wikipedia.org/wiki/Read%E2%80%93eval%E2%80%93print_loop)
* [What is JavaScript?](https://developer.mozilla.org/en-US/docs/Learn_web_development/Core/Scripting/What_is_JavaScript) (MDN): the browser is the runtime.
* [Integrated development environment](https://en.wikipedia.org/wiki/Integrated_development_environment)
* [Shell (computing)](https://en.wikipedia.org/wiki/Shell_(computing))
* [Xcode](https://en.wikipedia.org/wiki/Xcode) (Wikipedia): references.
* Technically glossary: [runtime](https://technically.dev/universe/runtime), [terminal](https://technically.dev/universe/terminal), [macOS/Windows/Linux](https://technically.dev/universe/macos-windows-linux), [iOS/Android](https://technically.dev/universe/ios-android).
* [The Unix Shell](https://swcarpentry.github.io/shell-novice/) (Software Carpentry), episodes 1-2: what a file, directory, path, and command are.

### The notional machine

* [Call stack](https://en.wikipedia.org/wiki/Call_stack) (Wikipedia)

### Theory of programming languages

* [A Map of the Territory](https://craftinginterpreters.com/a-map-of-the-territory.html)
* [Abstract syntax tree](https://en.wikipedia.org/wiki/Abstract_syntax_tree)
* [Type system](https://en.wikipedia.org/wiki/Type_system)
* [Turing completeness](https://en.wikipedia.org/wiki/Turing_completeness)
* The dichotomy: [Syntax (programming languages)](https://en.wikipedia.org/wiki/Syntax_(programming_languages)), [Semantics (computer science)](https://en.wikipedia.org/wiki/Semantics_(computer_science))

<hr />

## Python

### Arithmetic, loops, lists

* kinds of values: boolean, integer, floating point
* add, subtract, multiply, divide, modulus (remainder)
* for loop
* lists, concatenation, appending, indexing, changing, length, membership test, looping, sorting

**Links**

* [Python tutor visualizer](https://pythontutor.com/member.html)
* [Python cheat sheets](https://ehmatthes.github.io/pcc_3e/cheat_sheets/)
* [Jupyter everywhere](https://jupytereverywhere.org)
* Practical Python Programming: [numbers](https://dabeaz-course.github.io/practical-python/Notes/01_Introduction/03_Numbers.html), [lists](https://dabeaz-course.github.io/practical-python/Notes/01_Introduction/05_Lists.html)
* [A little about why](https://docs.python.org/3/tutorial/floatingpoint.html) floating point numbers behave unexpectedly

<hr />

## Software and the prompting of

### Front end, back end

* [Frontends + Backends](https://read.technically.dev/p/software-eng-vibe-coders-frontends-backends)  restaurant analogy (dining room = frontend, kitchen = 
* Technically glossary: [frontend](https://technically.dev/universe/frontend), [backend](https://technically.dev/universe/backend), [database](https://technically.dev/universe/database), [API](https://technically.dev/universe/api), [server](https://technically.dev/universe/server), [client](https://technically.dev/universe/client)
* [What's an API?](https://read.technically.dev/p/whats-an-api) "like drive-thru windows, but in code."
* [Front end and back end on Wikipedia](https://en.wikipedia.org/wiki/Frontend_and_backend)
* [Web apps vs native apps vs hybrid apps](https://aws.amazon.com/compare/the-difference-between-web-apps-native-apps-and-hybrid-apps/) (AWS): basic lingo.

### Information architecture: how to present information

* [Mobbin flow](https://mobbin.com/apps/flighty-ios-e6531374-23b5-4b62-9e1c-5ec41d351780/812571a1-c341-471e-9dc4-26b0fa92720a/screens): see many, many screens from apps.
* [How to Make Sense of Any Mess](https://abbycovert.com/make-sense/) (Abby Covert; full text free): information architecture: "the way we arrange the parts of something to make it understandable."

### Databases

* [Software Eng for Vibe Coders: Databases + Storage](https://read.technically.dev/p/software-eng-for-vibe-coders-databases) (Technically): part 2 of the series you already link. "Like a spreadsheet, except with more rules." Free.
* [The Beginner's Guide to Databases](https://technically.dev/posts/the-beginners-guide-to-databases) (Technically): baking-ingredients metaphor.
* [SQL for the rest of us](https://technically.dev/posts/sql-for-the-rest-of-us) (Technically): SQL as "say what you want".
* Technically glossary: [relational database](https://technically.dev/universe/relational-database), [SQL](https://technically.dev/universe/sql), [query](https://technically.dev/universe/query), [schema](https://technically.dev/universe/schema).
* [Relational database on Wikipedia](https://en.wikipedia.org/wiki/Relational_database): super interesting, obvious in retrospect.
* Automate the Boring Stuff, 3rd ed.: [SQLite Databases](https://automatetheboringstuff.com/3e/chapter16.html).

### git

* [What's version control and GitHub?](https://technically.dev/posts/whats-version-control-and-github) (Technically): `presentation_final_final_2.pptx` analogy.
* Glossary: [version control](https://technically.dev/universe/version-control), [branch](https://technically.dev/universe/branch), [pull request](https://technically.dev/universe/pull-request), [merging](https://technically.dev/universe/merging).
* [About Git](https://docs.github.com/en/get-started/using-git/about-git) (GitHub docs)
* [Hello World](https://docs.github.com/get-started/quickstart/hello-world) (GitHub quickstart): repo, branch, commit, pull request by clicking.
* [Learn Git Branching](https://learngitbranching.js.org/): interactive; commits and branches drawn as a tree.
* [Oh Shit, Git!?!](https://ohshitgit.com/) (Katie Sylor-Miller): for after your first mistake, shows history is recoverable. Clean-language copy at [dangitgit.com](https://dangitgit.com/).
* [git cheat sheet](https://wizardzines.com/comics/git-cheat-sheet/) (Julia Evans comic): one page, poster-style.
* [Git on Wikipedia](https://en.wikipedia.org/wiki/Git)

### Specs

It remains to be seen if we need to retain this paradigm exactly, but everything here needs to reappear somewhere in the prompt-based development cycle, even if it's in your head. Learn from your elders!

* Joel Spolsky, Painless Functional Specifications: [Part 1, Why Bother?](https://www.joelonsoftware.com/2000/10/02/painless-functional-specifications-part-1-why-bother/), [Part 2, What's a Spec?](https://www.joelonsoftware.com/2000/10/03/painless-functional-specifications-part-2-whats-a-spec/): part 2 links a sample spec (WhatTimeIsIt).
* [User story](https://en.wikipedia.org/wiki/User_story) (Wikipedia): "As a ..., I want ..., so that ..." template.
* [Software requirements specification](https://en.wikipedia.org/wiki/Software_requirements_specification), [Product requirements document](https://en.wikipedia.org/wiki/Product_requirements_document) (Wikipedia): references.
* [How to Design Programs](https://htdp.org/): the design recipe: problem, signature, examples, body, tests.

### QA

This is your job now. The agent can build software but you have test it and find bugs and crashes.

* [List of famous software bugs](https://en.wikipedia.org/wiki/List_of_software_bugs) (Wikipedia): Ariane 5, Therac-25, Mars Climate Orbiter stories.
* Willison, [Here's how I use LLMs to help me write code](https://simonwillison.net/2025/Mar/11/using-llms-for-code/): "the one thing you absolutely cannot outsource to the machine is testing." The Atomic Object post on the same point assumes TDD jargon; skipped.
* [Errors and Exceptions](https://docs.python.org/3/tutorial/errors.html) (official tutorial): a traceback example and how to read it.
* Automate the Boring Stuff, 3rd ed.: [Debugging](https://automatetheboringstuff.com/3e/chapter5.html): tracebacks, assertions, the debugger.
* [How I got better at debugging](https://wizardzines.com/comics/better-at-debugging/) (Julia Evans comic): "it's never magic."
* [Debugging](https://technically.dev/universe/debugging) (Technically glossary)
* [pytest: Get Started](https://docs.pytest.org/en/stable/getting-started.html): the 4-line first test.
* [Software testing](https://en.wikipedia.org/wiki/Software_testing), [Unit testing](https://en.wikipedia.org/wiki/Unit_testing), [Software bug](https://en.wikipedia.org/wiki/Software_bug) (Wikipedia): references.
* [Rubber duck debugging](https://en.wikipedia.org/wiki/Rubber_duck_debugging) (Wikipedia)

### Functions, variables

### Dictionaries, objects, libraries

### Files, network, scraping

### Storage, games (and game state trees)

### Security and privacy

* Do not store secrets, i.e. your, the developer's, own passwords and access keys (or, even scarier, those of your employer).
  * **Uber, 2014.** An engineer put an Amazon web services (AWS) access key into code he published in a public repository. Someone used it to download a file with 100,000+ drivers' names and licence numbers. Sources: [FTC revised complaint (PDF)](https://www.ftc.gov/system/files/documents/cases/152_3054_c-4662_uber_technologies_revised_complaint.pdf), [FTC analysis of proposed order](https://www.ftc.gov/system/files/documents/cases/1523054_uber_technologies_revised_analysis.pdf).
  * **A solo developer, 2015.** Pushed AWS keys to GitHub, noticed, deleted them
  about five minutes later. A bot had already taken them and started ~140 EC2
  instances mining Bitcoin, and the dev was charged $2,375. Sources: [The Register](https://www.theregister.com/2015/01/06/dev_blunder_shows_github_crawling_with_keyslurping_bots), [Slashdot discussion](https://it.slashdot.org/story/15/01/02/2342228/bots-scanning-github-to-steal-amazon-ec2-keys).
* Having users log in to your site is a big responsibility.
  * **Adobe, 2013: 153 million accounts.** The passwords were *encrypted*, not
  hashed, which produces identical output for identical input. So every user with the password `123456` had the same ciphertext. The dump also included every user's plaintext password hint. Sources: [Schneier, "Cryptographic Blunders Revealed by Adobe's Password Leak"](https://www.schneier.com/blog/archives/2013/11/cryptographic_b.html), [CSO Online: encrypted, not hashed](https://www.csoonline.com/article/540070/network-security-adobe-confirms-stolen-passwords-were-encrypted-not-hashed.html), [Have I Been Pwned record](https://haveibeenpwned.com/Breach/Adobe), [XKCD 1286](https://xkcd.com/1286/).
  * **RockYou, 2009: 32.6 million passwords in plain text.** Breached by SQL
  injection (explained in the comic below). Sources: [TechCrunch (2009)](https://techcrunch.com/2009/12/14/rockyou-hacked/), [Help Net Security, on the SQL injection](https://www.helpnetsecurity.com/2009/12/14/serious-sql-flaw-could-have-compromised-millions-of-rockyoucom-users/). <br/> <a href="https://xkcd.com/327/"><img src="https://imgs.xkcd.com/comics/exploits_of_a_mom.png" width="500" /></a>
  * **Facebook 2019, and Twitter and GitHub in 2018.** Passwords written to
  internal log files in plain text before the hashing step. Three of the largest engineering organisations on the planet. Sources: [Krebs on Security](https://krebsonsecurity.com/2019/03/facebook-stored-hundreds-of-millions-of-user-passwords-in-plain-text-for-years/), [TechCrunch](https://techcrunch.com/2019/03/21/facebook-plaintext-passwords/), [BleepingComputer, on Twitter and GitHub](https://www.bleepingcomputer.com/news/security/twitter-admits-recording-plaintext-passwords-in-internal-logs-just-like-github/).
* Storing images is a big responsibility.
  * **Tea, July 2025: 72,000 images including 13,000 selfies and photo IDs.** An
  app for women's dating safety required a selfie plus a government ID. The images
  were stored in a cloud storage bucket with no authentication; anyone with the URL could list and download everything. Sources: [American Bar Association technical and legal analysis](https://www.americanbar.org/groups/intellectual_property_law/resources/newsletters/cloud-misconfiguration-private-right-of-action-tea-app-data-breach/), [Engadget](https://www.engadget.com/cybersecurity/tea-app-suffers-breach-exposing-thousands-of-user-images-190731414.html).
* Using third party libraries in your web app is a commitment to applying vulnerability patches forever.
  * **Equifax, 2017: 147.9 million people.** An Apache
  Struts security patch was published on March 7. An internal notice went out on March 9. A
  scan on March 15 failed to find the affected system. Attackers got in in May and
  were not noticed until July 29. The fix was only to run `pip install pip-audit && pip-audit`. Sources: [GAO-18-559 (PDF)](https://www.gao.gov/assets/gao-18-559.pdf), [House Oversight report (PDF)](https://oversight.house.gov/wp-content/uploads/2018/12/Equifax-Report.pdf).

# Backup notes

<hr />

## Coding

* [Practical Python Programming](https://dabeaz-course.github.io/practical-python/Notes/Contents.html)
* [Python tutor visualizer](https://pythontutor.com/member.html?glangmead@gmail.com)
  * [Examples](https://pythontutor.com/articles/python-visualizer.html)
* [Jupyter everywhere](https://jupytereverywhere.org)

### Overviews

* [How Computers Work](https://www.youtube.com/playlist?list=PLzdnOPI1iJNcsRwJhvksEo1tJqjIqWbN-): playlist of 5 5-minute videos.
* [How the Internet Works](https://www.youtube.com/playlist?list=PLzdnOPI1iJNfMRZm5DDxco3UdsFegvuB7): playlist of 6 7-minute videos.
* [Software Engineering for Vibe Coders: Frontends + Backends](https://read.technically.dev/p/software-eng-vibe-coders-frontends-backends)  restaurant analogy (dining room = frontend, kitchen = backend/API/database). Part 1 of a 6-part series.
* [What happens when you type google.com](https://github.com/alex/what-happens-when): the exhaustive answer, keypress to pixels.
* [Mobbin flow](https://mobbin.com/apps/flighty-ios-e6531374-23b5-4b62-9e1c-5ec41d351780/812571a1-c341-471e-9dc4-26b0fa92720a/screens): see many, many screens from apps.
* [Apple Accessibility Inspector](https://developer.apple.com/documentation/accessibility/accessibility-inspector)
* [How to Make Sense of Any Mess](https://abbycovert.com/make-sense/) (Abby Covert; full text free): information architecture: "the way we arrange the parts of something to make it understandable."
* [Web apps vs native apps vs hybrid apps](https://aws.amazon.com/compare/the-difference-between-web-apps-native-apps-and-hybrid-apps/) (AWS): basic lingo.
* [Introduction to Web Development](https://www.theodinproject.com/lessons/foundations-introduction-to-web-development) (The Odin Project): another high level overview.
* [Margaret Hamilton](https://en.wikipedia.org/wiki/Margaret_Hamilton_(software_engineer)) ![](/img/margaret_hamilton.jpg)

### Building apps

* [Apple's iOS Pathway](https://developer.apple.com/ios/get-started/)
* [Apple developer Pathway](https://developer.apple.com/pathways/developer/): steps to ship an app
* [100 Days of SwiftUI](https://www.hackingwithswift.com/100/swiftui): I used this.
* [Swift Playgrounds](https://developer.apple.com/swift-playground/): build a real SwiftUI app with live preview on iPad or Mac, no Xcode. The only zero-setup on-ramp for mobile.
* [Unwrap: Learn Swift on your iPad](https://apps.apple.com/us/app/unwrap/id1440611372
Unwrap)

### Building web sites

* [Reddit thread about what to use in 2026](https://www.reddit.com/r/webdevelopment/comments/1smfe68/whats_your_preferred_way_of_building_websites_for/)
* [Next.js on Wikipedia](https://en.wikipedia.org/wiki/Next.js): understanding what this entry is saying about rendering on the server versus in the browser is an excellent goal.
* [Reddit thread about building a custom CRM with a floating chat window](https://www.reddit.com/r/nextjs/comments/1mgo7on/built_an_internal_crm_with_nextjs_for_my_company/): I just want to share how people talk about these things.

### Building terminal programs

* [Roguelike dungeon-crawl tutorial in Rust](https://bfnightly.bracketproductions.com/rustbook/)


## AI for coding

* [Not all AI-assisted programming is vibe coding](https://simonwillison.net/2025/Mar/19/vibe-coding/) (Simon Willison): low stakes only, watch secrets and data privacy, set billing limits, get a review.
* [Learn AI-Assisted Python Programming, 2nd ed.](https://www.manning.com/books/learn-ai-assisted-python-programming-second-edition) 

## Pedagogy

* [Teaching Tech Together](https://teachtogether.tech/en/)
* [Teachcomputing](https://teachcomputing.org/pedagogy)
* [CS teaching tips](https://www.csteachingtips.org/browse-all)
* [Amy J. Ko's free books](https://faculty.washington.edu/ajko/books/): *Critically Conscious Computing* has the most on how novices form misconceptions.

