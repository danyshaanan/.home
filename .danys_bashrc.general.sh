
unset MAILCHECK

# Git branch in prompt.
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

##aliases

#Load platform specific files:
unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then #Linux: #TODO: test this line when I'll have access to a linux box.
  if [ -f ~/.danys_bashrc.linux.sh ]; then
    . ~/.danys_bashrc.linux.sh
  fi
elif [[ "$unamestr" == 'Darwin' ]]; then #osx:
  if [ -f ~/.danys_bashrc.osx.sh ]; then
    . ~/.danys_bashrc.osx.sh
  fi
fi

if [ -f ~/.danys_bashrc.work.sh ]; then
  . ~/.danys_bashrc.work.sh
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
alias llnsl='ll | grep -v "@ \->"'
alias llt='tree -hFvC --noreport --filelimit 40 --dirsfirst -L 2'
alias vimencrypt='vim -u ~/.vimencrypt -x'
#new:
alias y=''
alias d='date +"%Y%m%d"'
alias t='date +"%H%M%S"'
alias nospaces='rename s/\ /_/g' #replaces spaces with underline in target files
alias tolowercase='rename y/A-Z/a-z/' #renames target files to lowercase
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
insertend () { mkdir $1; mv *$1 $1; rmdir $1; }

#count the number of files/directories in a dir:
files () {
	for i in $*
	do 
		echo "`tree $i | wc -l` : $i"
	done
}

#ls without symlinks:
sl() {
	ls -l ${*} | grep -ve '^l'
}

everysec () { while true; do clear && ${*} && sleep 1 ; done }

#Remember! cron does not run as your user, hence does not uses your aliases!!

#######################

alias exifdaterename='exiftool "-FileName<CreateDate" -d "%Y%m%d_%H%M%S.%%e"'

#######################


