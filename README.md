## Debian dot-files and setup

Developed and tested on
`Linux HOSTNAME 3.2.0-4-amd64 #1 SMP Debian 3.2.78-1 x86_64 GNU/Linux`

### Global and root setup

###### Dotfiles
```bash
git clone -b debian https://github.com/danyshaanan/.home ~/.home
bash ~/.home/scripts/init.sh
```

###### apt-get
```bash
mv -i /etc/apt/sources.list{,.bu}
cp -i /root/.home/conf/sources.list /etc/apt/
apt-get update
apt-get install vim git nginx curl ruby tree figlet
```

###### Node
```bash
bash ~/.home/scripts/nvm.sh
bash
npm i -g cli-mandelbrot goatsay pm2 grunt-cli serve
```

###### Nginx
```bash
mv -i /etc/nginx/sites-available/default{,.bu}
cp -i /root/.home/conf/default /etc/nginx/sites-available/
service nginx restart
```

###### HOSTNAME
```bash
vi /etc/hostname
vi /etc/hosts
reboot
```

### Add users

```bash
adduser git --disabled-password
mkdir -m 700 ~git/.ssh && chown -R git ~git/.ssh
cat ~/.ssh/authorized_keys >> ~git/.ssh/authorized_keys

# deluser --remove-home git
```

As the user, run the 'Dotfiles' and 'Node' sections above.
