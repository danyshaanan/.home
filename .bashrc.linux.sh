
if [[ `uname` != 'Linux' ]]; then
	return
fi

alias run='xdg-open' #this should be cross-distribution
alias df='df -hT | grep --invert-match -e "none.*tmpfs"'
alias ll='ls -lh -F --color --group-directories-first'
alias renrot='renrot -n "%Y%m%d%H%M%S-%C"'
alias updg='sudo apt-get update && sudo apt-get upgrade'
alias screenshot='import -display :0.0 -window root ~/screenshot_`d`_`t`.png' #by imagemagick.
