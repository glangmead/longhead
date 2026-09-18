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

## Class 1

<hr />

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

### Front end, back end

* [Frontends + Backends](https://read.technically.dev/p/software-eng-vibe-coders-frontends-backends)  restaurant analogy (dining room = frontend, kitchen = backend/API/database). Part 1 of a 6-part series.
* [Mobbin flow](https://mobbin.com/apps/flighty-ios-e6531374-23b5-4b62-9e1c-5ec41d351780/812571a1-c341-471e-9dc4-26b0fa92720a/screens) -- see many, many screens from apps.
* [How to Make Sense of Any Mess](https://abbycovert.com/make-sense/) (Abby Covert; full text free) -- information architecture: "the way we arrange the parts of something to make it understandable."
* [Web apps vs native apps vs hybrid apps](https://aws.amazon.com/compare/the-difference-between-web-apps-native-apps-and-hybrid-apps/) (AWS) -- basic lingo.

### Addition circuits

* [Circuits that add numbers](https://en.wikipedia.org/wiki/Adder_(electronics))
* [Video on said circuits](https://www.youtube.com/watch?v=ecn-8iGDRSo)

## Class 2

<hr />

### Functions, variables

### Databases

### Computer organization

## Class 3
    
<hr />

### Dictionaries, objects, libraries

### git

### LLMs and agents

## Class 4
    
<hr />

### Files, network, scraping

### Other languages

### The apps that run our code

[The github repository of python itself](https://github.com/python/cpython)

## Class 5
    
<hr />

### Storage, games (and game state trees)

### Specs

### The notional machine

## Class 6
    
<hr />

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




### QA

### Theory of programming languages

# Notes

<hr />

## Coding

* [Practical Python Programming](https://dabeaz-course.github.io/practical-python/Notes/Contents.html)
* [Python tutor visualizer](https://pythontutor.com/member.html?glangmead@gmail.com)
  * [Examples](https://pythontutor.com/articles/python-visualizer.html)
* [Jupyter everywhere](https://jupytereverywhere.org)

### Overviews

* [How Computers Work](https://www.youtube.com/playlist?list=PLzdnOPI1iJNcsRwJhvksEo1tJqjIqWbN-) -- playlist of 5 5-minute videos.
* [How the Internet Works](https://www.youtube.com/playlist?list=PLzdnOPI1iJNfMRZm5DDxco3UdsFegvuB7) -- playlist of 6 7-minute videos.
* [Software Engineering for Vibe Coders: Frontends + Backends](https://read.technically.dev/p/software-eng-vibe-coders-frontends-backends)  restaurant analogy (dining room = frontend, kitchen = backend/API/database). Part 1 of a 6-part series.
* [What happens when you type google.com](https://github.com/alex/what-happens-when) -- the exhaustive answer, keypress to pixels.
* [Mobbin flow](https://mobbin.com/apps/flighty-ios-e6531374-23b5-4b62-9e1c-5ec41d351780/812571a1-c341-471e-9dc4-26b0fa92720a/screens) -- see many, many screens from apps.
* [Apple Accessibility Inspector](https://developer.apple.com/documentation/accessibility/accessibility-inspector)
* [How to Make Sense of Any Mess](https://abbycovert.com/make-sense/) (Abby Covert; full text free) -- information architecture: "the way we arrange the parts of something to make it understandable."
* [Web apps vs native apps vs hybrid apps](https://aws.amazon.com/compare/the-difference-between-web-apps-native-apps-and-hybrid-apps/) (AWS) -- basic lingo.
* [Introduction to Web Development](https://www.theodinproject.com/lessons/foundations-introduction-to-web-development) (The Odin Project) -- another high level overview.
* [Margaret Hamilton](https://en.wikipedia.org/wiki/Margaret_Hamilton_(software_engineer)) ![](/img/margaret_hamilton.jpg)

### Building apps

* [Apple's iOS Pathway](https://developer.apple.com/ios/get-started/)
* [Apple developer Pathway](https://developer.apple.com/pathways/developer/) -- steps to ship an app
* [100 Days of SwiftUI](https://www.hackingwithswift.com/100/swiftui) -- I used this.
* [Swift Playgrounds](https://developer.apple.com/swift-playground/) -- build a real SwiftUI app with live preview on iPad or Mac, no Xcode. The only zero-setup on-ramp for mobile.
* [Unwrap: Learn Swift on your iPad](https://apps.apple.com/us/app/unwrap/id1440611372
Unwrap)

### Building web sites

* [Reddit thread about what to use in 2026](https://www.reddit.com/r/webdevelopment/comments/1smfe68/whats_your_preferred_way_of_building_websites_for/)
* [Next.js on Wikipedia](https://en.wikipedia.org/wiki/Next.js) -- understanding what this entry is saying about rendering on the server versus in the browser is an excellent goal.
* [Reddit thread about building a custom CRM with a floating chat window](https://www.reddit.com/r/nextjs/comments/1mgo7on/built_an_internal_crm_with_nextjs_for_my_company/) -- I just want to share how people talk about these things.

### Building terminal programs

* [Roguelike dungeon-crawl tutorial in Rust](https://bfnightly.bracketproductions.com/rustbook/)


## AI for coding

* [Not all AI-assisted programming is vibe coding](https://simonwillison.net/2025/Mar/19/vibe-coding/) (Simon Willison) -- low stakes only, watch secrets and data privacy, set billing limits, get a review.
* [Learn AI-Assisted Python Programming, 2nd ed.](https://www.manning.com/books/learn-ai-assisted-python-programming-second-edition) 

## Pedagogy

* [Teaching Tech Together](https://teachtogether.tech/en/)
* [Teachcomputing](https://teachcomputing.org/pedagogy)
* [CS teaching tips](https://www.csteachingtips.org/browse-all)
* [Amy J. Ko's free books](https://faculty.washington.edu/ajko/books/) -- *Critically Conscious Computing* has the most on how novices form misconceptions.

