# Security and privacy: the unit

Four topics, in this order, because each one is a wider circle of blame than
the last: your own keys, your users' passwords, the files your users hand you,
and the door you left open on the internet.

Roughly an hour, four fifteen-minute blocks. Every block has one live demo that
runs against the code they already wrote. If time runs short, cut blocks from
the bottom — block 1 is the one they will use on Monday.

**The framing sentence to open with.** Security is not a property of a program;
it is a question about an adversary. "Is this secure?" has no answer. "Could a
bot that reads every public commit on GitHub use this?" has an answer, and for
a small project that bot *is* the adversary — not a government, not a genius.
Nearly every story below is a machine doing something boring, very fast.

**The second framing sentence.** Every single incident in this document has a
fix that fits on one line, and in most cases the fix already existed, for free,
in a library they have installed.

---

## Block 1 — Your own secrets

**The pitch.** There is a global machine whose only job is reading every commit
pushed to GitHub, and it never sleeps.

**Afterwards.** They know why an API key is a password, where to put it
instead, and that deleting a secret from a file does not delete it from git.

### The stories

**Uber, 2014.** An engineer put an AWS access key into code he published in a
public repository. Someone used it to download a file with 100,000+ drivers'
names and licence numbers. One key, admin rights to everything, shared by every
engineer on the team. *(FTC complaint, the primary source, says 100,000+ —
older news stories say 50,000. Use the FTC number.)*

