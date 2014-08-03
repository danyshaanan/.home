
if [[ `uname` != 'Darwin' ]]; then
	return
fi

export NODE_PATH="/usr/local/bin/node"
export NODE_HOME='/usr/local/bin'
export PATH=~/bin:/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:/usr/local/opt/ruby/bin:/usr/local/share/npm/bin:$PATH
export PYTHONPATH=$PYTHONPATH:/usr/local/lib/python2.7/site-packages/
export PS1='\t:\u@\h:\w$(parse_git_branch)$ ' #TODO: check if to make linux as well #TODO: this is exported to root on su, while the funciton isn't
export LSCOLORS='gxfxcxdxbxegedabagaced'
export LESSOPEN="| /usr/local/bin/src-hilite-lesspipe.sh %s"
export LESS=' -R '

alias run='open'
alias df='df -h | grep --color=no -e "^Filesystem\|^/dev/"'
alias ll='ls -lh -F'
alias screenshot='imageSnap'
alias green='screenshot /dev/null > /dev/null'
alias mtr='sudo mtr'
alias today='grep `date +"%m/%d"` /usr/share/calendar/calendar.*'
alias truecrypt='/Applications/TrueCrypt.app/Contents/MacOS/Truecrypt -t' #always use terminal mode
alias pyserver='python -m SimpleHTTPServer'
alias unmount='diskutil umount'
alias wifi='osx-wifi-cli'

osxsleep() {
	sleep `echo "scale=4; 60 * ${1:-0}" | bc` && pmset sleepnow
}

#ding
#usage:
#npm install ; ding
function ding(){
  if [[ $? != 0 ]] ; then
    afplay /System/Library/Sounds/Basso.aiff
  else
    afplay /System/Library/Sounds/Glass.aiff
  fi
}
