## Linux server initial setup

For some specific Debian servers

### Root user

```bash
ssh-keygen # and follow prompts
touch ~/.ssh/authorized_keys
mv -i etc/apt/sources.list etc/apt/sources.list.bu
cp -i files/etc.apt.sources.list etc/apt/sources.list
apt-get update
apt-get install vim git nginx curl ruby tree figlet

adduser git --disabled-password # and follow prompts
adduser bob --disabled-password # and follow prompts
```

### Any user

```bash
git clone -b debian https://github.com/danyshaanan/.home.git ~/.home
bash ~/.home/init.sh

ssh-keygen # and follow prompts
touch ~/.ssh/authorized_keys

# NVM:
git clone https://github.com/creationix/nvm.git ~/.nvm
cd ~/.nvm && git checkout `git describe --abbrev=0 --tags` && bash
nvm install stable && nvm alias default stable

npm i -g cli-mandelbrot goatsay pm2 grunt-cli serve
```

By root:
```bash
cat ~/.ssh/authorized_keys >> ~bob/.ssh/authorized_keys
```
