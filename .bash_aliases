##aliases

#Load platform specific files:
unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then #TODO: test this line when I'll have access to a linux box.
  #linus:
  alias df='df -hT | grep --invert-match -e "none.*tmpfs"'
  alias ll='ls -lh -F --color --group-directories-first'
  alias renrot='renrot -n "%Y%m%d%H%M%S-%C"'
elif [[ "$unamestr" == 'Darwin' ]]; then
  #osx:
  export PATH=/usr/local/bin:/usr/local/mysql/bin:$PATH
  alias run='open'
  alias df='df -h | grep --invert-match -e "none.*tmpfs"'
  alias ll='ls -lh -F'
fi


#existing: (to run the original, use: `which ORIGINAL`)
alias grep='grep --color'
alias du='du -shc'
alias cp='cp -i'
alias rm='rm -iv'
alias mv='mv -i'
alias cd='cd -P'
alias mkdir='mkdir -p'
#varients:
alias l='clear && ll'
alias la='ll -A'
alias laa='`which ls` -la | `which grep` " \."' #only hidden
alias ..='cd .. && ll'
alias llt='tree -hFvC --noreport --filelimit 40 --dirsfirst -L 2'
alias vimencrypt='vim -u ~/.vimencrypt -x'
#new:
alias y=''
alias d='date +"%Y%m%d"'
alias t='date +"%H%M%S"'
alias run='xdg-open' #this should be cross-distribution
alias updg='sudo apt-get update && sudo apt-get upgrade'
alias nospaces='rename s/\ /_/g' #replaces spaces with underline in target files
alias tolowercase='rename y/A-Z/a-z/' #renames target files to lowercase
alias screenshot='import -display :0.0 -window root ~/screenshot_`d`_`t`.png' #by imagemagick.
alias tm='sudo truecrypt -t -k "" --protect-hidden=no' #truecrypt mount file
alias tu='sudo truecrypt -t -d' #truecrypt unmount file or dir
alias tua='truecrypt -t -l | grep -oe "[^ ]\+$" | tu' #truecrypt unmount all
alias tmssh='tm ~/.home/.ssh.tc ~/.ssh' #truecrypt mount .ssh.tc into ~/.ssh
#if a truecrypt volume creation fails, try to create one without a filesystem, and then:
#truecrypt --filesystem=none /path/to/file.tc
#mkfs.ext3 /dev/mapper/truecryptx

##functions:
#bc calculator:
= () { echo "scale=4; ${*}" | bc ; }
#create a dir and move all files with that dir as a prefix into it:
#(this will always cause an error, for trying to move the dir into itself)
insert () { mkdir $1; mv $1* $1; rmdir $1; }

everysec () { while true; do clear && ${*} && sleep 1 ; done }

#Remember! cron does not run as your user, hence does not uses your aliases!!

#######################

alias exifdaterename='exiftool "-FileName<CreateDate" -d "%Y%m%d_%H%M%S.%%e"'

#######################

if [ -f ~/.bash_aliases_private ]; then
    . ~/.bash_aliases_private
fi


