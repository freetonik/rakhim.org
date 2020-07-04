+++
title = "Fundamental Attribution of Ability Error"
date = 2020-07-01T18:29:00+02:00
+++


There's this thing called **fundamental attribution error:**

> In [social psychology](https://en.wikipedia.org/wiki/Social_psychology), **fundamental attribution error** (**FAE**), also known as **correspondence bias** or **attribution effect**, is the tendency for people to under-emphasize situational explanations for an individual's observed behavior while over-emphasizing dispositional and personality-based explanations for their behavior. This effect has been described as "the tendency to believe that what people do reflects who they are"

Basically, when you make a mistake — it's due to some good reason, but when someone else makes a mistake — it's because they are bad people who make mistakes.

I was thinking about this pattern of observing reality when reading other people's blog posts describing life situations, technical setups, whatever. Let's say I'm reading about some developer's perfect programming environment setup. They share all the steps involved in creating this extremely complex system with automation, lots of inter-connected software, scripts and hardware addons. In the end, they conclude with how happy they are about the setup, how it helped their productivity and everything is peachy.

Inspired, I try to reproduce a _portion_ of the described system, but quickly face the reality: things aren't connecting as nicely as I expected, bugs and compatibility issues force me to write dirty hacks, and in the end the whole thing is just waiting to break.

I'm not doing this anymore nowadays. Every time I see a cool setup, be it OS, Terminal, Emacs, Vim or even some iOS automations, I just think how hard it is to maintain all of that and go to my Emacs config looking for something new to disable.

But for the longest time I seem to have been making a Fundamental Attribution of Ability Error. I was thinking that people's setups are in fact perfect. That there's something wrong with me, that my attempts to build a convoluted architecture fail because I'm a bad programmer. With experience and after talking to a lot of people, I realized how much of a facade many of us create when describing our creations.

No, your Emacs setup does not have "zero issues". Sorry, I don't believe you. It has issues and it breaks and you fix it sometimes. No, your Karabiner + Hammerspoon + AppleScripts + KeyboardMaestro setup with two hundred custom keyboard shortcuts is not "maintenance free". No, your dotfiles repo with Ansible script does not guarantee a one-command-setup on a new machine.

As a result, I'm finding myself more and more conservative and pragmatic. 'Vanilla' and 'default are my favorite words. I don't get into zsh or fish, even though I understand the benefits over Bash. Bash is okay. My small config with a bunch of aliases had served me well. I love Doom Emacs, but I come back to my minimalist personal configuration with continuously shrinking number of customizations. I use Make and Bash-scripts for building.

Mythical "reproducible configuration" does not exist. I mean, it does, with scripts, Ansible, Docker or nixOS, sure, but then you have to constantly maintain the thing that creates maintenance-free environments. Is there a catch here?..
