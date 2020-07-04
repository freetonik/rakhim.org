+++
title = "The price of complexity"
date = 2019-11-20T12:48:00+02:00
+++

Computer programmers often talk about tackling complexity, yet they thrive on complexity. I believe tech people experience a constant dilemma: on one hand, we want things to be simple and straightforward; on the other hand we love complex structures and engineering marvels.

I think about this today as I'm performing some cleanup work on my blog. It runs on Hugo, content is written in Org mode, code is published on Github and the final website is deployed to Netlify. That's a lot of moving parts, and, honestly, it feels excessive. Yet I love this setup.

Lately I've been trying to be conscious and mindful about the price my mind pays for all this complexity. I'm not a good programmer by any means, so your mileage may vary, but it takes an enormous amount of mental energy for me to re-understand something I already figured out before. Take Hugo for example, a flexible and powerful static website generator. Jekyll, which I used before Hugo, is complex, too, but Hugo drives me crazy sometimes. It's a multi-layered system of interconnected logic and it took me a whole day to [move from Jekyll](/2018/09/moved-from-jekyll-to-hugo-and-ox-hugo/).

_**Intermission**: I just spent 5 minutes trying to create a relative hyperlink to that other blog post, and couldn't. It took me a while to realize I'm in Org mode now, not in Markdown, my syntax was wrong. You know what a Wordpress or Ghost user would've done? Clicked a link button in their rich WYSIWYG editor and had finished the blog post by this time already._

Every time I need to make some changes to the setup — fix layouts, add pages, refactor templates — I feel completely lost. It happens rare enough for my brain to forget the structure and conventions. And this is the case for a dozen of software projects I touch throughout the year.

This feeling of being lost is similar to un-pausing a video game that was on pause for 6 months. I know I've been into this, but right now I don't even know what buttons to press.

There are ways to fight this. One is to dramatically reduce complexity in the first place, maybe even sacrifice some of the features. My setup can be technically replaced by a bunch of HTML files, for example. Or switch to a "normal" thing like Ghost or Wordpress. Oh, and don't host them yourself, but pay someone to take care of it.

Another way is to somehow capture the knowledge for easy retrieval. My problem with Hugo is that I rarely touch it, so I forget. I should at least add a README file for myself, explaining the current setup and structure. Keeping documentation in sync with code is another problem, sigh...

So far, I only know one good way of solving this: teach. I should just make a course about Hugo on Codexpanse, that'll force me to really understand it and devise a good mental model.
