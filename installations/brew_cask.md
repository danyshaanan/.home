# brew cask

### Install brew cask
```bash
brew tap phinze/homebrew-cask
brew install brew-cask
```

### Installations
```bash
brew cask install iterm2 atom
brew cask install truecrypt keepassx multibit
brew cask install google-chrome chromium firefox
brew cask install imagealpha imageoptim vlc phoenix-slides
brew cask install sublime-text brackets utorrent
brew cask install sequel-pro sqlite-database-browser github
```

### Fix Finder
```bash
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzipql webp-quicklook suspicious-package && qlmanage -r
defaults write com.apple.finder QLEnableTextSelection -bool true && killall Finder
```
