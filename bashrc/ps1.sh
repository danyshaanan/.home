
# \t is time
# \u is user
# \h is comp
# \w is working directory

which git-prompt > /dev/null 2> /dev/null && PS1GITPROMPT='$(git-prompt)'
which node       > /dev/null 2> /dev/null && PS1NODEVERSION='[$(node -v | sed "s/^v//" | sed "s/\.[0-9]\{1,\}$//")] '

PS1='\t '$PS1NODEVERSION$PS1GITPROMPT' \w $ '
