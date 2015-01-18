
# If not running interactively, don't do anything
[ -z "$PS1" ] && return

for TYPE in 'general' 'osx' 'linux' 'work' 'crap' 'ps1' 'gitignored'
do
  FILE="$HOME/.home/bashrc/$TYPE.sh"
  test -f $FILE && . $FILE
done

#echo "sleep 0.1" >> ~/.bashrc
