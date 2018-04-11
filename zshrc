# ZSH Configuration

# ZSH Installation path
export ZSH="$HOME/.oh-my-zsh"
export CUSTOM_ZSH="$HOME/.oh-my-zsh"

# Set zsh theme
ZSH_THEME="suso"

# ZSH Configs
COMPLETION_WAITING_DOTS="true"
DISABLE_AUTO_TITLE="true"

plugins=(
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
ZSH_HIGHTLIGHT_STYLES[root]='bg=red'

# Disable no-execution on pattern-matching failure
unsetopt nomatch
