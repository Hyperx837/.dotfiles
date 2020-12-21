# enable terminal linewrap
setterm -linewrap on
source ~/.alias
alias refresh='source ~/.bashrc'

# colorize man pages
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'
export LESSHISTFILE=-

# colorize ls files
[ -x /usr/bin/dircolors ] && eval "$(dircolors -b)"

# ------------------------------- BASH SETTINGS --------------------------------
# ----- options -----
shopt -s globstar
shopt -s histappend
shopt -s checkwinsize
set -o vi

HISTCONTROL=ignoreboth
HISTSIZE=5000
HISTFILESIZE=5000
HISTFILE="$HOME/.cache/bash_history"

# ----- Bash Completion -----
if [ -f /usr/share/bash-completion/bash_completion ]
then
    source /usr/share/bash-completion/bash_completion
elif [ -f /etc/bash_completion ]
then
    source /etc/bash_completion
fi


# -------------------------- PROMPT -------------------------------- #
# ╭──     ~/.dotfiles 
# ╰─❯❯

# ---- prompt colors ---- #
light_grey="\033[1;38;5;244m"
medium_dark_green="\033[1;38;5;83m"
no_color="\033[0m"
white="\033[0;37m"
black="\033[0;30m"
white_bg="\033[47m"
green="\033[0;34m"
# blue_bg="\033[27m"
# blue_bg="\033[0;30m"
blue_bg="\033[48;5;4m"

function get_folder_icon () {
    if [[ $(pwd) == "$HOME" ]]; then
        echo 
    elif [[ $(stat -c "%U" $(pwd)) == $USER ]]; then
        echo  
    else
        echo  
    fi
        
}

PS1="\n ${light_grey}╭──${white}${black}${white_bg}  ${white}${blue_bg} \$(get_folder_icon) \w \
${green} \n ${light_grey}╰─${medium_dark_green}❯❯ ${no_color}"
# PS1="\n ${light_grey}╭──${white}${black}${white_bg}  ${black2}${blue_bg}${black2}  \w \
# \[\033[0m\]\[\033[0;32m\] \n ${light_grey}╰─${prompt_char_color}❯❯ ${no_color}"

glog() {
    setterm -linewrap off
    
    git --no-pager log --all --color=always --graph --abbrev-commit --decorate \
    --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' | \
    sed -E \
    -e 's/\|(\x1b\[[0-9;]*m)+\\(\x1b\[[0-9;]*m)+ /├\1─╮\2/' \
    -e 's/(\x1b\[[0-9;]+m)\|\x1b\[m\1\/\x1b\[m /\1├─╯\x1b\[m/' \
    -e 's/\|(\x1b\[[0-9;]*m)+\\(\x1b\[[0-9;]*m)+/├\1╮\2/' \
    -e 's/(\x1b\[[0-9;]+m)\|\x1b\[m\1\/\x1b\[m/\1├╯\x1b\[m/' \
    -e 's/╮(\x1b\[[0-9;]*m)+\\/╮\1╰╮/' \
    -e 's/╯(\x1b\[[0-9;]*m)+\//╯\1╭╯/' \
    -e 's/(\||\\)\x1b\[m   (\x1b\[[0-9;]*m)/╰╮\2/' \
    -e 's/(\x1b\[[0-9;]*m)\\/\1╮/g' \
    -e 's/(\x1b\[[0-9;]*m)\//\1╯/g' \
    -e 's/^\*|(\x1b\[m )\*/\1⎬/g' \
    -e 's/(\x1b\[[0-9;]*m)\|/\1│/g' \
    | command less -r +'/[^/]HEAD'
    
    setterm -linewrap on
}

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
