
# fzf

export FZF_DEFAULT_COMMAND='ag -g ""'

ff (){ command $@           $(fzf) ; }
fd (){ command $@ $(dirname $(fzf)); }
