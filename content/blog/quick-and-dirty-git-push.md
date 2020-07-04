+++
title = "Quick and dirty git push"
date = 2019-11-22T14:52:00+02:00
+++

Very often, all I need from git is to stage all changes, commit them and push to master. I've made two scripts for this. One in bash:

```bash
gitapush() {
  if [ $# -eq 0 ];
  then
    echo "Enter message: "
    read message
  else
    message=$1
  fi

  if [ -z "$message" ];
  then
    message=$(date +%d-%b-%H:%M)
  fi

  git add .
  git commit -m "$message"
  git push origin master
}
```

`gitapush` stands for "git all push" (I guess), and it's pretty dumb:

1.  If argument is provided, use it as message, commit and push (e.g. `gitapush fix x`)
2.  If argument isn't provided, as for a message.
    1.  If a message was entered, commit and push.
    2.  If not, generate a message from current date, commit and push.

To achieve a similar thing in Emacs, I use magit:

```emacs-lisp
(defun my-magit-stage-all-and-commit-and-push () (interactive)
       (let ((m (read-string "Commit message: ")))
         (unless (string= "" m)
           (magit-stage-modified)
           (magit-call-git "commit" "-m" m)
           (magit-call-git "push" "origin" "master"))))

(global-set-key (kbd "s-G") 'my-magit-stage-all-and-commit-and-push)
```

This one doesn't generate an automatic commit message, though. I bound it to `Cmd+Shift+G`, because `Cmd+G` is how I open the magit status pane.
