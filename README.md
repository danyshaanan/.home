#### These are my user configurations files

A few points:

* In order to manage them easily, keep them in ~/.home , remove all relavent dot files under ~ , and run this: `cd && for f in $(ls -A .home/); do ln -s .home/$f ; done`
* If you're into Truecrypt, the tmssh command will mount ~/.home/.ssh.tc into ~/.ssh/ , and will let you keep your keys safe.
* If you do that, consider also having .my.cnf be a symlink to ~/.ssh/.my.cnf (inside the tc volume of course).
