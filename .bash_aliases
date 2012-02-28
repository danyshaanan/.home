##aliases
#existing: (to run the original, use: `which ORIGINAL`)
alias grep='grep --color'
alias df='df -hT | grep --invert-match -e "none.*tmpfs"'
alias du='du -shc'
alias cp='cp -i'
alias rm='rm -iv'
alias mv='mv -i'
alias cd='cd -P'
alias mkdir='mkdir -p'
#varients:
alias ll='ls -lh -F --color --group-directories-first'
alias l='clear && ll'
alias la='ll -A'
alias laa='`which ls` -la | `which grep` " \."' #only hidden
alias ..='cd .. && ll'
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

##functions:
#bc calculator:
= () { echo "scale=4; ${*}" | bc ; }
#create a dir and move all files with that dir as a prefix into it:
#(this will always cause an error, for trying to move the dir into itself)
insert () { mkdir $1; mv $1* $1; rmdir $1; }


#Remember! cron does not run as your user, hence does not uses your aliases!!




