
alias du='du -shc'
alias cp='cp -i'
alias rm='rm -iv'
alias mv='mv -i'
alias ls='ls -G'


alias ll='ls -lhF'
alias l='clear && ll'
alias la='ll -A'
alias ..='cd .. && ll'
alias nospaces='rename s/\ /./g' #replaces spaces with dots in target files
alias here='cd -P .'
alias d='date +"%Y%m%d"'
alias t='date +"%H%M%S"'
alias gst='clear && git status'


gitick () { echo $1 >> $1 && git add $1 && git commit -m $1; }
