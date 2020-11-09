---
title: "Things We Still Dont Have in 2020"
date: 2020-07-10T10:19:43+03:00
draft: true
---

**File transfer.** There is no simple way to send a file from one computer to another. The problem is only partially solved in a "perfect ecosystem in vacuum". For example, Apple's Airdrop supposedly allows to send any file to and from any Apple computer, laptop, tablet or phone. In reality, Airdrop often Just Doesn't Work™ and gives zero indication of what is wrong. Other ecosystems have their own mechanisms, but overall, if you have any computing device in 2020 and want to send any file to an arbitrary other computing device, well good luck.

Email? May be okay for small files. Larger files can only be sent if you proprietary email provider handles this use case, e.g. Gmail uploads the file to Google Drive and send a link instead. One of the numerous file-sharing web services? Yeah, I don't know about that. Just uploading my stuff to some random computer on the other side of the planet in order to share it with my friend two feet away.

In the end, many people use a messenger. Yup, that's what we got working for us in 2020. Telegram handles relatively large files without a problem. You can send any file to anyone and even to yourself. In many cases, it's the easiest way!

**Sane online shopping**. The UX of Amazon, Ebay and the myriads of smaller online shops is horrible and stuck in the negative local optimum. All of them are just limited frontends to a database. And it would've been better if it were a real frontend. I.e., users could tweak their queries to find exactly what they need. But no, the frontends are a butchered subset of SQL with questionable animated HTML checkboxes. Just to name a few failed use cases:

- You can filter by feature (e.g. IPS displays only), but can't select a set of features (e.g. IPS + VA, but not TN).
- Price range selector with pre-defined values so I can't search for "between 200€ and 400€" because someone decided to only put 100€, 500€ and 1000€+ values in a dropdown menu.

But, honestly, I never use any filters in any e-store. Because I know something. I know that items stored in their DB may have missing values. So, if I filter by "IPS", I will get `items with field 'TYPE' set to 'IPS'`. But that's not what I want. I want `items with an IPS display`. You notice the difference? The second case includes items with missing DB field, but IPS written in the description or a title or just a wrong field.

And it makes me sad that in order to get what you really want, you need to think about databases, SQL and web development edge cases.

**Selecting text on a computer**. I strongly believe that at some point selecting text will become impossible altogether. Today, however, we can still kinda select text. To copy, to save, to translate, to share. Web pages are becoming more and more selection-unfriendly. Some weird layouts force unnecessary selection, so you end up selecting the word you wanted AND the whole website's footer. Some text is actually a link with non-native behavior so you start dragging and it navigates somewhere else. Some text spawns a popover under your cursor and your selection suddenly includes the text from the tooltip. Some text is not text but a screenshot from The Other Website. But still, web pages are at least generally selectable. A PDF? Pfft, forget about it.

**Universal messaging**. The fact that a regular person today needs Whatsapp, FB Messenger, Slack and SMS is bonkers. It feels like that early period when London metro or NYC subway were divided between several independent, incompatible companies with their own tickets.

And yeah, it's totally fine... for a transitional period! But we had it already. We had ICQ, MSN, AOL, iChat. Then we though "hmm, this is stupid, let's maybe use a common protocol and stop wasting our time on this and do something useful maybe", and so we had a common protocol called XMPP, and companies created different clients and you could use Google's Messenger to talk to another arbitrary client that supports XMPP. Typing this now is so weird, I can't believe we had a brief lucid period like that. Insanity came back with full force, and now we have a bunch of other words that describe the same crap.

**Synced computers**. My dream is to have two computers that are perfectly synced. Not with Dropbox, not with dotfiles via git, but really synced. The whole filesystem, to the byte. It's impossible even if you get two identical computers hardware-wise. Despite my best effors, I still have two independent computers that requrie tinkering in order to keep somewhat similar.

**Simple video playback**. So, 15 years ago I've been watching random movies and videos with some video player software.

**Simple audio playback**.

**Notetaking**.

**A simple mobile device**.