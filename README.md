## OSX initial setup

On a new computer:
* Boot with Command-R to reformat the drive to a case-sensitive filesystem.
* Open terminal and type `git` to trigger xcode's git installations.

### Install these dot files:

```bash
git clone https://github.com/danyshaanan/.home.git ~/.home
bash ~/.home/init.sh
```

### Run the OSX init setup script:

```bash
bash ~/.home/bin/scripts/osx_settings.sh
```

### Install brew, brew-cask, nvm, and rvm:

```bash
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
sudo chown -R `whoami` /usr/local
```

```bash
brew install caskroom/cask/brew-cask
```

```bash
# remove old node version with http://tinyurl.com/removenode
git clone https://github.com/creationix/nvm.git ~/.nvm
cd ~/.nvm && git checkout `git describe --abbrev=0 --tags` && bash
nvm install stable && nvm alias default stable
# required `[ -s ~/.nvm/nvm.sh ] && . ~/.nvm/nvm.sh` is included in .home
```

```bash
curl -L https://get.rvm.io | bash -s stable --autolibs=enabled --ignore-dotfiles
rvm install 2.2.1
# required `[ -s ~/.rvm/scripts/rvm ] && . ~/.rvm/scripts/rvm` is included in .home
```

### Main installations

```bash
brew install git unrar imagemagick mpg123 youtube-dl
brew install cowsay figlet tree rename trash wget curl
brew install ffmpeg --with-libvpx --with-libvorbis --with-fdk-aacc
```

```bash
brew cask install iterm2 atom osxfuse keepassx google-chrome vlc transmission
brew cask install qlcolorcode qlmarkdown
brew cask install quicklook-json qlprettypatch quicklook-csv betterzipql
brew cask install arduino # ftdi drivers also required
```

```bash
npm i -g nsyrc tcmount dupes cli-mandelbrot geoexif osx-wifi-cli imagesnapjs
npm i -g normit pm2 grunt-cli serve fuck-you
```

### More installations

```bash
brew install bash-completion git-extras gpg pass ack
brew install mdbtools mtr ssh-copy-id sshfs vim p7zip
brew install ddrescue duff testdisk fcrackzip links
brew install exif exiftool imagemagick freetype jp2a mplayer sox webp
brew install ruby ack haskell-platform python nginx watch source-highlight
brew install cdparanoia lame abcde
brew install spark wdiff
```

```bash
brew cask install chromium firefox sublime-text
brew cask install sequel-pro sqlite-database-browser nmap
```

```bash
npm i -g gulp karma-cli node-inspector jasmine-node tape torrent
```
