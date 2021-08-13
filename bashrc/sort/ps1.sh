
# \t is time
# \u is user
# \h is comp
# \w is working directory

which git-prompt > /dev/null 2> /dev/null && PS1GITPROMPT='$(git-prompt)'
which node       > /dev/null 2> /dev/null && PS1NODEVERSION='[$(node -v | sed "s/^v//")]'
which ruby       > /dev/null 2> /dev/null && PS1RUBYVERSION='[$(ruby -v | sed "s/^ruby //" | sed "s/ .*//")]'
cat /tmp/.tempc  > /dev/null 2> /dev/null && PS1TEMPC='[$(cat /tmp/.tempc | egrep -m 1 .)°]'

PS1="\t $PS1TEMPC$PS1GITPROMPT \w> "

# To enable die temp in PS1, run:
# sudo crontab ~/.home/conf/root-crontab

