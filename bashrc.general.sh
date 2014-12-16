
unset MAILCHECK

# Git branch in prompt.
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
} #TODO: why when running 'sudo su root' the PS1 var stays but this function does not? fix

gitick () { echo $1 >> $1 && git add $1 && git commit -m $1; }

##aliases

#existing: (to run the original, use: `which ORIGINAL`)
alias grep='grep --color'
alias du='du -shc'
alias cp='cp -i'
alias rm='rm -iv'
alias mv='mv -i'
alias cd='cd -P'
alias mkdir='mkdir -p'
alias top='top -o cpu'
alias ls1='/bin/ls -1'
alias ls='ls -G'
#varients:
alias ll='ls -alF'
alias l='clear && ll'
alias la='ll -A'
alias laa='`which ls` -la | `which grep` " \."' #only hidden
alias ..='cd .. && ll'
alias llnsl='ll | grep -v "@ \->"'
alias llt='tree -hFvC --noreport --filelimit 40 --dirsfirst -L 2'
alias vimencrypt='vim -u ~/.home/vimencrypt -x'
alias ducks='du -cksh * | sort -rn|head -11' # Lists folders and files sizes in the current folder
alias profileme="history | awk '{print \$2}' | awk 'BEGIN{FS=\"|\"}{print \$1}' | sort | uniq -c | sort -n | tail -n 20 | sort -nr"
#ls:
alias lk="ls -lSrG"         # sort by size, biggest last
alias lc="ls -ltcrG"        # sort by and show change time, most recent last
alias lu="ls -lturG"        # sort by and show access time, most recent last
alias lt="ls -ltrG"         # sort by date, most recent last
alias lm="ls -alG |more"    # pipe through 'more'
alias lr="ls -lR"           # recursive ls
#new:
alias y=''
alias d='date +"%Y%m%d"'
alias t='date +"%H%M%S"'
alias nospaces='rename s/\ /_/g' #replaces spaces with underline in target files
alias nounderlines='rename s/_/\./g'
alias tolowercase='rename y/A-Z/a-z/' #renames target files to lowercase
alias tm='tcmount'
alias tu='tcmount -u'
alias tua='truecrypt -l | grep -oe "[^ ]\+$" | tu' #truecrypt unmount all
alias py='time python'
alias gst='clear && git status'
alias copydir='pwd | pbcopy'
alias cdpaste='cd `pbpaste`'
#if a truecrypt volume creation fails, try to create one without a filesystem, and then:
#truecrypt --filesystem=none /path/to/file.tc
#mkfs.ext3 /dev/mapper/truecryptx

##functions:
#bc calculator:
= () { echo "scale=4; ${*}" | bc ; }
#create a dir and move all files with that dir as a prefix into it:
#(this will always cause an error, for trying to move the dir into itself)
insert () { mkdir $1; mv $1* $1; rmdir $1; }
insertend () { mkdir $1; mv *$1 $1; rmdir $1; }
insertall () { mkdir $1; mv *$1* $1; rmdir $1; }

#count the number of files/directories in a dir:
files () {
	for i in $*
	do
		echo "`tree $i | wc -l` : $i"
	done
}

# search
g(){
  ack $@ --color-match=green --color-filename=blue --smart-case
}

#ls without symlinks:
sl() {
	ls -l ${*} | grep -ve '^l'
}

alias everysec='watch -n 1'

#Remember! cron does not run as your user, hence does not uses your aliases!!

#######################

alias exifrenamecreated='exiftool "-FileName<CreateDate" -d "%Y%m%d_%H%M%S.%%e"'
alias exifrenamemodified='exiftool "-FileName<FileModifyDate" -d "%Y%m%d_%H%M%S.%%e"'

#######################

#cowsay "Happy `date '+%A'` $USER! Moooooooo!!" # Make sure that cowsay exists
