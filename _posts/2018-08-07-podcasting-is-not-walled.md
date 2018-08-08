---
published: true
layout: post
title: Podcasting is not walled (yet)
summary: >-
  "We, developers and software engineers, also have the moral responsibility to
  educate the public about the way the internet was supposed to be. Open,
  un-censorable, with underlying protocols put in place to ensure it's a forest,
  not a walled garden."
---
I've launched two podcasts recently (check out [EmacsCast](http://emacscast.rakhim.org/)) and received lots of feedback. One of the perplexing things people said was "*that's great, but how do I subscribe, it's not on iTunes/Google Podcasts?*"

I had a similar experience 10+ years ago when I started podcasting, but today it's much worse. It worries me a lot.

Podcasts are simply RSS feeds with links to media files (usually mp3s). A podcast is basically a URL. And podcast clients are special browsers. They check that URL regularly and download new episodes if the content of the URL changes (new link added). That's it, no magic, no special membership or anything else required. The technology is pretty "stupid" in a good way.

Video podcasts were a thing! It was basically distributed, un-censorable YouTube where both viewers and creators had full control over their things.

Ever since tech companies started waging war against RSS, podcast distribution became visually RSS-free. What do you do to subscribe? Easy, just search in the app! For the majority of iOS users that app is Apple Podcasts, and recently Google made their own "default client" for Android — Google Podcasts. 

It looks like podcast clients are similar to web browsers and just provide a way to consume content, but the underlying listings make them very different. Corresponding services are actually isolated catalogs. When you perform a search on Apple Podcasts, you aren't searching for podcasts. **You are searching for Apple-approved podcasts.** And if the thing you're looking for is not there, then... well, you get nothing. 

Imagine web browsers worked that way. You want to visit my blog, but you don't know what URLs are, you've never seen or heard of things like `https://rakhim.org`. There's no address bar in your browser, just a "search catalog" field.

I tell you my name and you type it into Safari. If my blog was already added to Apple Websites Catalogue, then great, you can visit my site. 

But if I haven't added my blog to their catalog, or, even worse, I've tried, but it wasn't approved for some reason, then I'll be just sitting here, shouting "dude, just go to `https://rakhim.org`, it's **there!**", but you'd have no idea what to do with that information. For you, _my site doesn't exist_.

![future_of_the_web.png]({{site.baseurl}}/images/posts/future_of_the_web.png)

Your browser is capable of reaching my blog, but the feature is hidden or about to disappear. I can teach you to find some obscure menu item, but I can't do it for all potential visitors. 

Most Podcast clients still accept RSS. Apple Podcasts, iTunes, PocketCasts, OverCast, PodcastAddict. 

![itunespodcast.png]({{site.baseurl}}/images/posts/itunespodcast.png)

![iospodcasts.jpeg]({{site.baseurl}}/images/posts/iospodcasts.jpeg)

Google Play Music doesn't say anything explicitly, but you can just put RSS URL into the search field and it works. For now. I won't be surprised if these apps gradually and silently remove this feature. 

Lately, there are lots of discussions about Apple, Facebook, YouTube, and Spotify banning Alex Jones's Infowars podcast. And most of the debate comes down to either "they have a right" or "they shouldn't censor". 

The thing is, **this shouldn't matter**. If some company decides not to include an URL in their catalog, this shouldn't really matter. An URL is an URL, the content is there. Both Apple and Google are pretty much hiding the feature that makes podcasting as free and un-censorable as websites. 

And it works! For most people, RSS for podcasts don't exist, and a corporation is in charge of what they can listen to.

[Last time](https://rakhim.org/2018/07/software-shouldnt-fail) I was talking about programmers' responsibilities when it comes to software reliability. Today I want to add: we, developers and software engineers, also have the moral responsibility to educate the public about the way the internet was supposed to be. Open, un-censorable, with underlying protocols put in place to ensure it's a forest, not a walled garden.
