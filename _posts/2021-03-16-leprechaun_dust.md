---
layout: post
title: Leprechaun dust from DuckDuckGo
date: 2021-03-16 19:17 -0400
---
I made a heart locket animation for a Valentine's day project years back,
and stuck a generator for it online that recently took on a life of its own
when it got [adopted as a meme](https://www.tumblr.com/tagged/my+beloved+meme?sort=top)
I think because of a cat called [Bingus](https://knowyourmeme.com/memes/bingus)??

{: .scale-image}
![bingus my beloved](/images/bingus_my_beloved.gif)

My dumb little site had a [memory leak for years](https://twitter.com/mkswt/status/1340086604216627201), that I "solved" with
a script to restart it every night. After traffic blew up I finally
fixed this... by restarting every few minutes hash tag should be
ashamed of myself.  But traffic continued to grow so I finally read the
ancient code and soon had improved server stability by orders of magnitude
by cleverly NOT IMMEDIATELY LEAKING MEMORY WITH EVERY UPLOAD.

{: .scale-image}
![shameful close](/images/bingus_close.png)

And that was that, people were happily making their memes and my server was
quietly serving them.  Then hubris hit.  I said to myself, St Patrick's day
is coming up, why not add ... a <a style='color:green;'>green</a> heart locket?
That will blow these memers minds. Born and raised on the red heart locket
these young folks will say "what is this" and "how can this be" and
"all we have known is wrong."  So I fired up Blender 3D and made a [tasteful draft](https://twitter.com/mkswt/status/13702396156642754580) of a luminescent green heart
with shamrocks plastered all over it:

{: .scale-image}
![green draft](/images/bingus_green.gif)

Great! To your eyes, this may look grungy and low quality.  Well, it is, but
that's not necessarily a bad thing, there's a whole scene out there with that
aesthetic.  Or at least, that's what I use as an excuse for my many technical
and artistic deficiencies.

Next, I applied my secret sauce (carefully explained in this [pdf](/images/blenderart-makesweet.pdf), I'm not good at secrets) to convert the Blender design into a precompiled map
so users' uploads can be quickly substituted in for images on surfaces without
needing to re-render.  That results in a sequence of templates like this:

{: .scale-image}
![map files](/images/bingus_mappers.png)

Along with some other images, these summarize what coordinates of the users' inputs
to lay out, and where.  Once that was all done, I went to my site, visited my
new generator, stuck in some images and text and voilà:

{: .scale-image}
![Irsih](/images/bingus_irish.gif)

Irsih is a misspelling of Irish for humorous effect you see, slyly referencing
the <a href="https://twitter.com/SCENEGUMI/status/1363253249369800705">Fnich meme</a>
and oh nevermind. But hang on, what are the funky little white speckles in there?
<a href="https://twitter.com/mkswt/status/1370520940111663113">Leprechaun dust</a>
I suggested on twitter.  I stared at my maps, looking for a rendering problem. Nothing.
I tried making animations in different browsers, and found them only happening in Chrome.
Betrayal!  I dug in to see if there were new canvas options
I needed these days (in olden times I'd been bitten by `context.imageSmoothingEnabled`).
Nothing.  Finally, I turned off all my browser extensions... and the problem went away.
Turning the extensions back on one by one, the speckles turned out to be from the DuckDuckGo
privacy extension.  Digging into its source code, I found a
[modifyPixelData](https://github.com/duckduckgo/duckduckgo-privacy-extension/blob/cffbaf30100a517e6abdbc2943f9aa3e9fb0d7ad/shared/js/content-scope/fingerprint.js#L57) reaching into the canvas and randomly twiddling least significant bits
to disrupt canvas fingerprinting.

A somewhat helpful, somewhat mischievous entity sprinkling a bit of magic grit into
my life.  So yes, basically, leprechaun dust.
