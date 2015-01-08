## These are my OSX user configurations files

To install on a new machine:

Install git via [Homebrew](http://brew.sh):
```bash
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
brew install git
```
clone this repo and deploy symbolic links:
```bash
git clone https://github.com/danyshaanan/.home.git ~/.home

ln -s ~/.home/.bash_profile ~/.bash_profile
ln -s ~/.home/.bashrc ~/.bashrc
ln -s ~/.home/.inputrc ~/.inputrc
ln -s ~/.home/.screenrc ~/.screenrc
ln -s ~/.home/.vimrc ~/.vimrc
touch ~/.hushlogin
```

Check out brew and node installations in `installations/brew.md` and `installations/node.md`, or get the essentials with:

```bash
brew tap phinze/homebrew-cask
brew install wget vim rename brew-cask
brew cask install iterm2 atom sublime-text truecrypt keepassx chromium vlc sequel-pro
git clone https://github.com/creationix/nvm.git ~/.nvm
cd ~/.nvm && git checkout `git describe --abbrev=0 --tags`
bash
nvm install stable && nvm alias default stable
npm i -g nsyrc tcmount cli-mandelbrot pm2 grunt-cli fuck-you
```
