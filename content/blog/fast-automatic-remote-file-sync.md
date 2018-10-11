+++
title = "Fast automatic remote file sync"
author = ["Rakhim Davletkaliyev"]
draft = true
creator = "Emacs 26.1 (Org mode 9.1.9 + ox-hugo)"
+++

Our dev machines at Hexlet are all remote, since the project is too big and resource-heavy for laptops and such. Most of the devs work directly on the remote machines using vim. I used Sublime before Emacs, and seamlessly synced all changes using an excellent [SFTP package](https://wbond.net/sublime%5Fpackages/sftp). There are similar (and free) packages for [VS Code](https://marketplace.visualstudio.com/items?itemName=liximomo.sftp), also.

The canonical solution for Emacs is [TRAMP](https://www.gnu.org/software/tramp/). It's pretty cool, but not suitable for my workflow. I want instant feedback when navigating the project with Projectile and searching all files using ag. TRAMP is slow as hell for these.

A possible solution is to sync files from local to remote using rsync and do it automatically when files change. Doing full folder sync is slow. Luckily, rsync has `--files-from` option. You can specify a list of files to sync.

Thanks to [Alistair Phillips](https://www.alistairphillips.com/2018/09/05/file-sync-with-fswatch-and-rsync/), I didn't have to write the script myself. Here is what I got in `sync.sh`:

```bash
#!/usr/bin/env bash
rm --force /tmp/remote-server-rsync.txt
rm --force /tmp/remote-server-rsync-relative.txt

echo "Starting initial sync..."
rsync --verbose -azP --delete --exclude='.git/' --exclude='.DS_Store' --exclude='tmp/' . remote_user@XXX.XXX.XXX.XXX:/home/remote_user/hexlet
echo ""

echo "Watching..."

fswatch --exclude=".git" --batch-marker=EOF -xn . | while read file event; do
    if [ $file = "EOF" ]; then
       printf "%s\n"  "${list[@]}" > /tmp/remote-server-rsync.txt
       sed -e "s,/Users/rakhim/code/hexlet/,," /tmp/remote-server-rsync.txt > /tmp/example.org-rsync-relative.txt
       echo "Beginning sync..."
       rsync --verbose --files-from=/tmp/example.org-rsync-relative.txt . remote_user@XXX.XXX.XXX.XXX:/home/remote_user/hexlet
       echo "sync completed"
       echo "Watching..."
       list=()
    else
       list+=($file)
    fi
done
```
