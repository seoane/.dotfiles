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

# Disable no-execution on pattern-matching failure
unsetopt nomatch

# Sources
# Commons
[ -f ~/.commonrc ] && source ~/.commonrc
[ -f ~/.localrc ] && source ~/.localrc
# ZSH
[ -f ~/.dotfiles/zsh/functions.zsh ] && source ~/.dotfiles/zsh/functions.zsh
[ -f ~/.dotfiles/zsh/aliases.zsh ] && source ~/.dotfiles/zsh/aliases.zsh
