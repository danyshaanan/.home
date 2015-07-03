
# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Notice that files are loaded by alphabetical order
for FILE in ~/.home/bashrc/*.sh; do . $FILE; done

#echo "sleep 0.1" >> ~/.bashrc
