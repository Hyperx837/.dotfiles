# if mpd is not running spawn it
[ ! -s ~/.config/mpd/pid ] && mpd
eval "$(pyenv init -)"

