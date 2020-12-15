
set -o vi

plugins=(git zsh-syntax-highlighting zsh-autosuggestions vi-mode fzf)

[[ ! -f ~/.env  ]] || source ~/.env

source $ZSH/oh-my-zsh.sh
source ~/.bash_profile
[[ ! -f ~/.alias ]] || source ~/.alias
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
[[ ! -f ~/.p10k.zsh ]] || source ~/.docker-alias.sh
[[ ! -f ~/.prerun.sh ]] || source ~/.prerun.sh
[  -f ~/.fzf.zsh ] || source ~/.fzf.zsh

source ~/.nvm/nvm.sh
source ~/.nvm/bash_completion

source ~/.cache/p10k-instant-prompt-${USER}.zsh
