## These are my user configurations files

To install on a new machine:

Install git via [Homebrew](http://brew.sh):
```bash
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
brew install git
```
clone this repo and deploy symbolic links:
```bash
curl -fsSl https://raw.github.com/danyshaanan/.home/go/install.sh | sh
```
or just run [the command lines one by one](https://github.com/danyshaanan/.home/blob/go/install.sh).



Usually after that, I'd run something like this:

```bash
brew install wget trash vim rename tree exiftool imagemagick youtube-dl node python watch figlet

brew tap phinze/homebrew-cask
brew install brew-cask

brew cask install iterm2 atom truecrypt keepassx chromium vlc sublime-text utorrent sequel-pro

npm i -g nsyrc tcmount dupes cli-mandelbrot imagesnapjs
npm i -g forever grunt-cli node-inspector serve fuck-you
```
(There are more recommended installations in the `installations` directory)
