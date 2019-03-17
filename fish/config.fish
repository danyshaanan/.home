
set PATH /Users/dany/.home/bin /usr/local/bin $PATH

alias du 'du -shc'
alias cp 'co -i'
alias rm 'rm -iv'
alias mv 'mv -i'
alias top 'top -o cpu'
alias grep 'grep --color'
alias mkdir 'mkdir -p'

alias ll 'ls -lhF'
alias l 'clear; and ll'
alias la 'll -A'
alias .. 'cd ..; and ll'

alias nospaces 'rename s/\ /./g'
alias nounderscore 'rename s/_/./g'
alias tolowercase 'rename y/A-Z/a-z/'

alias d 'date +"%Y%m%d"'
alias t 'date +"%H%M%S"'

alias vimencrypt 'vim -u ~/.home/conf/vimencrypt -x'

#### OSX #######################################################################

alias run "open"
alias screenshot 'imageSnap'
alias green 'screenshot /dev/null > /dev/null'
alias today 'grep (date +"%m/%d") /usr/share/calendar/calendar.*'
alias unmount 'diskutil umount'
alias wifi 'osx-wifi-cli'
alias mylocalip 'ifconfig | grep -Eo "inet (addr:)?([0-9]*\.){3}[0-9]*" | grep -Eo "([0-9]*\.){3}[0-9]*" | grep -v "127."'
alias lock '/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend'
alias df 'df -h | grep --color=no -e "^Filesystem\|^/dev/"'

function setcomputername
	echo "changing computer name to $argv"
	sudo scutil --set ComputerName $argv
	sudo scutil --set HostName $argv
	sudo scutil --set LocalHostName $argv
	sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string $argv
end

#### git #######################################################################

alias gst 'clear; and git status'

function gitick
  echo $argv >> $argv; and git add $argv; and git commit -m $argv
end

function gh
  set repopath $HOME/.gh/$argv
  if not test -d $repopath
    git clone git@github.com:$argv.git $repopath
  end
  cd $repopath
end

function ghj
  gh danyshaanan/$argv
end

################################################################################

function insert
  mkdir $argv
  mv $argv* $argv
  rmdir $argv
end

function insertend
  mkdir $argv
  mv *$argv $argv
  rmdir $argv
end

function insertall
  mkdir $argv
  mv *$argv* $argv
  rmdir $argv
end

function files
  for i in (ls $argv)
    echo (tree $i | wc -l)" : $i"
  end
end

################################################################################

function nvm
  type bass >/dev/null ^/dev/null; and bass source ~/.nvm/nvm.sh ';' nvm $argv
end

nvm --version >/dev/null ^/dev/null
