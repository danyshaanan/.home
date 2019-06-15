
command ls ~/.gnupg/ >/dev/null 2>&1 || return
command -v gpg-agent >/dev/null 2>&1 || return

export GPG_TTY=$(tty)

if [ -f ~/.gnupg/.gpg-agent-info ] && [ -n "$(pgrep gpg-agent)" ]; then
    source ~/.gnupg/.gpg-agent-info
    export GPG_AGENT_INFO
else
    eval $(gpg-agent --daemon)
fi

alias dec='gpg -dq'

### Crypto

alias sha256sum='openssl dgst -sha256'
