+++
title = "Dumb Down the Context Until the Problem Goes Away"
author = ["Rakhim Davletkaliyev"]
date = 2018-09-14T21:10:00+03:00
tags = ["good"]
draft = false
creator = "Emacs 26.3 (Org mode 9.1.9 + ox-hugo)"
+++

At work we use SCSS and HAML, so I rarely write pure HTML and CSS there. But for small side projects and my personal blog I tend to stick with the simplest (and dumbest) possible tools. This week I was working on a refreshed look for this blog. Being a good modern man, I tried to stick with `em` or `rem` for sizing and typography.

Using `em` means adding state to your specs, and I don't like this. Looking at a particular element, it can be impossible to understand what `em` means. So `rem` it is.

The value `rem` is "equal to the computed value of font-size on the root element", so starting with this:

```nil
html {
  font-size: 21px;
}
```

we suppose to get a universal and stable variable. `10rem` now means `210px`. Cool? Not so much.

I wrote a simple media query to make headers smaller on narrow screens:

```nil
@media (max-width: 34rem) {
  h1 {
    font-size: 2.369rem;
  }
}
```

But it doesn't work at the specified break point of `34rem = 714px`. Turns out that in media queries `rem` means "initial value of font-size", as per spec[^fn:1]. It's `16px` in most browsers.

You have two lines of code near one another, and the same symbol means different things. Check out this [demonstration](https://fvsch.com/browser-bugs/rem-mediaquery/). And you dare to complain about mutations in your imperative programming language!

[Using `em`'s in media queries brings problems](https://adamwathan.me/dont-use-em-for-media-queries/) as well. So, in the end, pixels are the only units that behave consistently across all browsers and don't add hidden qualities to your styles.

I then thought okay, I can get around this problem by using `calc`, which seems to be supported in all browsers nowadays.  Nope, it doesn't work in media queries.

The first thought that came after that is almost a reflex for many web developers alike: just use some tools on top of this ugly and inconsistent language!

A pre-compiler like SCSS provides variables and calculations and other sweet features. It can seamlessly generate final CSS if you enable a watcher, or even better, set up something like Gulp or Webpack (oh, god). But then it'll be kind of difficult to use the web inspector in the browser, since it shows the final CSS, but I never work with it directly.

Oh, no worries, you can generate source maps for SASS/SCSS. Magic[^fn:2]!

But wait... While this solves my problem, it adds a tremendous amount of complexity. Is it worth it? Clearly, not in my case, but for a huges project like Hexlet at my main job it clearly does. Where is the threshold? How does one know when it's worth to invest into a set of new abstractions that comes with their own quirks and problems?

It's a difficult question, but for me and my small projects I found it important to remind myself: resist complexity at all costs, resist adding new things into the system. If my problem asks for a solution that involves additional tools or systems, first and foremost consider dumbing the whole thing down so that the problem goes away. By regressing to pixels, which are so "not modern", I managed to avoid a whole bag of cruft being put on top of this primitive project. The system became dumber. It's a win for me.

This is a weak example, I agree, so let me provide another one. Few years ago I needed to launch a small wiki site. Many popular wiki engines (like MediaWiki) are way too complex and feature-rich, so I looked for simpler alternatives. I found a nice Ruby library[^fn:3] and spend few hours setting it up, providing custom templates and styles. I was happy with the result, but then I found myself daunted by the worst part: deploy and maintenance.

Of course, setting up a server by hand is a no-no, so I had to write an Ansible recipe for Ubuntu Rails environment. Accidental complexity involved in this problem became so large I started forgetting what I was trying to achieve.

It took me some time to realize that the primary audience for this wiki will actually be much more comfortable editing text directly via Git rather than fiddle with a web interface. And if it's hosted on GitHub, I don't have to worry about authorization and accounts. I still needed it to run on my domain with some specific HTML, so I just made a simple Jekyll site and provided links to quickly edit and send pull requests via GitHub.

I had problems associated with deployment and maintenance, and instead of adding tools as solutions, I dumbed the whole context so that the problems went away.

Note that these problems are often of accidental complexity type. Intrinsic, real problems don't surrender this easily.

If playing with lots of inter operating tools is fun, by all means go for it. As long as you _remember_ and _realize_ what is going on. Complexity is not inherently bad, it's just sort of cunning when you're not mindful.

[^fn:1]: <https://www.w3.org/TR/css3-mediaqueries/>
[^fn:2]: <https://robots.thoughtbot.com/sass-source-maps-chrome-magic>
[^fn:3]: <https://github.com/goll>
