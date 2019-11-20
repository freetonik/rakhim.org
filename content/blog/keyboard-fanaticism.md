+++
title = "Keyboard fanaticism"
author = ["Rakhim Davletkaliyev"]
date = 2018-09-10T16:54:00+03:00
tags = ["good"]
draft = false
creator = "Emacs 26.3 (Org mode 9.1.9 + ox-hugo)"
+++

I've been reading [an article about Emacs](https://sites.google.com/site/steveyegge2/effective-emacs), and this paragraph had nailed me right into the soul:

> IDE users spend most of their time fumbling around with the mouse. They wouldn't dream of doing it any other way, but they don't realize how inefficient their motions are.
>
> ...
>
> Whenever you need to jump the cursor backward or forward more than about 5 lines, and you can see the target location, you should be using i-search.
> ...
>
> Let your eye defocus slightly and take in the whole paragraph or region around the target point, and choose a word that looks reasonably unique or easy to type. Then i-search for it to navigate to it. You may need to hit Ctrl-r or Ctrl-s repeatedly if your anchor word turns out not to be unique.

This is a common rhetoric: use keyboard only, don't you dare to use the mouse — it's so inefficient!

The scenario in question is simple: you have to move the cursor to some position you see on the screen. Instead of moving your hand to the mouse to move the pointer, the author suggests the following algorithm:

1.  Determine if the place you need to go to is before or after current position. This is non-zero mental work.
2.  Take a look around that point and "choose a word that looks reasonably unique". Perform more mental work of determining which word is unique enough.
3.  If the target is before the current position, use `Ctrl+s`. If it's after, use `Ctrl+r`. This is more or less automatic, but still required mental work of maintaining the mapping between direction and binding.
4.  If your judgement of the uniqueness wasn't good enough, you'll end up somewhere else. Possibly, in a completely different section of the document. Additional mental work — you have to realize what happened, disoriented. Keep hitting `Ctrl+s` or `Ctrl+r`. And you have to keep scanning the surroundings every time you jump until you get where you want.
5.  Okay, you're there! But remember, you've been jumping to a place **near** the target, so now you have to move a bit more — by word or by character.

> Mastering it simply requires that you do it repeatedly until your fingers do it "automatically". Emacs eventually becomes like an extension of your body, and you'll be performing hundreds of different keystrokes and mini-techniques like this one without thinking about them.

While I understand the premise completely, and I occasionally use the same technique, I can’t help but think an advice like that rarely takes into account the trade-off. Yes, moving your hand to the mouse takes time, but it’s not uncommon that the time required is actually **less** than multi key multi step keybinding. Instead of spending a second, two motions and a single click the user is advised to analyze text, make several decisions and hit multiple keys, which might or might not be enough. But hey, you didn't leave the home row, so, win, I guess?..

I'm not defending the mouse here, but I do think there are occasions where using the mouse is just better **for me**. Too often these articles are trying to make you feel like an unintelligent cave man for daring to use the "device of IDE users".

Also, Emacs packages like [avy](https://github.com/abo-abo/avy) or [evil-snipe](https://github.com/hlissner/evil-snipe) make jumping to visible text much simpler and cost less mentally.

The vast sea of discussions and advice about programming tools and especially text editing is full of opinions, approaches and cult-like repeated revelations. Often, the loud sounds of the echo chamber make it difficult to stop for a moment and evaluate something yourself. But please do try.

It's easy to be indoctrinated.
