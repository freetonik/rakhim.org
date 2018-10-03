---
date: "2016-11-29T00:00:00Z"
summary: It's extremely unlikely that you'll ever need a backup. You're probably good.
  I prefer to think about this stuff as an insurance. This is how you buy peace of
  mind.
title: Backups
categories: ["software and tools"]
slug: backup
---

I'm not going to try to convince you to backup data. I didn't do backups for the most of my life, except for some photos and videos here and there. And those weren't really backups, more like archives on external HDD's.

I use computers every day since, gosh, I guess 5th grade, and never ever did any hard drive fail on me. This is remarkable. Screens, keyboards, mice, even fans have died over the years, but not hard drives. Good old magnetic, noisy, spinning monsters.

Backup evangelists love to say how "your HDD will fail, it's inevitable". Well, yes, it will fail inevitably as you use it for years, but the truth is — you'll more likely switch computers before your drive fails.

But the truth is, it's extremely unlikely that you'll ever need a backup. You're probably good. I prefer to think about this stuff as an insurance. This is how you buy peace of mind. There are so few aspects of life where you can actually do that — pay some money (not much, too, which is great), and get some peace of mind. Medical insurance, for example, is sort of like that, but not really that good. With data backup, I can be pretty sure I will get everything back as it used to be, effectively travel back in time. Recovered data is precisely the same as lost data, so it's not really lost anymore. While my body after medical treatment is not the same anymore.

I'm not gonna go all "3-2-1 backup" on you. That's the idea that in the perfect world you need at least 3 total copies of your data, 2 of which are local but on different devices, and at least 1 copy offsite. So, if all of your files are on your computer, then you need two external hard drives and a remote hard drive (maybe one at work, in another house or in the cloud). I don't do that yet. For now my backup strategy looks like this:

1. Offsite backups with Arq (Dropbox and Amazon Cloud Drive)
2. Local backups with Time Machine and Carbon Copy Cloner

![](/images/posts/backup_strategy.jpg)

Most of the things I work on daily are on Github (personal and work), Dropbox (personal) and Google Drive (work).

Let me first explain why I said no to Backblaze and Crashplan. Long story short: I don't trust them.

### Backblaze

[Backblaze](https://www.backblaze.com/) is a beautiful, sleek guy who says "don't worry about it bro". Mac client is minimal and cool, and it "just works".

![](/images/posts/backblaze.jpg)

There are few issues with Backblaze:

- It's not *really* a backup solution. If you delete a file from your computer, then in one month it will also be deleted from Backblaze’s servers. It syncs stuff just like Dropbox does. This is why Dropbox in and of itself is not a proper backup solution.
- If you backup an external drive and disconnect it from your computer, then Backblaze will delete that backup from their servers.
- Backblaze doesn't backup 100% of files. You can remove some exceptions manually, but some of them are built in. So, I can't really have a complete copy of my boot disk, for example.
- If you need to restore files from Backblaze, **you're gonna have a bad time**. Your options are: download a Zip-archive (if your file is 10 levels deep, then you'll get all the upper level folder structure in the archive) or get a flash drive or a HDD via mail. You can't restore files in place.
- Some users say it's very fast, some say it's very slow. I can't figure out the reasons, but for me it was dead slow. It took almost 120 hours (5 days) to upload less than 200G of data.
- Android app seems to be made by a very intelligent puppy.

### Crashplan

[Crashplan](https://www.crashplan.com/) is a douchey-looking guy in an expensive suit who says "the synergy is just overwhelming in this merger". It took me a while to understand how it really works. It's called CrashPlan Online Backup and it can backup, among other places, to your external hard drive. You know, because online.

But once you get it, it's pretty great in theory. With Crashplan you can backup to any local hard drive and offsite machine (like friend's computer or any other machine in your network) for free, and with additional fees you can also backup to Crashplan's cloud.

- If you use their cloud, then it's *really* a backup solution. All your files are stored in the cloud forever<sup>*</sup>. Unlike Backblaze.
- You can restore any file to its original location or any other location. No need to download Zip-files from a cumbersome web interface.

_(* not forever)_

Crashplan Mac app is... well... ugly like hell.

