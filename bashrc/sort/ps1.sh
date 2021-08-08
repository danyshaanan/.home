
# \t is time
# \u is user
# \h is comp
# \w is working directory

which git-prompt > /dev/null 2> /dev/null && PS1GITPROMPT='[$(git-prompt)] '
which node       > /dev/null 2> /dev/null && PS1NODEVERSION='[$(node -v | sed "s/^v//")] '
which ruby       > /dev/null 2> /dev/null && PS1RUBYVERSION='[$(ruby -v | sed "s/^ruby //" | sed "s/ .*//")] '
cat /tmp/.tempc  > /dev/null 2> /dev/null && PS1TEMPC='[$(cat /tmp/.tempc | tr -d "\n")°] '

PS1="\t $PS1TEMPC$PS1GITPROMPT\w> "


# Add to root crontab:
# * * * * * powermetrics --samplers smc -n 1 |grep -i "CPU die temperature" | grep -o "\d\+\.\d\+" > /tmp/.tempc

