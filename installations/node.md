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

Reload bash with:
```bash
bash
```

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

Notice that modules installed globally with NPM
should be installed once per Node installation:
```bash
$ nvm use 0.10
Now using node v0.10.35
$ npm i -g cli-mandelbrot
#... installation finished
$ cli-mandelbrot
#... module working
$ nvm use 0.9
Now using node v0.9.12
$ cli-mandelbrot
-bash: cli-mandelbrot: command not found
```

# NPM

### Installations
```bash
npm i -g nsyrc tcmount git-repos dupes cli-mandelbrot geoexif jsserver
npm i -g pm2 grunt grunt-cli karma-cli node-inspector jasmine-node serve
```

### OSX only
```bash
npm i -g imagesnapjs osx-wifi-cli fuck-you
```
