if [ -e $HOME/.bash_aliases ]; then
    source $HOME/.bash_aliases
fi

if command -v fzf > /dev/null; then
    source <(fzf --bash)
fi

if command -v rg > /dev/null; then
    source <(rg --generate=complete-bash)
fi

if [ -z "$SSH_AUTH_SOCK" ]; then
    eval $(ssh-agent -s) &>/dev/null
fi

function ensure_ssh_key {
    if ! ssh-add -l &>/dev/null; then
        ssh-add -t 3600 ~/.ssh/id_ed25519
    fi
}

# Map up/down arrow to search for history entries matching what is currently type in the command line.
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

export HISTSIZE=10000
export HISTFILESIZE=10000

HISTCONTROL=erasedups
HISTTIMEFORMAT='%F %T '

shopt -s histappend
shopt -s cmdhist #Save multi line commands as one history entry
PROMPT_COMMAND='history -a' #Append to history after each command

PROMPT_DIRTRIM=2
PS1='\[\033[0;33m\][\u@\h:\w]\$\[\033[0m\] '

RIPGREP_CONFIG_PATH=~/.ripgreprc

# Disable ctrl+s
stty -ixon