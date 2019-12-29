+++
title = "Fastmail setup with Emacs, mu4e and mbsync on macOS"
author = ["Rakhim Davletkaliyev"]
draft = true
creator = "Emacs 26.3 (Org mode 9.1.9 + ox-hugo)"
+++

I guess it was inevitable. Once you embrace Emacs, at some point you gonna want to do email in it. Honestly, I don't think I'll stick with it, but as an experiment, I want to try and see whether it makes sense to use Emacs as an email client.

These are my requirements:

1.  **Fastmail as email provider.** It's a solid service with normal IMAP (unlike Gmail with their weird, non-standard implementation which makes it very hard to use anything other than their web interface). I moved from Gmail to Fastmail almost two years ago and I highly recommend the service. You can use my [referral code](https://ref.fm/u19462080) to get 10% off.
2.  **No obligations.** I want to be able to use whatever third party email client or continue using Fastmail's web interface without any caveats. This means I don't want to setup something in Emacs that will only work there (like custom tagging which doesn't propagate to the server).
3.  **Fast and simple.** I dislike elaborate, finicky setups and slowdowns.

The setup consists of the following parts:

1.  Fastmail IMAP server. This doesn't require any setup other than signing up for Fastmail.
2.  **mbsync** — a command-line utility which syncs IMAP server with a local directory in [Maildir](https://en.wikipedia.org/wiki/Maildir) format. This has nothing to do with Emacs. Even if you're not interested in doing email in Emacs, having a full local copy of your mailbox may be a good idea. mbsync does exactly that. In can sync both ways, so if I just move a file (which corresponds to a single message) from folder to folder, and then run mbsync again, this change will propagate to the server.
3.  **[mu](https://www.djcbsoftware.nl/code/mu/)\*** — a command line email client which works with Maildir storage. It doesn't deal with the server directly, instead, it just read your local file system. It's very fast!
4.  ****[mu4e](https://www.djcbsoftware.nl/code/mu/mu4e.html)**** — Emacs package that comes with mu. Provides an interface to mu.


## Installing and configuring mbsync {#installing-and-configuring-mbsync}

Install mbsync with homebrew:

```sh
brew install isync
```

(The package is called `isync`, but the binary is called `mbsync`.)

Mbsync uses `~/.mbsyncrc` for configuration. [This page](https://manpages.debian.org/unstable/isync/mbsync.1.en.html) describes all options. Here's my config, with comments:

```sh
# First section: remote IMAP account
IMAPAccount fastmail
Host imap.fastmail.com
Port 993
User myemailaddress@mydomain.com
# For simplicity, here I just read my password from another file.
# For better security, you should use GPG https://gnupg.org/
PassCmd "cat ~/.mbsync-fastmail"
SSLType IMAPS
SSLVersions TLSv1.2

IMAPStore fastmail-remote
Account fastmail

# ---
# This section describes the local storage
MaildirStore fastmail-local
Path ~/Maildir/
Inbox ~/Maildir/INBOX
# The SubFolders option allows to represent all
# IMAP subfolders as local subfolders
SubFolders Verbatim

# This section  a "channel", a connection between remote and local
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

Few details about the channel worth mentioning:

1.  `Patterns *` — sync all folders. Alternatively, you can select only certain folders to sync.
2.  `Expunge None` — don't destroy messages neither locally nor remotely. Details later.
3.  `CopyArrivalDate` — makes sure the date of the arrival stays the same when you move messages around. Without this option, moving a message to another folder will reset the date of the message.
4.  `Create Slave` — when new folders are added on server, create them locally.

Now run `mbsync` and wait for it to download messages:

```sh
mbsync -a
```


## Installing and configuring mu and mu4e {#installing-and-configuring-mu-and-mu4e}

I use Emacs port for macOS, which you can install like so:

```sh
brew tap railwaycat/emacsmacport
brew cask install emacs-mac
```

Once installed, verify that `which emacs` points to a valid Emacs executable, and `emacs --version=` shows the correct version:

```sh
→ which emacs
/usr/local/bin/emacs

→ ls -la /usr/local/bin/emacs
/usr/local/bin/emacs -> /Applications/Emacs.app/Contents/MacOS/Emacs.sh

→ emacs --version
GNU Emacs 26.3
```

Now, install mu:

```sh
brew info mu
```

mu comes with mu4e by default. To verify, check for presence of elisp files in `/usr/local/share/emacs/site-lisp/mu/mu4e`:

```sh
→ ls /usr/local/share/emacs/site-lisp/mu/mu4e
mu4e-actions.el   mu4e-contrib.elc  mu4e-main.el      mu4e-meta.elc	 mu4e-vars.el	org-mu4e.elc
mu4e-actions.elc  mu4e-draft.el     mu4e-main.elc     mu4e-proc.el	 mu4e-vars.elc	org-old-mu4e.el
mu4e-compose.el   mu4e-draft.elc    mu4e-mark.el      mu4e-proc.elc	 mu4e-view.el	org-old-mu4e.elc
mu4e-compose.elc  mu4e-headers.el   mu4e-mark.elc     mu4e-speedbar.el	 mu4e-view.elc
mu4e-context.el   mu4e-headers.elc  mu4e-message.el   mu4e-speedbar.elc  mu4e.el
mu4e-context.elc  mu4e-lists.el     mu4e-message.elc  mu4e-utils.el	 mu4e.elc
mu4e-contrib.el   mu4e-lists.elc    mu4e-meta.el      mu4e-utils.elc	 org-mu4e.el
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
 mu4e-view-show-addresses 't
 mu4e-compose-format-flowed nil
 mu4e-date-format "%y/%m/%d"
 mu4e-headers-date-format "%Y/%m/%d"
 mu4e-change-filenames-when-moving t
 mu4e-attachments-dir "~/Downloads"

 mu4e-maildir       "~/Maildir"   ;; top-level Maildir
 ;; note that these folders below must start with /
 ;; the paths are relative to maildir root
 mu4e-refile-folder "/Archive"    ;; saved messages
 mu4e-sent-folder   "/Sent"       ;; folder for sent messages
 mu4e-drafts-folder "/Drafts"     ;; unfinished messages
 mu4e-trash-folder  "/Trash")     ;; trashed messages

;; this setting allows to re-sync and re-index mail
;; by pressing U
(setq mu4e-get-mail-command  "mbsync -a")
```

That's it! Run `M-x mu4e` and after a few final setup questions mu4e should be running. Check out [keybindings](https://www.djcbsoftware.nl/code/mu/mu4e/Keybindings.html#Keybindings) for it.


### Caveat: deletion vs. expunge {#caveat-deletion-vs-dot-expunge}

By default, mu4e will

```emacs-lisp
(fset 'my-move-to-trash "mTrash")
(define-key mu4e-headers-mode-map (kbd "d") 'my-move-to-trash)
(define-key mu4e-view-mode-map (kbd "d") 'my-move-to-trash)
```
