# Node

#### Install Nodejs with NVM

Make sure you don't have node installed.
If you do, [read here](http://tinyurl.com/removenode)
on how to remove it.

Install NVM:
```bash
git clone https://github.com/creationix/nvm.git ~/.nvm
cd ~/.nvm
git checkout `git describe --abbrev=0 --tags`
```

Set nvm to load from your rc files:
```bash
[ -s ~/.nvm/nvm.sh ] && source ~/.nvm/nvm.sh
```
(Already in this repo within `bashrc.osx.sh`)


Install Node versions:
```bash
#nvm install 0.9
#nvm install 0.10
#nvm install unstable
nvm install stable
#nvm ls
#nvm use stable
```

Set default version for new terminals:
```bash
nvm alias default stable
```
