# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ZSH Configuration

# ZSH Installation path
export ZSH="$HOME/.oh-my-zsh"

# Set zsh theme
ZSH_THEME="powerlevel10k/powerlevel10k"

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

# Disable no-execution on pattern-matching failure
unsetopt nomatch

# Sources
# Commons
[ -f ~/.commonrc ] && source ~/.commonrc
[ -f ~/.localrc ] && source ~/.localrc
# ZSH
[ -f ~/.dotfiles/zsh/functions.zsh ] && source ~/.dotfiles/zsh/functions.zsh
[ -f ~/.dotfiles/zsh/aliases.zsh ] && source ~/.dotfiles/zsh/aliases.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
