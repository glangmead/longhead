---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "Coming soon: The Ring App"
subtitle: ""
summary: ""
authors: []
tags: []
categories: []
date: 2026-05-15T10:15:20-04:00
lastmod: 2026-05-15T10:15:20-04:00
featured: false
draft: false

# Featured image
# To use, add an image named `featured.jpg/png` to your page's folder.
# Focal points: Smart, Center, TopLeft, Top, TopRight, Left, Right, BottomLeft, Bottom, BottomRight.
image:
  caption: ""
  focal_point: ""
  preview_only: false

# Projects (optional).
#   Associate this post with one or more of your projects.
#   Simply enter your project's folder or file name without extension.
#   E.g. `projects = ["internal-project"]` references `content/project/deep-learning/index.md`.
#   Otherwise, set `projects = []`.
projects: []
---

I'm working on a new app, and in fact it's nearly complete. It's a listening companion for Wagner's opera cycle [The Ring of the Nibelung](https://en.wikipedia.org/wiki/Der_Ring_des_Nibelungen). I made [a fancy page for it](https://www.luminousdesigns.tech/ring/) that lists its features.

The data that made the app possible is the [Wagner Ring Dataset](https://transactions.ismir.net/articles/10.5334/tismir.161) (WRD) from 2023, which is a collection of annotations by experts and by machine learning models. There is a new digital score, which is a digitization of a piano reduction. The piano reduction is pretty crazy, it contains every minute of the full opera! It's by Richard Kleinmichel (1846–1901). The data includes a link between each line of libretto text and the span of musical measures during which that line is sung. The score is in turn linked to fractional-second time offsets in 16 of the audio recordings released on major labels. Lastly, [a companion paper](https://transactions.ismir.net/articles/10.5334/tismir.116) and [its data](https://zenodo.org/records/4245472) includes spans for all the occurrences of 10 of the major leitmotifs Wagner uses to structure the music and the thematic content of the story.

Together, I figured these data sets would allow the app to highlight the line of libretto text being sung, like the lyrics feature in streaming music apps. It should also highlight the musical measure of the piano score. The vision of the app immediately appeared in my mind: we'd show the libretto and score in real time, and we'd support all the recordings by streaming them from the user's Apple Music account (which would be required -- there's no other reasonable way to offer the performance audio). But I worried about a few things. The Wagner Ring Dataset and the leitmotif dataset were devised by researchers in the field of Music Information Retrieval, and they wanted to train a model that could identify all the occurrences of a given motif from some labeled spans. This means that they kept spans for some motifs private, and released the synthetically generated ones. That's by definition not a complete set.

Furthermore, their segmentation of the libretto into lines of text was incomplete, in my opinion. What I apprecaite about the book by Stewart Spencer, [_Wagner's Ring of the Nibelung: a Companion_](https://bookshop.org/p/books/wagner-s-ring-of-the-nibelung-a-companion-barry-millington/e88df0ca3a0ee730?ean=9780500281949&next=t&), is how he preserves the poetic structure of the libretto. I was excited to learn only recently that the libretto is a poem in alliterative verse, a form I knew about from my studies of Tolkien (e.g. "Arise now, arise, Riders of Théoden! / Dire deeds awake: dark is it eastward."). There are many links with Tolkien, in fact! I wrote about that [in this post](/posts/2024-03-31-wagner-and-tolkien). Thus Spencer's libretto is segmented more finely than the WRD, and furthermore indicates with indentation which lines have the full 3 metrical lifts, versus those with fewer. I wanted to perform that segmentation and indentation on the WRD text. Theoretically they are the same libretto, but you know how it goes: WRD's text came from digitizing Wagner's score, and changes were made in that version that weren't made in other sources. Spencer's work is copyrighted, and anyway isn't the text that is aligned to the score and the audio. So I had to _map_ the segmentation and indentation from Spencer to WRD.

What about English? Spencer wrote a translation and it's great, but again, not available to me to distribute. But in 1910 Margaret Armour wrote a translation which is in the public domain. And furthermore she aimed to provide a full alliterative verse translation including her own similar segmentation and indentation, so it provided what I wanted to offer. (Spencer provides the same -- alliterative verse in English with indentation). But I had to align it to the German. This is nontrivial, due in large part to episodes where multiple characters sing at the same time and different presentations display that simultaneity in different ways. It's also the case that the translations are not line-by-line but sentence-by-sentence or even speaker-turn by speaker-turn. Once I realized I should align at the level of the turn, things got pretty accurate! You see, this is exactly where I felt I could add value. My background is in natural language processing, machine translation, and other types of fancy-pants algorithms, so I tackled this alignment problem. The tentpole feature is to see the poem in real time in both languages. This will unlock understanding and appreciation, says me.

Then what about those leitmotifs? These are such a fun angle of their own. They are widely discussed and presented in books, in audio presentations, and on YouTube. Here's [a good blog post about them](https://www.monsalvat.no/RingList.htm). But I needed to bottle "them" up. There's no canonical "them" but I wanted to take a stab; I wanted a more complete set than what WRD provides. I needed to map them into my libretto and the audio. I turned to another old resource: a book by Julius Burghold from 1897 which contained a German libretto of the Ring with marginal annotations through the entire text, indicating when motifs were playing according to his reckoning and naming scheme. This book is also in the public domain and needed a careful OCR and digital alignment of the margin notes to the libretto lines. This was two more alignment challenges: motif to Burghold lines, and Burghold lines to WRD lines. I did a first automated pass then built a web app to help me fix up every annotation, add missing ones, and so on. Here's that web app:

![Page 337 from Julius Burghold's libretto, plus my annotations](/img/burghold_337.png)

And here's how that is presented in my app at the moment. (Notice the missing translations -- I didn't notice at first that I'd chosen a buggy section, but I might as well. This is a long section of simultaneous singing and Armour divided it up differently, so I'll have to go in manually in the end to fix everything up.)

![Screenshot of The Ring App running on macOS, showing the same region of the libretto as the Julius Burghold screenshot.](/img/ringapp.png)

The app presents all this data in a hopefully intuitive manner that flows. I am fixing bugs in all the different text processing steps, and in the UI. I am also trying to give it some more "intellectual sparkle," by doing much more reading about how different people have selected leitmotifs, have named them, and most fun of all, have noticed how they grow out of each other. I think I can bring some of this understanding directly into my own choice of names and presentation.

The app is in a beta release in TestFlight. I plan for the app to be free with all its features available for experiencing the first opera, _Das Rheingold_. A single in-app purchase will unlock the other three operas. An Apple Music subscription is required, and a live internet connection to stream the audio. 
