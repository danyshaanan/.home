
unset MAILCHECK

export PATH="$PATH:$HOME/.home/bin"

[ -s ~/.nvm/nvm.sh ] && . ~/.nvm/nvm.sh

# History setup:
HISTCONTROL=ignoredups:ignorespace # don't put duplicate lines in the history. See bash(1) for more options
shopt -s histappend # append to the history file, don't overwrite it
HISTSIZE=4000 # Number of commands in history file
HISTFILESIZE=4000 # Number of lines in history file

# check the window size after each command and, if necessary, update the values of LINES and COLUMNS.
shopt -s checkwinsize
shopt -s histverify

#############################################################

#existing: (to run the original, use: `which ORIGINAL`)
alias du='du -shc'
alias cp='cp -i'
alias rm='rm -iv'
alias mv='mv -i'
alias ls='ls -G'
alias top='top -o cpu'
alias grep='grep --color'
alias mkdir='mkdir -p'

#varients:
alias ll='ls -lhF'
alias l='clear && ll'
alias la='ll -A'
alias laa='`which ls` -la | `which grep` " \."' #only hidden
alias ls1='/bin/ls -1'
alias ..='cd .. && ll'
alias x='exit'
alias c='clear'

#ls varients:
alias lk='ls -lSrG'         # sort by size, biggest last
alias lc='ls -ltcrG'        # sort by and show change time, most recent last
alias lu='ls -lturG'        # sort by and show access time, most recent last
alias lt='ls -ltrG'         # sort by date, most recent last
alias lm='ls -alG |more'    # pipe through 'more'
alias lr='ls -lR'           # recursive ls

alias abstree='tree `pwd` --prune --noreport --dirsfirst -fixaFC -supgD'
alias absll='abstree -L 1'

#file management:
alias llt='tree -hFvC --noreport --filelimit 40 --dirsfirst -L 2'
alias ducks='du -cksh * | sort -rn|head -11' # Lists folders and files sizes in the current folder
alias oldnospaces='rename s/\ /_/g' #replaces spaces with underline in target files
alias nospaces='rename s/\ /./g' #replaces spaces with dots in target files
alias nobrackets='rename s/\[\\\[\\\]\]//g' #removes square brackets
alias underscorestodots='rename s/_/./g' #replaces underlines with dots in target files
alias nounderlines='rename s/_/\./g'
alias tolowercase='rename y/A-Z/a-z/' #renames target files to lowercase
alias ___removebefore='rename s/.*___//g'
alias ___removeafter='rename s/___.*\\././g'
nametab () { export PROMPT_COMMAND='echo -ne "\033]0;'$*'\007"'; } # { printf "\e]1;$*\a"; }
lsj () { node -e 'console.log(JSON.stringify(require("fs").readdirSync("'$1'" || "."),0,2))'; }
insert () { mkdir $1; mv $1* $1; rmdir $1; }
insertend () { mkdir $1; mv *$1 $1; rmdir $1; }
insertall () { mkdir $1; mv *$1* $1; rmdir $1; }
files () { for i in $*; do echo "`tree $i | wc -l` : $i"; done;} #count files/dirs

#bash utils:
alias here='cd -P .'
alias y=''
alias d='date +"%Y%m%d"'
alias t='date +"%H%M%S"'
alias tm='tcmount'
alias tu='tcmount -u'
alias tc='truecrypt -t -c --volume-type=normal -k="" --random-source=/dev/urandom'

alias copydir='pwd | pbcopy'
alias cdpaste='cd `pbpaste`'
# = () { echo "scale=4; ${*}" | bc ; }
g(){ ack $@ --color-match=green --color-filename=blue --smart-case; } # search

#alias goatsay='cowsay -f ~/.home/cowfiles/goat.cow -T "V "'
#alias goatthink='cowthink -f ~/.home/cowfiles/goat.cow -T "V "'

#var:
alias vimencrypt='vim -u ~/.home/conf/vimencrypt -x'
alias profileme="history | awk '{print \$2}' | awk 'BEGIN{FS=\"|\"}{print \$1}' | sort | uniq -c | sort -n | tail -n 20 | sort -nr"
alias everysec='watch -n 1'

#######################

#which cowsay > /dev/null && cowsay "Happy `date '+%A'` $USER! Moooooooo!!"
