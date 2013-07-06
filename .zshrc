

if [ -f ~/.bashrc.general.sh ]; then
  . ~/.bashrc.general.sh
fi

if [ -f ~/.zshrc.general.sh ]; then
  . ~/.zshrc.general.sh
fi

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