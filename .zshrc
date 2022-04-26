
set -o vi
bindkey -M vicmd v edit-command-line

source ~/.p10k.zsh

plugins=(git zsh-autosuggestions vi-mode fzf z zsh-syntax-highlighting)
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)


ifexist-source () {
    [[ -f $1 ]] && source $1
}

chpwd () {
      if [[ -z "$VIRTUAL_ENV" ]] ; then
        ## If env folder is found then activate the vitualenv
          if [[ -d .venv ]]; then
            source .venv/bin/activate
          fi
      else
        ## check the current folder belong to earlier VIRTUAL_ENV folder
        # if yes then do nothing
        # else deactivate
          parentdir="$(dirname "$VIRTUAL_ENV")"
          if [[ "$PWD"/ != "$parentdir"/* ]]; then
            deactivate
          fi
      fi
}

autoload -Uz compinit
compinit
# Completion for kitty
kitty + complete setup zsh | source /dev/stdin

ifexist-source ~/.env

source $ZSH/oh-my-zsh.sh
source ~/.cache/p10k-instant-prompt-${USER}.zsh
source ~/.nvm/nvm.sh
source ~/.nvm/bash_completion

files=(alias completions.zsh .p10k.zsh .docker-alias.sh .prerun.sh .fzf.zsh)
ifexist-source ~/.alias
ifexist-source ~/.completions.zsh
ifexist-source ~/.docker-alias.sh
ifexist-source ~/.prerun.sh
ifexist-source ~/.fzf.zsh



eval "$(pyenv init --path)" 
eval "$(pyenv init -)" 
