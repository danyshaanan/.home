#!/bin/bash

for F in bash_profile bashrc inputrc screenrc vimrc; do ln -s $HOME/.home/.$F $HOME/.$F; done
touch ~/.hushlogin
bash
