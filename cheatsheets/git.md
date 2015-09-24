
# git


### git reset


* `git reset --soft` - moved whatever HEAD points to
* `git reset (--mixed)` - also set the Index to look like that
* `git reset --hard` - also set the working dir look like that

This means that `--hard` will keep your status clean, `--mixed` will keep the files as they are, hence showing them as uncommitted changes, and `--soft` will keep the index as it is, hence showing the files as committed changes.

Committing those un/committed changes will create a new commit with an identical snapshot of the previous one, with the snapshot used in the reset as its parent.

This is good for squashing un-pushed commits.

Read more about git reset [here](http://git-scm.com/2011/07/11/reset.html).


### Delete orphan snapshots

```bash
git for-each-ref --format='delete %(refname)' refs/original | git update-ref --stdin
git reflog expire --expire=now --all
git gc --prune=now
```

### Remove sensitive data from the whole history:

https://help.github.com/articles/remove-sensitive-data/

### Config

Set pull to rebase by default instead of merge:
```bash
git config --global --bool pull.rebase true
git config --global branch.autosetuprebase always
```

Example config:
```
[user]
	name = YOUR NAME
	email = YOUR_EMAIL@example.com
[alias]
    lg = log -p
    gui = !sh -c '/usr/local/opt/git/libexec/git-core/git-gui'
    lg = log --oneline --decorate --graph --all
[core]
	autocrlf = false
	ignorecase = false
	editor = /usr/bin/vim
[push]
	default = simple
[color]
	ui = true
[branch]
	autosetuprebase = always
[pull]
	rebase = true
```
