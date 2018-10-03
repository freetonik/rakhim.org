+++
title = "Moved from Jekyll to Hugo and ox-hugo"
author = ["Rakhim Davletkaliyev"]
date = 2018-09-03T17:13:00+03:00
categories = ["software and tools"]
draft = false
creator = "Emacs 26.1 (Org mode 9.1.9 + ox-hugo)"
+++

I have changed the setup for this blog from Jekyll + Github to Hugo + ox-hugo + Netlify. The main goal was to be able to write blog posts from within Emacs and reduce as much traction as possible. Also, Org mode is much more comfortable to write in compared to any Markdown editor I've tried.


## Previous setup {#previous-setup}

I've been using Jekyll and Github pages for a long time, and it was generally a good experience. I don't have big complaints about Jekyll. It can be a bit clunky when it comes to things like tags, but I don't use them anyway. My [Russian blog](https://rakh.im/) is still powered by it. One thing that is never fun — the need to manage Ruby environment and dependencies. Some people prefer to encapsulate everything into Docker containers, and I've tried that with Jekyll as well, but the overhead complexity is not worth it.

I was using Sublime Text or sometimes iA writer to write posts. The whole process was full of small steps that added friction. I fully acknowledge that this sounds like "the tools stopped me from being a prolific blogger, if only I had better tools" fallacy.

This is how it looked like for the most part:

1.  Go to iTerm, navigate to my blog directory and start Jekyll server.
2.  Open the project in Sublime.
3.  Create a new Markdown file with a correct name (e.g. `2018-01-11-be_bored.md`). I have a bash script to quickly create a new file with some front-matter inserted by default.
4.  Go to browser, reload page, open post.
5.  Write Markdown in Sublime, reload page to see result.
6.  Push to Github when ready.

Sometimes thing go bad and Github build fails. There is no clarification, and on rare occasions I had to contact support to find out the actual build error output. GitHub's support is excellent, but this process is no fun.


## New setup {#new-setup}

Now I use [Hugo](https://gohugo.io/) static site generator, but don't write Markdown myself. I write in Org mode (I talked about it in [EmacsCast episode 2](http://emacscast.rakhim.org/episode/754222a0-714c-41b6-9203-8d0dc0d6210f)) and use [ox-hugo](https://ox-hugo.scripter.co/) to generate Markdown files for Hugo to then generate static HTML. Yeah, seems like too many moving parts for the sake of the simplest page possible, but it works remarkably well and — worst case scenario — if Emacs or Org or ox-hugo go bad, I can go back to essentially the same process as before.

This is how it looks like:

1.  Go to Emacs, open my blog project (one second worth of key strokes thanks to [Projectile](https://github.com/bbatsov/projectile) and [Helm](https://github.com/emacs-helm/helm), which were also mentioned in [EmacsCast episode 2](http://emacscast.rakhim.org/episode/754222a0-714c-41b6-9203-8d0dc0d6210f)).
2.  Open shell buffer, start Hugo server, open browser.
3.  Write new post. All posts are stored in a single Org file, so I don't need to create new files. The name of the final Markdown file is generated automatically from the post title.
4.  Save Org file. New post is generated and browser is redirected or refreshed.
5.  When ready, change the Org status of the section to **DONE**.
6.  Use Magit or a single Bash script to add, commit and push files to Github.
7.  Netlify picks up the commit and builds the pages. If something goes wrong, I can see the detailed build logs.

**![](/images/posts/oxhugo.png)**

And with Org capture I can create a new draft from anywhere in Emacs with two key strokes.


## Nice things about Hugo {#nice-things-about-hugo}

There are several small things that make Hugo nicer than Jekyll for me:

1.  With `hugo server -D --navigateToChanged` the browser navigates to the changed file automatically and refreshes the page on each change. No need to refresh the page manually! Instant Markdown preview.
2.  Hugo is distributed via Homebrew, and I don't need to care about Ruby environment and dependencies like I had to with Jekyll.
3.  I have several sites, and Hugo randomizes the port if the default port is in use. A tiny nice detail.
4.  It seems much faster than Jekyll.


## Nice things about Org and ox-hugo {#nice-things-about-org-and-ox-hugo}

While this transition was mainly performed due to workcrastination, I'm pretty happy with the results. Hugo itself wouldn't be the reason to switch, it's the combination of Org + ox-hugo + hugo that makes it all worth the hassle.

Writing in Org is arguably a more pleasant experience compared to Markdown. Being able to integrate blogging into the same program that is used for planning, programming and long-form writing is very nice.

The whole blog setup, including this custom theme is available on [Github](https://github.com/freetonik/rakhim.org).
