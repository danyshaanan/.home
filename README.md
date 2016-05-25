## Debian dot-files and setup

Developed and tested on
`Linux HOSTNAME 3.2.0-4-amd64 #1 SMP Debian 3.2.78-1 x86_64 GNU/Linux`

### Root user

```bash
# Access:
ssh-keygen
vi ~/.ssh/authorized_keys

# Install:
mv -i /etc/apt/sources.list{,.bu}
cp -i /root/.home/conf/sources.list /etc/apt/
apt-get update
apt-get install vim git nginx curl ruby tree figlet

# Users:
adduser git --disabled-password
adduser bob --disabled-password

# Nginx:
mv -i /etc/nginx/sites-available/default{,.bu}
cp -i /root/.home/conf/default /etc/nginx/sites-available/
service nginx restart

# HOSTNAME:
vi /etc/hostname
vi /etc/hosts
reboot
```

### Any user

```bash
# These settings:
git clone -b debian https://github.com/danyshaanan/.home ~/.home
bash ~/.home/scripts/init.sh

# Access:
ssh-keygen
vi ~/.ssh/authorized_keys

# Node:
bash ~/.home/scripts/nvm.sh
bash
npm i -g cli-mandelbrot goatsay pm2 grunt-cli serve
```
