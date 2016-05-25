
export LS_OPTIONS='--color=auto'
eval "`dircolors`"

alias ls='ls $LS_OPTIONS -G'

alias ll='ls -lhF'
alias la='ll -A'
alias l='clear && ll'
alias ..='cd .. && ll'
