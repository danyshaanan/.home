These are my user configurations files
--------------------------------------

```bash
cd ~/

git clone https://github.com/danyshaanan/.home.git

ln -s ~/.home/.bash_profile ~/.bash_profile
ln -s ~/.home/.bashrc ~/.bashrc
ln -s ~/.home/.inputrc ~/.inputrc
ln -s ~/.home/.screenrc ~/.screenrc
ln -s ~/.home/.vimrc ~/.vimrc

mkdir -p ~/.vim/colors/ && ln -s ~/.home/vimColors/peaksea.vim ~/.vim/colors/

FILE=~/Library/Application\ Support/Sublime\ Text\ 2/Packages/User/Preferences.sublime-settings
mv "$FILE" "$FILE.orig"
ln -s ~/.home/Preferences.sublime-settings "$FILE"
```

(Make sure to remove the originals first).
