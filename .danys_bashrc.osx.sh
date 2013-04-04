
export PATH=~/bin/:/usr/local/bin:/usr/local/sbin/:/usr/local/mysql/bin:/usr/local/Cellar/ruby/1.9.3-p194/bin:$PATH
export PYTHONPATH=$PYTHONPATH:/usr/local/lib/python2.7/site-packages/ 
export PS1='\t:\u@\h:\w$(parse_git_branch)$ ' #TODO: check if to make linux as well #TODO: this is exported to root on su, while the funciton isn't

alias run='open'
alias df='df -h | grep "/dev/"'
alias ll='ls -lh -F'
alias screenshot='imageSnap'
alias green='screenshot /dev/null > /dev/null'
alias mtr='sudo mtr'
alias today='grep `date +"%m/%d"` /usr/share/calendar/calendar.*'
alias subl='/Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/subl'
alias pyserver='python -m SimpleHTTPServer'