<div style="text-align: center; margin-bottom: 1em;">
<img src="/images/posts/crashplan.png"/>
</div>

Look at this Java shit.

I was happy with Crashplan for the first few days, and possibilities of adding more backup destinations if I decide to go all "3-2-1" was reassuring. But it turned out I can't trust it.

Crashplan, like any other software of that type, is supposed to work in the background, doing its thing while I do mine. I was restructuring files in my photo archives, moving files from folder to folder, renaming stuff. Nothing extreme. But in few days when Crashplan said it backed everything up, I tried to restore some files to check how it works. And it just lost the whole photos folder, tens gigabytes of photos. That was the folder I was fiddling with.

I understand this is unfair. Trying to make a reliable copy of the file system while it changes is hard. But:

1. Should it fail, it must **fail gracefully**. Losing all the files is unacceptable.
2. The end user should **never worry** about this stuff. I wasn't doing some crazy hacking, I just moved files around.

Oh, and Crashplan's Android app seems to be made by a very intelligent puppy as well. Is there a software company ran by puppies I know nothing about?!

### Arq

[Arq](https://www.arqbackup.com/) is only an app for your Mac or PC. It doesn't offer any cloud backup storage itself. It's not even a guy like Backblaze or Crashplan. It's a faceless, soulless robot who says nothing. This is what backup software should be like.

![](/images/posts/arq.png)

Arq can backup to Amazon Cloud Drive, AWS, Amazon Glacier, Google Drive, Google Cloud Drive, Dropbox, OneDrive, your SFTP server or NAS. You can set multiple sources and destinations. For example, I have the following setup:

1. Home folder → Dropbox
2. Photo archive → Dropbox and Amazon Cloud Drive
3. Podcasting archive → Dropbox
3. Current video projects → Dropbox and Amazon Cloud Drive
4. Work-related podcasting archive → Google Drive

And at any point I can add other destinations, including a network attached storage.

My Mac's SSD is just 120G, but my Dropbox is 1TB. It's great to finally make all that space useful by setting Dropbox as a destination for Arq. And [Amazon Cloud Drive](https://www.amazon.com/clouddrive/home) is just a great deal — unlimited storage for $60 per year. Of course, you have to remember, that it's not really unlimited, and if you go crazy, Amazon is allowed to kick you out.

Some cool features of Arq include:

- **Local encryption**. Arq encrypts files before sending it, and sends it with SSL.
- Backups are stored in **open documented format**. Even if Arq dies and completely disappears, your encrypted data is safe and accessible.
- A very nice and straight-forward **native app** with some advanced features like CPU usage, upload rate, scheduling, data validation, budget restrictions (relevant for AWS, for example). You can also make Arq run shell scripts before and after backup sessions.
- Arq truly backups everything. All the files, any format, any size (even crazy tens-of-gigs files) **without restrictions**.
- Fixed price and no recurring fees.

![](/images/posts/arq2.png)

Arq also can [archive](https://www.arqbackup.com/arq_help/pages/archiving.html): backup a folder, click "Detach..." and Arq will stop backing it up, but will store the previous backups indefinitely. This is great if you want to backup some external drives that rarely update.

### Local backups: Time Machine and Carbon Copy Cloner

My photos and work-related audio- and video-projects live on an external drive and are backed up to the cloud along with the home folder. The whole internal SSD gets only local backups, because it's not that important. There are two things I need from this system:

1. Restore the system to a previous state. І never needed this with Macs, but I just feel safer this way when I upgrade the OS.
2. Boot from USB drive if internal drive fails. As I said, I didn't have failing drives (neither HDD's nor SSD's) in my life, but SATA cables do fail sometimes. Should that happen, I can just boot from an external drive and continue working until the problem is solved.

Time Machine is good enough for quick restoration. I use [Carbon Copy Cloner](https://bombich.com/) to make an external bootable copy. Alternatively, [SuperDuper!](http://www.shirt-pocket.com/SuperDuper/SuperDuperDescription.html) is also nice. I like CCC more because it also copies the [recovery partition](https://bombich.com/kb/ccc4/cloning-apples-recovery-hd-partition), which is used to reinstall macOS. You don't **really** need it, because all modern Macs come with a Network Recovery option.

That's it folks.
