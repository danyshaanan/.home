
if [ -f ~/.bashrc.general.sh ]; then
    . ~/.bashrc.general.sh
fi


PS1="$PR_GREEN%n$PR_RED:$PR_GREEN%d$PR_RED>$PR_NO_COLOR "
RPS1="$PR_BLUE%D:%*$PR_NO_COLOR"


#Load platform specific files:
unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then #Linux: #TODO: test this line when I'll have access to a linux box.
  if [ -f ~/.zshrc.linux.sh ]; then
    . ~/.zshrc.linux.sh
  fi
elif [[ "$unamestr" == 'Darwin' ]]; then #osx:
  if [ -f ~/.zshrc.osx.sh ]; then
    . ~/.zshrc.osx.sh
  fi
fi



