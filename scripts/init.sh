#!/bin/bash

for NAME in bash_profile bashrc inputrc screenrc vimrc editorconfig nvmrc
do
  DEST=$HOME/.$NAME
  [ -f $DEST ] && mv $DEST $DEST.moved.$(date +"%Y%m%d.%H%M%S")
  ln -s $HOME/.home/.$NAME $DEST
done


touch ~/.hushlogin
bash