*Sources: [FTC revised complaint (PDF)](https://www.ftc.gov/system/files/documents/cases/152_3054_c-4662_uber_technologies_revised_complaint.pdf) · [FTC analysis of proposed order](https://www.ftc.gov/system/files/documents/cases/1523054_uber_technologies_revised_analysis.pdf)*

**A solo developer, 2015.** Pushed AWS keys to GitHub, noticed, deleted them
about five minutes later. A bot had already taken them and started ~140 EC2
instances mining Bitcoin. He woke up to a $2,375 bill and a missed call from
Amazon. Five minutes was too slow.

*Sources: [The Register](https://www.theregister.com/2015/01/06/dev_blunder_shows_github_crawling_with_keyslurping_bots) · [Slashdot discussion](https://it.slashdot.org/story/15/01/02/2342228/bots-scanning-github-to-steal-amazon-ec2-keys). The developer's own blog post is offline; the five-minute and $2,375 figures are his self-report, so say "he reported."*

That number is not folklore. Palo Alto Unit 42 observed an attacker campaign
beginning **within five minutes** of credentials appearing on GitHub;
independent honeypot work using canary tokens recorded first use at eleven
minutes. Keys on GitHub are used in minutes; on Pastebin, hours; on Stack
Overflow, days.

*Sources: [Unit 42, "CloudKeys in the Air"](https://unit42.paloaltonetworks.com/malicious-operations-of-exposed-iam-keys-cryptojacking/) · [Help Net Security on canary-token timing](https://www.helpnetsecurity.com/2024/12/02/revoke-exposed-aws-keys/)*

**Toyota, 2022.** A subcontractor uploaded T-Connect source to a public repo in
December 2017 with a data-server key typed into it. Nobody noticed until
September 2022 — five years. 296,019 customers affected, and the part worth
dwelling on: Toyota could not determine whether anyone ever used it, because
there were no logs. "We don't know" is a worse outcome than "yes."

*Sources: [The Register](https://www.theregister.com/2022/10/11/toyota_source_code_email_leak/) · [BleepingComputer](https://www.bleepingcomputer.com/news/security/toyota-discloses-data-leak-after-access-key-exposed-on-github/)*

**Starbucks, 2019.** A researcher found a JumpCloud API key — which controlled
who had access to internal systems — in a public repo. The entire technique was
searching GitHub for a string. $4,000 bounty. The report is public and readable
(HackerOne #716292); hand it to them.

*Sources: [HackerOne report #716292](https://hackerone.com/reports/716292) · [BleepingComputer](https://www.bleepingcomputer.com/news/security/starbucks-devs-leave-api-key-in-github-public-repo/)*

### The demo

1. A script with `API_KEY = "sk-live-abc123"` on line 3. Commit it.
2. Delete the line. Commit again. The file is clean.
3. `git log -p` — the key is right there, forever, in the history.
4. The point: **rotate the key. Deleting it does nothing.**
5. Then the fix, three lines: `os.environ["API_KEY"]`, a `.env` file, and
   `.env` in `.gitignore`. Show what happens when you forget the third step.

### The prompt

> I have a Python script with an API key typed into it. Show me how to move it
> to an environment variable and a `.env` file, and how to make sure the `.env`
> never gets committed. Then show me that the old key is still in my git history
> after I delete it, and tell me what I actually have to do about that.

---

## Block 2 — Passwords: your responsibility to your users

**The pitch.** The moment someone types a password into something you built,
you are holding something of theirs. You are also, if you do this right, never
going to know what it is.

**Afterwards.** They know the difference between hashing, encryption and
encoding; they can call a password hashing function correctly; and they know
that the login form is not the only way in.

### The stories

**Adobe, 2013 — 153 million accounts.** The passwords were *encrypted*, not
hashed — 3DES in ECB mode, which is reversible and, worse, produces identical
output for identical input. So every user with the password `123456` had the
same ciphertext. The dump also included every user's plaintext password hint.
Researchers recovered the top-100 password list by treating it as a crossword:
match repeated ciphertexts, read the hints, fill in the answer. XKCD #1286 drew
the actual puzzle — put it on screen and have the room solve a row.

*Sources: [Schneier, "Cryptographic Blunders Revealed by Adobe's Password Leak"](https://www.schneier.com/blog/archives/2013/11/cryptographic_b.html) · [CSO Online: encrypted, not hashed](https://www.csoonline.com/article/540070/network-security-adobe-confirms-stolen-passwords-were-encrypted-not-hashed.html) · [Have I Been Pwned record](https://haveibeenpwned.com/Breach/Adobe) · [XKCD 1286](https://xkcd.com/1286/)*

**RockYou, 2009 — 32.6 million passwords in plain text.** Breached by SQL
injection, so this story does double duty with block 4. Seventeen years later,
`rockyou.txt` is still the default wordlist every password cracker tries first.
Their users' passwords became a permanent tool for attacking everyone else.

*Sources: [TechCrunch (2009)](https://techcrunch.com/2009/12/14/rockyou-hacked/) · [Help Net Security, on the SQL injection](https://www.helpnetsecurity.com/2009/12/14/serious-sql-flaw-could-have-compromised-millions-of-rockyoucom-users/)*

**Facebook 2019, and Twitter and GitHub in 2018.** Passwords written to
internal log files in plain text, *before* the hashing step, some going back to
2012. Three of the largest engineering organisations on the planet shipped the
same bug within a year of each other, and the bug is a print statement.
*(Facebook confirmed "hundreds of millions." The widely repeated "600 million"
and "20,000 employees could read them" figures come from Krebs's anonymous
sources — attribute them if you use them.)*

*Sources: [Krebs on Security](https://krebsonsecurity.com/2019/03/facebook-stored-hundreds-of-millions-of-user-passwords-in-plain-text-for-years/) · [TechCrunch](https://techcrunch.com/2019/03/21/facebook-plaintext-passwords/) · [BleepingComputer, on Twitter and GitHub](https://www.bleepingcomputer.com/news/security/twitter-admits-recording-plaintext-passwords-in-internal-logs-just-like-github/)*

**23andMe, 2023 — £2.31M ICO fine.** Credential stuffing: attackers replayed
username/password pairs stolen from other sites. Only 14,601 accounts were
actually entered. But the DNA Relatives feature meant that exposed data on
roughly 10 million people. Multi-factor auth was optional, about 0.2% of users
had it, and no account with MFA was compromised. The ICO's finding was that
nothing was in place to notice or slow down thousands of login attempts.
*The break-in was small. The blast radius was not.*

*Source: [ICO press release and penalty](https://ico.org.uk/about-the-ico/media-centre/news-and-blogs/2025/06/23andme-fined-for-failing-to-protect-genetic-data/)*

**Ashley Madison, 2015 — the one with the twist.** They did passwords
*correctly*: bcrypt, high cost factor. But a legacy code path elsewhere stored a
login token computed as `MD5(username + password.lower())`. Attackers ignored
the bcrypt entirely, cracked 15 million weak MD5 tokens to recover the
lowercased password, then tested case variants. 11.2 million recovered.
**The usual retelling — "they used weak hashing" — is false, and correcting it
is the lesson:** one password-handling function in the whole codebase, and
never derive anything else from the raw password.

*Sources: [CynoSure Prime's technical writeup](https://blog.cynosureprime.com/2015/09/how-we-cracked-millions-of-ashley.html) · [The Register](https://www.theregister.com/2015/09/11/cracktivists_pop_bland_ashley_madison_passwords_call_for_salt/)*

### The demo

Three or four lines, and it lands harder than any slide:

```python
hashlib.md5(b"password123").hexdigest()   # run twice: identical
bcrypt.hashpw(b"password123", bcrypt.gensalt())   # run twice: different
```

Ask why different is better. Then `bcrypt.checkpw` — you can still check a
password you cannot read. Then time 100,000 guesses against `sha1` versus
`bcrypt` and let the difference explain the word "slow" as a feature.

Second demo, ten lines: the rate limiter. A dict of `{user: [timestamps]}`,
refuse more than five attempts a minute. This is the 23andMe fix.

### The prompt

> Show me the wrong way and the right way to store a password in Python. Hash
> the same password twice with MD5 and twice with bcrypt and explain the
> difference in the output. Then write a login function that checks a password
> without ever storing it, and add a rate limit so nobody can try a million
> guesses. Explain the difference between hashing, encrypting and encoding, and
> tell me which one base64 is.

---

## Block 3 — Photos, and the other things users hand you

**The pitch.** A photo is not a picture. It is a file with a picture in it,
plus a list of facts about where and when the picture was taken.

**Afterwards.** They can read and strip EXIF, they know "delete" is a word in
the UI and not automatically a thing their code does, and they know that a
folder of user uploads is a liability.

### The stories

**John McAfee, 2012.** Vice published a phone photo captioned "We are with John
McAfee right now, suckers" while he was a wanted man in hiding. The EXIF data
carried GPS coordinates placing him at a specific spot in Guatemala. He first
claimed he had faked the metadata, then admitted he had not. The headline said
suckers; the metadata was the punchline.

*Sources: [NPR](https://www.npr.org/sections/thetwo-way/2012/12/04/166487197/betrayed-by-metadata-john-mcafee-admits-hes-really-in-guatemala) · [The Next Web](https://thenextweb.com/news/vice-leaves-metadata-in-photo-of-john-mcafee-pinpointing-him-to-a-location-in-guatemala)*

**Parler, 2021 — the finale story, roughly 32TB.** Three ordinary omissions at
once. Posts had sequential ID numbers, so you could ask for post 1, then 2,
then 3. There was no rate limiting, so you could do that as fast as you liked.
And uploads were never stripped of EXIF, so a million images and videos still
carried GPS coordinates and timestamps — which were then used to place people
inside the US Capitol on January 6th, in federal criminal cases. *This was not a
hack. The endpoints were public and required no login. The person who archived
it wrote a loop.*

*Sources: [Distributed Denial of Secrets' release note](https://ddosecrets.substack.com/p/release-parler) · [Vice, on archivists mining the metadata](https://www.vice.com/en/article/qjpevv/archivists-parler-capitol-hill-crimes) · [Scientific American](https://www.scientificamerican.com/article/what-the-capitol-riot-data-download-shows-about-social-media-vulnerabilities/)*

**Facebook's "deleted" photos, 2009–2012.** An Ars Technica journalist deleted
photos and then kept checking their direct URLs. One was still fetchable
sixteen months later; the problem was acknowledged for about three years before
it was fixed. Deleting the row in the database did not delete the file on the
file server.

*Sources: [Neowin, summarising the Ars Technica experiment](https://www.neowin.net/news/those-facebook-photos-you-deleted-are-still-online---three-years-later/) · [NBC News, on the 2012 fix](https://www.nbcnews.com/tech/tech-news/facebook-stops-hoarding-your-deleted-photos-flna949621)*

**Tea, July 2025 — 72,000 images including 13,000 selfies and photo IDs.** An
app for women's dating safety required a selfie plus a government ID. The images
sat in a cloud storage bucket with no authentication; anyone with the URL could
list and download everything. Not an attack — a default setting. *(Litigation
ongoing; give the technical facts and stop there.)*

*Sources: [American Bar Association technical and legal analysis](https://www.americanbar.org/groups/intellectual_property_law/resources/newsletters/cloud-misconfiguration-private-right-of-action-tea-app-data-breach/) · [Engadget](https://www.engadget.com/cybersecurity/tea-app-suffers-breach-exposing-thousands-of-user-images-190731414.html)*

**Peekaboo Moments, 2020 — the small-team version.** An app for parents to
share baby photos left its database on the open internet with no password.
800,000+ email addresses, links to the photos and videos, babies' birthdates,
GPS coordinates. The developer did not respond to the researcher and fixed it
only after press coverage. A tiny app nobody had heard of, and the exposed data
was children's faces and home locations.

*Sources: [Sophos Naked Security](https://news.sophos.com/en-us/2020/01/15/peekaboo-moments-baby-recording-app-has-a-bad-database-booboo/) · [Infosecurity Magazine](https://www.infosecurity-magazine.com/news/peekaboo-moments-data-breach/)*

**Swirl Face, 2007 — redaction.** A man hid his face in photographs with a
digital swirl effect. Swirls are invertible. German police ran it backwards,
Interpol published the recovered face, and he was arrested eleven days later.

*Source: [Interpol](https://www.interpol.int/en/News-and-Events/News/2008/International-paedophile-caught-after-INTERPOL-s-global-manhunt-is-convicted-and-sentenced-for-second-time-by-Thai-court)*

### The demo

The best hands-on moment in the whole unit: **have them photograph something in
the room with their phone, airdrop it to the laptop, and read their own GPS
coordinates out of it** with Pillow. Then strip the EXIF and read again.

Then two short ones:

- **Swirl and unswirl** an image in Pillow, then fill a rectangle with solid
  black and try to undo *that*. Redaction destroys pixels; effects do not.
- **The delete that isn't.** A fifteen-line app where "delete photo" runs
  `DELETE FROM photos WHERE id = ?` — and then show the file still sitting at
  `uploads/3.jpg`, still served, still fetchable.

### The prompt

> Here is a photo from my phone. Show me every piece of metadata inside it,
> especially the GPS coordinates, then write a function that strips all of it
> before saving an upload. Then write a tiny photo app with SQLite where
> "delete" only deletes the database row, show me that the file is still there,
> and fix it.

---

## Block 4 — Hardening a web app

**The pitch.** Six mistakes account for most of what happens to small websites.
None of them are clever, all of them have a one-line fix, and you have already
made two of them this term.

**Afterwards.** They can name the bug classes, recognise them in code an AI
hands them, and apply the fixes.

Teacher's note: this block is a checklist, not a lecture. Do not try to make
them into security engineers. The goal is *recognition* — that when they read
"sanitise the input" or "use a prepared statement" in an AI's explanation, they
know which of these six things it is talking about.

### The six, each with its incident and its fix

**1. SQL injection — user input becoming part of a database command.**
*TalkTalk, 2015: 156,959 customers, then a record £400,000 ICO fine.* The
attackers hit three legacy pages TalkTalk had inherited in an acquisition and
forgotten about, running a MySQL version whose patch had been available for over
three years. The regulator's finding was, in effect: you were breached twice
already this year through this same hole.
*Fix:* placeholders. `cur.execute("SELECT * FROM books WHERE title = ?", (t,))`.
**They have already been taught this** — it is in `examples/11_storage.py`, and
`examples/09_network.py` makes the same point about `urlencode`. This block is
where the two connect: *never build a command by gluing strings.*

*Sources: [ICO enforcement, via Graham Cluley](https://grahamcluley.com/talktalk-fined-record-400000-failing-prevent-hack/) · [Infosecurity Magazine](https://www.infosecurity-magazine.com/news/ico-slaps-talktalk-with-400k-fine/) · [Wikipedia, with ICO citations](https://en.wikipedia.org/wiki/2015_TalkTalk_data_breach)*

**2. Broken access control (IDOR) — not checking whether this user owns this
thing.** *First American Financial, 2019: 885 million documents.* Document URLs
were numbered in order. Change the digits, get someone else's mortgage file —
SSNs, bank statements, tax records — with no login at all, going back to 2003.
*Fix, two lines:* look up the record, then `if record.owner_id != session_user:
abort(403)`. **This is the single most useful thing in this block for people
building small apps.**

*Sources: [SEC order 34-92176 (PDF)](https://www.sec.gov/files/litigation/admin/2021/34-92176.pdf) · [BankInfoSecurity](https://www.bankinfosecurity.com/first-american-financials-sec-breach-settlement-488000-a-16912)*

**3. Outdated dependencies.** *Equifax, 2017: 147.9 million people.* The Apache
Struts patch was published on 7 March. An internal notice went out on 9 March. A
scan on 15 March failed to find the affected system. Attackers got in in May and
were not noticed until 29 July. The fix existed, for free, for 141 days.
*Fix:* `pip install pip-audit && pip-audit`. Run it on the class project, live,
and see what comes back.

*Sources: [GAO-18-559 (PDF)](https://www.gao.gov/assets/gao-18-559.pdf) · [House Oversight report (PDF)](https://oversight.house.gov/wp-content/uploads/2018/12/Equifax-Report.pdf)*

**4. Cross-site scripting — user text being run as code by the browser.**
*The Samy worm, MySpace, 2005.* He smuggled JavaScript past the filters into his
own profile. Viewing his profile added him as your friend, appended "but most of
all, samy is my hero" to your page, and copied the script to your profile. Over
a million infections in under twenty hours; MySpace took the site down. He got a
felony conviction, and he was not trying to break anything — he wanted friends.
*Fix:* escape output. Jinja2 does it by default; the bug is when someone reaches
for `|safe`. Demo: `<script>alert(1)</script>` as a book title, with autoescape
on and off.

*Sources: [Samy Kamkar's own writeup](https://samy.pl/popular/tech.html) · [Wikipedia, with contemporaneous citations](https://en.wikipedia.org/wiki/Samy_(computer_worm))*

**5. No rate limiting.** *Snapchat, 2013: 4.6 million usernames and phone
numbers.* The Find Friends feature would answer "does this phone number belong
to anyone?" as many times as you asked. Researchers reported it; four months
later, nothing had changed; someone published the proof of concept, and the dump
followed within days. FTC action, twenty years of independent privacy
monitoring. *No single request was an attack. Four million of them were.*
*Fix:* the same ten-line limiter from block 2, or `flask-limiter`.

*Source: [FTC press release and complaint](https://www.ftc.gov/news-events/news/press-releases/2014/05/snapchat-settles-ftc-charges-promises-disappearing-messages-were-false)*

**6. Cross-site request forgery.** *Netflix, 2006.* Account actions happened via
plain GET requests, so a hidden `<img src="...">` on any website you visited
while logged into Netflix could reorder your queue, change your password, or —
the real one — change your shipping address, so the DVDs went to someone else.
*Fix:* never change state on a GET; use CSRF tokens (Flask-WTF gives them free)
and `SameSite` cookies. **Say plainly that this one was disclosed and fixed, not
breached** — there is no evidence it was exploited. CSRF is the bug class with
no famous disaster, because everybody fixed it. That is a decent lesson too.

*Sources: [Full Disclosure post, October 2006](https://seclists.org/fulldisclosure/2006/Oct/316) · [Jeremiah Grossman's analysis](https://blog.jeremiahgrossman.com/2006/10/more-on-netflixs-csrf-advisory.html)*

*Bonus, if the room is interested:* **Nova Scotia, 2018** is IDOR at a scale they
recognise. A provincial freedom-of-information site numbered its documents
sequentially and never checked permissions. A nineteen-year-old wrote a loop and
downloaded documents 1 through 7,000; about 4% held sensitive personal data. He
was arrested and charged. A government employee had found the same bug earlier
by making a typo in a URL. Security and privacy experts publicly argued he was
being scapegoated for the government's own defect. *(Confirm how the charges
were resolved before telling students the ending.)*

*Sources: [CBC News](https://www.cbc.ca/news/canada/nova-scotia/freedom-information-personal-website-breach-1.4614424) · [CBC follow-up on the scapegoating concerns](https://www.cbc.ca/news/canada/nova-scotia/concerns-teen-being-railroaded-in-privacy-breach-to-cover-government-slip-1.4616972) · [BleepingComputer](https://www.bleepingcomputer.com/news/security/teenager-charged-for-nova-scotia-freedom-of-information-web-portal-breach/)*

### The demo

One script, four minutes, against `data/library.db`:

```python
title = "' OR '1'='1"
cur.execute("SELECT * FROM books WHERE title = '" + title + "'")   # everything
cur.execute("SELECT * FROM books WHERE title = ?", (title,))       # nothing
```

Then `pip-audit` on the course folder, live and unrehearsed.

### The prompt

> Take my SQLite book library and build the most insecure small web app you can
> that still works: string-built SQL, no login check on the detail page, user
> input rendered as raw HTML, no rate limit. Then attack it yourself and show me
> each attack working. Then fix them one at a time, and after each fix, show the
> same attack failing.

---

## If you only have twenty minutes

Block 1 entire, then two demos from the rest: **bcrypt twice versus md5 twice**,
and **`' OR '1'='1'` against their own database**. Everything else is a link.

## If you have a spare five minutes at the end

Parler. It is the only story that lands three fixes at once — strip the
metadata, don't number things sequentially, rate-limit the endpoint — and the
consequences were real, documented, and not hypothetical.

---

## Accuracy notes

Do not tell students things that are not true; several of these stories have a
popular version that is wrong.

- **Ashley Madison did not use weak password hashing.** Their bcrypt was sound.
  The failure was a second, forgotten code path. Getting this right *is* the
  lesson.
- **Parler was not hacked.** Public, unauthenticated endpoints, scraped with a
  loop. The "she used a deleted admin account" detail is unsupported. Size:
  say ~32TB as released, not 70TB.
- **First American's SEC penalty (~$488,000) was for failures of disclosure
  controls** — executives certifying filings were not told about the flaw — not
  for the vulnerability itself.
- **Facebook's plaintext-password numbers:** "hundreds of millions" is
  confirmed; "600 million" and "20,000 employees" are journalists' anonymous
  sources.
- **Uber 2014 was 100,000+ drivers** per the FTC, not the 50,000 in early
  reporting.
- **Netflix CSRF was disclosed and fixed, never exploited.**
- **Nova Scotia:** verify the disposition of the charges before narrating an
  ending.
- **Peekaboo:** the "images sold on the dark web" claim is unsupported. Drop it.
- **Skip the Samsung-engineers-pasted-code-into-ChatGPT story.** Single Korean
  outlet, never confirmed by Samsung, and the "three leaks in twenty days"
  detail cannot be corroborated.
- **Skip "The Snappening" (2014).** Snapchat was never breached; a third-party
  app users had given their credentials to was misconfigured, and the volume
  figures are disputed by an order of magnitude. Peekaboo teaches the same
  lesson cleanly.
- **The Cat Schwartz cropped-thumbnail story (2003)** is thinly sourced. Teach
  the bug class by demonstrating it on your own file instead — same lesson,
  no factual risk.

## Sources

Every incident above carries its own links. Worth pointing out to the class:
most of them are **public records** — regulator rulings, court filings,
congressional reports — not blog posts. Anyone can read the actual finding.

The primary documents, collected:

- [FTC complaint against Uber (PDF)](https://www.ftc.gov/system/files/documents/cases/152_3054_c-4662_uber_technologies_revised_complaint.pdf) — the 2014 GitHub key
- [FTC press release, Snapchat](https://www.ftc.gov/news-events/news/press-releases/2014/05/snapchat-settles-ftc-charges-promises-disappearing-messages-were-false) — names the missing rate limit explicitly
- [ICO, 23andMe, 2025](https://ico.org.uk/about-the-ico/media-centre/news-and-blogs/2025/06/23andme-fined-for-failing-to-protect-genetic-data/) — £2.31M
- [GAO-18-559 (PDF)](https://www.gao.gov/assets/gao-18-559.pdf) and the [House Oversight report (PDF)](https://oversight.house.gov/wp-content/uploads/2018/12/Equifax-Report.pdf) — Equifax, both free
- [SEC order 34-92176 (PDF)](https://www.sec.gov/files/litigation/admin/2021/34-92176.pdf) — First American
- [HackerOne report #716292](https://hackerone.com/reports/716292) — Starbucks, public and short enough to read aloud
- [Interpol on the swirl-face arrest](https://www.interpol.int/en/News-and-Events/News/2008/International-paedophile-caught-after-INTERPOL-s-global-manhunt-is-convicted-and-sentenced-for-second-time-by-Thai-court)

And the technical writeups worth reading yourself before teaching:

- [Samy Kamkar on his own worm](https://samy.pl/popular/tech.html)
- [CynoSure Prime on Ashley Madison](https://blog.cynosureprime.com/2015/09/how-we-cracked-millions-of-ashley.html) — the MD5 token path
- [Schneier on the Adobe password leak](https://www.schneier.com/blog/archives/2013/11/cryptographic_b.html)
- [Unit 42, "CloudKeys in the Air"](https://unit42.paloaltonetworks.com/malicious-operations-of-exposed-iam-keys-cryptojacking/) — where the five-minute figure comes from
- [Distributed Denial of Secrets' Parler release note](https://ddosecrets.substack.com/p/release-parler)
