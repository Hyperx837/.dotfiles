clear 
nf_options=""
if [[ $TERM != "kitty" ]]; then
    nf_options="--ascii"
fi
neofetch $nf_options | lolcat

chpwd

