
export PATH="$PATH:$HOME/.home/bin:/usr/games"

[ -s ~/.nvm/nvm.sh ] && . ~/.nvm/nvm.sh
[ -s ~/.rvm/scripts/rvm ] && . ~/.rvm/scripts/rvm

# History setup:
HISTCONTROL=ignoredups:ignorespace # don't put duplicate lines in the history. See bash(1) for more options
shopt -s histappend # append to the history file, don't overwrite it
HISTSIZE=4000 # Number of commands in history file
HISTFILESIZE=4000 # Number of lines in history file

# check the window size after each command and, if necessary, update the values of LINES and COLUMNS.
shopt -s checkwinsize
