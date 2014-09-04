## These are my user configurations files

To install on a new machine:

```bash
# get Homebrew: (http://brew.sh)
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
# Install git:
brew install git
# Clone this repo:
git clone https://github.com/danyshaanan/.home.git ~/.home
# Symlink needed files to home:
ln -s ~/.home/.bash_profile ~/.bash_profile
ln -s ~/.home/.bashrc ~/.bashrc
ln -s ~/.home/.inputrc ~/.inputrc
ln -s ~/.home/.screenrc ~/.screenrc
ln -s ~/.home/.vimrc ~/.vimrc
```

Usually after that, I'd run something like this:

```bash
brew install wget trash vim rename tree exiftool imagemagick youtube-dl node python watch figlet

brew tap phinze/homebrew-cask
brew install brew-cask

brew cask install iterm2 atom truecrypt keepassx chromium vlc sublime-text utorrent sequel-pro

npm i -g nsyrc tcmount dupes cli-mandelbrot imagesnapjs
npm i -g forever grunt-cli node-inspector serve fuck-you
```
