
[ `uname` == 'Darwin' ] || return

if which brew >/dev/null; then
	BASHCOMP="`brew --prefix`/etc/bash_completion"
	[ -f "$BASHCOMP" ] && . "$BASHCOMP"
fi

export NODE_PATH="/usr/local/bin/node:/usr/local/lib/node_modules"
export NODE_HOME='/usr/local/bin'
export PATH=~/bin:/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:/usr/local/opt/ruby/bin:/usr/local/share/npm/bin:$PATH
export PYTHONPATH=$PYTHONPATH:/usr/local/lib/python2.7/site-packages/
export LSCOLORS='gxfxcxdxbxegedabagaced'
export LESSOPEN="| /usr/local/bin/src-hilite-lesspipe.sh %s"
export LESS=' -R '

export PATH="$PATH:$HOME/.rvm/bin"
[ -s ~/.rvm/scripts/rvm ] && . ~/.rvm/scripts/rvm

alias run='open'
alias df='df -h | grep --color=no -e "^Filesystem\|^/dev/"'
alias screenshot='imageSnap'
alias green='screenshot /dev/null > /dev/null'
alias mtr='sudo mtr'
alias today='grep `date +"%m/%d"` /usr/share/calendar/calendar.*'
alias pyserver='python -m SimpleHTTPServer'
alias unmount='diskutil umount'
alias wifi='osx-wifi-cli'
alias mylocalip='ifconfig | grep -Eo "inet (addr:)?([0-9]*\.){3}[0-9]*" | grep -Eo "([0-9]*\.){3}[0-9]*" | grep -v "127."'
alias eject='drutil eject' # remove when cds will finally die
alias updatebrewcask='brew update && brew upgrade brew-cask && brew cleanup && brew cask cleanup'
alias lock='/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend'
alias remotelogin='sudo systemsetup -setremotelogin' # on or off

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

setcomputername () {
	echo "changing computer name to $1"
	sudo scutil --set ComputerName $1
	sudo scutil --set HostName $1
	sudo scutil --set LocalHostName $1
	sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string $1
}
