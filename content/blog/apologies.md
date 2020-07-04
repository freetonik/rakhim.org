---
title: "Apologies, my lovely RSS readers"
date: 2020-07-04T21:36:13+03:00
draft: true
---

If you read my blog via RSS, you might've noticed duplicate publications over the last few days. I am sorry about this.

The reason is that I've been experimenting with Ghost. For some time, I've been running Ghost instead of my regular Hugo static setup. But pretty quickly I realized that I made a huge mistake. Well, not huge. Ghost is very nice. Setup, migration, theme development — everything is pretty simple and well made. I was able to recreate everything I had, including Mathjax for LaTeX fragments. My slightly modified blog theme [Kummitus](https://github.com/freetonik/kummitus/) is available on Github ("kummitus" is "ghost" in Finnish).

The reason for this move was another slightly unhealthy attempt to simplify things. I started with de-Emacsing as much as possible. I slimmed down my config a lot, got rid of many Org mode complications related to blogging. There was a complex build system powered by [ox-hugo](https://ox-hugo.scripter.co/), Hugo, magit, Github and Netlify. It was wonderful and horrifyingly overengineered :D I explained it in detail in [Episode 5 of Emacscast](https://emacscast.org/episode_5/).

By migrating to Ghost, I was able to ditch quite a lot of code and packages, further reducing the mental overhead. But, of course, now I had to maintain a Ghost setup on a VPS. And system administration is bane of my existence...

Among other things unrelated to blogging, I decided to move my private knowledge base away from Org and Org-roam to a set of plain markdown files powered by [Obsidian](https://obsidian.md/). It's a slow process, but a nice chance to rehash my old notes. This thing is now publicly available as [my braindump](https://braindump.rakhim.org/).

While experienced Emacs users embrace the ever-expanding use case of their editor, I, for one, often go the other way. Not without experimenting first, I always dial down and make things dumber and less coupled. Honestly, I do not want to "never leave Emacs". I want to have a bunch of small independent tools interacting via plain files.

Anyway, with Ghost, I quickly realized several limitations of Ghost when it comes to writing custom pages. Also, nothing like data collections really exists there, so maintaining things like my [bookshelf](/bookshelf) is pretty painful. Here in Hugo all the books are stored in .yml files. Everybody loves YAML, right?

What a marathon of procrastination that was! So yeah, I'm back to Hugo-powered static website served via Netlify. This time, I'm not using Org mode, but rather writing markdown directly with a handy [easy-hugo](https://github.com/masasam/emacs-easy-hugo) package. It's a thin layer of utility functions which add very little mental overhead to the whole setup. And it's easy to ditch it without problems.

One thing that was always a problem for me in static-website-land is images. I always want to drag-n-drop images and not think about paths and stuff. Just like you do with Ghost or Wordpress or any user-friendly frontend. With Org, you can setup Org-download. For Markdown, I've found [this little package](https://github.com/mooreryan/markdown-dnd-images). I've modified it to generate monthly subfolders (like `images/posts/2020/07`, similar to how Ghost does it) and published a fork [here](https://github.com/freetonik/markdown-dnd-images).

To confirm, here are some pears from my local supermarket:

![](/images/posts/2020/07/apologies/pears.jpg)
