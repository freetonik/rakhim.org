+++
title = "Make Firefox faster and nicer on macOS"
author = ["Rakhim Davletkaliyev"]
date = 2018-10-01T13:53:00+03:00
draft = false
creator = "Emacs 26.1 (Org mode 9.1.9 + ox-hugo)"
+++

I'm trying Firefox as my primary browser on all devices. It has some great features like [Multi-Account containers](https://support.mozilla.org/en-US/kb/containers) in addition to being a non-Google product, which is an increasingly rare feature on the web nowadays.

Firefox on macOS is somewhat sluggish at the moment. If you try the current stable version 62 or current beta version 63, you'll notice some lags and general slow response time for even the simplest tasks like changing tabs.

Mozilla will probably fix these issues in the upcoming releases. Meanwhile, I found the following steps improve the performance significantly.


## Download Firefox 63 or higher {#download-firefox-63-or-higher}

As of today (October 1, 2018), stable release version is 62. Version 63 is currently in beta, and I recommend using it today. It's very robust, I haven't had any problems with it. There are some important [performance improvements in it](https://www.mozilla.org/en-US/firefox/63.0beta/releasenotes/).

You can also try Firefox Nightly, it is currently version 64 on the dark side. Nightly is an unstable testing and development platform. By default, Nightly sends data to Mozilla — and sometimes their partners. There are some rough edges, I wouldn't recommend it for daily browsing.


## Disable animations {#disable-animations}

By default Firefox has lots of animations. I find them unnecessary and distracting, but more importantly, they contribute to the general sluggishness.

Go to `about:config` in the address bar. Search for `animate` and set at least  `cosmeticAnimations` to `false`.

Fullscreen transition takes 0.2 seconds both ways. Make them instant by setting the following to `0 0`:

-   `full-screen-api.transition-duration.enter`
-   `full-screen-api.transition-duration.leave`


## Disable Pocket {#disable-pocket}

Firefox embedded Pocket into the browser. A questionable move, but it's easy to disable (unless you use it, of course). Set `extensions.pocket.enabled` to `false`.


## Other stuff {#other-stuff}

These are not related to performance, but can make your Firefox experience a bit nicer.

Set to true:

-   `modalHighlight` highlight all the search results.
-   `browser.tabs.closeTabByDblclick` close tab by double-clicking on it.
-   `abs.multiselect` shift-click on tabs to select a group of tabs and do something with them (for example, detach from window).
-   `insecure_connection_text.enabled` write "Not Secure" in the address bar of non-https pages (like Chrome does). Additionally, enable a broken padlock icon with `security.insecure_connection_icon.enabled`.

Minor things:

-   `general.smoothScroll.mouseWheel.durationMaxMS` set `200` to make scrolling speed similar to Chrome.
-   `geo.enabled` set to `false` to disable geolocation.
-   `extensions.screenshots.disabled` set to `true` to disable the screenshot extension. It's actually pretty handy, check it out before disabling.
