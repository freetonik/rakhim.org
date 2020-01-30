+++
title = "Fastmail setup with Emacs, mu4e and mbsync on macOS"
author = ["Rakhim Davletkaliyev"]
date = 2020-01-30T13:09:00+02:00
draft = false
creator = "Emacs 26.3 (Org mode 9.3.1 + ox-hugo)"
+++

I guess it was inevitable. Once you embrace Emacs, at some point you gonna want to do email in it. Honestly, I don't think I'll stick with it, but as an experiment, I want to try and see whether it makes sense to use Emacs as an email client.

These are my requirements:

1.  **Fastmail as email provider.** It's a solid service with normal IMAP (unlike Gmail with their weird, non-standard implementation which makes it very hard to use anything other than their web interface). I moved from Gmail to Fastmail almost two years ago and I highly recommend the service. You can use my [referral code](https://ref.fm/u19462080) to get 10% off.
2.  **No obligations.** I want to be able to use whatever third party email client or continue using Fastmail's web interface without any caveats. This means I don't want to setup something in Emacs that will only work there (like custom tagging which doesn't propagate to the server).
3.  **Fast and simple.** I dislike elaborate, finicky setups and slowdowns.

The setup consists of the following parts:

1.  Fastmail IMAP server. This doesn't require any special configuration.
2.  **mbsync** — a command-line utility which syncs IMAP server with a local directory in [Maildir](https://en.wikipedia.org/wiki/Maildir) format. This has nothing to do with Emacs. Even if you're not interested in doing email in Emacs, having a full local copy of your mailbox may be a good idea. mbsync does exactly that. In can sync both ways, so if I just move a file (which corresponds to a single message) from folder to folder, and then run mbsync again, this change will propagate to the server.
3.  **[mu](https://www.djcbsoftware.nl/code/mu/)** — a command line email client which works with Maildir storage. It doesn't deal with the server directly, instead, it just read your local file system. It's very fast!
4.  **[mu4e](https://www.djcbsoftware.nl/code/mu/mu4e.html)** — Emacs package that comes with mu. Provides an interface to mu.


## Installing and configuring mbsync {#installing-and-configuring-mbsync}

Install mbsync with homebrew (the package is called `isync`, but the binary is called `mbsync`):

```bash
brew install isync
```

Mbsync uses `~/.mbsyncrc` for configuration. [This page](https://manpages.debian.org/unstable/isync/mbsync.1.en.html) describes all options. Here's my config, with comments:

```bash
# First section: remote IMAP account
IMAPAccount fastmail
Host imap.fastmail.com
Port 993
User myemailaddress@mydomain.com
# For simplicity, this is how to read the password from another file.
# For better security you should use GPG https://gnupg.org/
PassCmd "cat ~/.mbsync-fastmail"
SSLType IMAPS
SSLVersions TLSv1.2

IMAPStore fastmail-remote
Account fastmail

# This section describes the local storage
MaildirStore fastmail-local
Path ~/Maildir/
Inbox ~/Maildir/INBOX
# The SubFolders option allows to represent all
# IMAP subfolders as local subfolders
SubFolders Verbatim

# This section a "channel", a connection between remote and local
Channel fastmail
Master :fastmail-remote:
Slave :fastmail-local:
Patterns *
Expunge None
CopyArrivalDate yes
Sync All
Create Slave
SyncState *
```

Few details about the channel options worth mentioning:

1.  `Patterns *` — sync all folders. Alternatively, you can select only certain folders to sync.
2.  `Expunge None` — don't destroy messages neither locally, nor remotely. Details later.
3.  `CopyArrivalDate` — makes sure the date of the arrival stays the same when you move messages around. Without this option, moving a message to another folder will reset the date of the message.
4.  `Create Slave` — when new folders are added on server, create them locally.

Now run `mbsync` and wait for it to download messages:

```bash
mbsync -a
```

For me, around 50k messages were synced in a few minutes.


## Installing and configuring mu and mu4e {#installing-and-configuring-mu-and-mu4e}

I use Emacs port for macOS, which you can install like so:

```bash
brew tap railwaycat/emacsmacport
brew cask install emacs-mac
```

Once installed, verify that `which emacs` points to a valid Emacs executable, and `emacs --version` shows the correct version:

```bash
→ which emacs
/usr/local/bin/emacs

→ ls -la /usr/local/bin/emacs
/usr/local/bin/emacs -> /Applications/Emacs.app/Contents/MacOS/Emacs.sh

→ emacs --version
GNU Emacs 26.3
```

Now, install mu:

```bash
brew install mu
```

And let it index the Maildir:

```bash
mu index --maildir=~/Maildir
```

Now you can check if everything worked by trying a command-line search:

```bash
mu find hello
```

mu comes with mu4e by default. To verify, check for presence of elisp files in `/usr/local/share/emacs/site-lisp/mu/mu4e`:

```bash
→ ls /usr/local/share/emacs/site-lisp/mu/mu4e
mu4e-actions.el   mu4e-contrib.elc  mu4e-main.el  ...
```

Now load these files in Emacs and enable mu4e. Put the following in your Emacs config:

```emacs-lisp
(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/mu/mu4e")
(require 'mu4e)
```

And add some configuration.

```emacs-lisp
(setq
 mue4e-headers-skip-duplicates  t
 mu4e-view-show-images t
 mu4e-view-show-addresses t
 mu4e-compose-format-flowed nil
 mu4e-date-format "%y/%m/%d"
 mu4e-headers-date-format "%Y/%m/%d"
 mu4e-change-filenames-when-moving t
 mu4e-attachments-dir "~/Downloads"

 mu4e-maildir       "~/Maildir"   ;; top-level Maildir
 ;; note that these folders below must start with /
 ;; the paths are relative to maildir root
 mu4e-refile-folder "/Archive"
 mu4e-sent-folder   "/Sent"
 mu4e-drafts-folder "/Drafts"
 mu4e-trash-folder  "/Trash")

;; this setting allows to re-sync and re-index mail
;; by pressing U
(setq mu4e-get-mail-command  "mbsync -a")
```

That's it! Run `M-x mu4e` and after a few final setup questions mu4e should be running. Check out [keybindings](https://www.djcbsoftware.nl/code/mu/mu4e/Keybindings.html#Keybindings) for it.


### Caveat 1: deletion vs. expunge {#caveat-1-deletion-vs-dot-expunge}

By default, when you mark a message to be deleted, mu4e will apply the "Trashed" flag. Fastmail automatically destroys the messages flagged this way, as per IMAP standard. Unfortunately, there is no way to stop Fastmail from doing that.

Instead of total deletion, I want to move messages to the "Trash" folder. I can simply use "move" command of mu4e, but it'd be nicer to use `d` button (deletion) for that. The following piece of elisp remaps the `d` button to "move to Trash folder" action. This way, neither mu4e nor Fastmail destroy the message.

```emacs-lisp
(fset 'my-move-to-trash "mTrash")
(define-key mu4e-headers-mode-map (kbd "d") 'my-move-to-trash)
(define-key mu4e-view-mode-map (kbd "d") 'my-move-to-trash)
```


### Caveat 2: Spam reporting {#caveat-2-spam-reporting}

I was worried about not being able to report spam messages back to Fastmail. Turns out it wasn't an issue: in Fastmail settings, you can turn on "Spam learning" for a folder. Fastmail will scan a folder daily and learn any new messages as spam. So, I don't need to explicitly report spam, all I need is to move spammy messages to "Spam" folder.


## Sending mail {#sending-mail}

mu4e re-uses Gnus’ `message-mode` for writing mail and inherits its configuration. For sending via SMTP, mu4e uses `smtpmail`. Minimal configuration looks like this:

```emacs-lisp
(setq
   message-send-mail-function   'smtpmail-send-it
   smtpmail-default-smtp-server "smtp.fastmail.com"
   smtpmail-smtp-server         "smtp.fastmail.com")
```

When using SMTP for the first time, Emacs prompts you for the user name and password to use, and then offers to save the information. By default, Emacs stores authentication information in a file `~/.authinfo`.


## Links {#links}

1.  [Emacs SMTP Library (smtpmail) documentation](https://www.gnu.org/software/emacs/manual/html%5Fmono/smtpmail.html)
2.  [Mu4e user manual](https://www.djcbsoftware.nl/code/mu/mu4e/index.html)
3.  [List of mu4e tutorials](http://pragmaticemacs.com/mu4e-tutorials/)
