## These are my OSX user configurations files

To install on a new machine:

```bash
git clone https://github.com/danyshaanan/.home.git ~/.home
bash ~/.home/init.sh
```

To setup git, brew, brew-cask, node, and useful installations:
```bash
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install git vim rename tree ruby caskroom/cask/brew-cask
brew cask install iterm2 atom truecrypt keepassx google-chrome chromium vlc sequel-pro arduino

git clone https://github.com/creationix/nvm.git ~/.nvm
cd ~/.nvm && git checkout `git describe --abbrev=0 --tags` && bash
nvm install stable && nvm alias default stable

npm i -g tcmount nsyrc cli-mandelbrot grunt-cli fuck-you
```

Check out the `installations` directory for more initial setup.
