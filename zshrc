# ZSH Configuration

# ZSH Installation path
export ZSH="$HOME/.oh-my-zsh"

# Set zsh theme
ZSH_THEME="suso"

# ZSH Configs
COMPLETION_WAITING_DOTS="true"
DISABLE_AUTO_TITLE="true"

plugins=(
    fzf-zsh
    aws
    docker
    gpg-agent
    httpie
    lein
    python
    terraform
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

ZSH_HIGHLIGHT_HIGHTLIGHTERS=(main brackets pattern root)
#ZSH_HIGHTLIGHT_STYLES[root]='bg=red'

# Disable no-execution on pattern-matching failure
unsetopt nomatch

#Run SSH-AGENT
SSH_ENV="$HOME/.ssh/environment"

function start_agent {
    echo "Initialising new SSH agent..."
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
    echo succeeded
    chmod 600 "${SSH_ENV}"
    . "${SSH_ENV}" > /dev/null
    /usr/bin/ssh-add;
}

# Source SSH settings, if applicable

if [ -f "${SSH_ENV}" ]; then
    . "${SSH_ENV}" > /dev/null
    #ps ${SSH_AGENT_PID} doesn't work under cywgin
    ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
        start_agent;
    }
else
    start_agent;
fi
# Add SSH-KEY
ssh-add "$HOME/.ssh/*" 2> /dev/null


# Sources
# Locals
[ -f ~/.localrc ] && source ~/.commonrc
[ -f ~/.localrc ] && source ~/.localrc
# Common
[ -f ~/.dotfiles/zsh/functions.zsh ] && source ~/.dotfiles/zsh/functions.zsh
[ -f ~/.dotfiles/zsh/aliases.zsh ] && source ~/.dotfiles/zsh/aliases.zsh
