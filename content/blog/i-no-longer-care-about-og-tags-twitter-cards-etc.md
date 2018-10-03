+++
title = "I no longer care about og tags, twitter cards, etc."
author = ["Rakhim Davletkaliyev"]
date = 2018-09-04T15:44:00+03:00
categories = ["uncool"]
draft = false
creator = "Emacs 26.1 (Org mode 9.1.9 + ox-hugo)"
+++

Enough.

Facebook, Twitter and other social networks have their own markup formats that "enable any web page to become a rich object in a social graph". For the most part it means that if you want to make your link look nice when people share it, you have to set some meta tags.

```html
<meta property="og:title" content="The Wonderful" />
<meta property="og:type" content="article" />
<meta property="og:image" content="/images/cover.jpg" />
```

This is a noble idea in the abstract, and one more attempt at creating semantic web, since you can not only specify titles and cover images for shared links, but detailed meta information as well, like the type of content, authors, dates, etc. Facebook is a for-profit company that just made all the decisions and created their own protocol. It's not open - there is no way for the public to participate in its development, unlike W3C's work. The only reason people are using this protocol is because often their livelihood depends on the amount of traffic that comes from Facebook. Of course they'd like to make their links look good in Facebook posts!

Some other social media sites support og tags with certain quirks. Like, you provide a cover image, but different sites crop them differently because they want consistent media proportions on their side. So, now your content looks link still looks like garbage and #webdesign Medium blog posts are full of "how to make your link look awesome in LinkedIn in 2018" tutorials.

The sheer amount of resources the industry pours into made up problems like that...

I decided not to care about this for my personal projects anymore. If someone wouldn't click on a link to my site because the link looks less attractive than a flashy colorful image, so be it.
