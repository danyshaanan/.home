
# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Notice that files are loaded by alphabetical order
for DIR in ~/.home/bashrc/*; do
  for FILE in $DIR/*.sh; do
    . $FILE;
  done
done

#echo "sleep 0.1" >> ~/.bashrc
