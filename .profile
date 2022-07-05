# if mpd is not running spawn it
[ ! -s ~/.config/mpd/pid ] && mpd
PATH="$PATH:$HOME/.local/bin"
music
# vlc-ctrl
picom &
firefox-developer-edition &
whatsapp &
kitty &
light-locker &
discord &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
