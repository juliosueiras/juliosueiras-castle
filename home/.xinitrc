xrdb ~/.Xresources 
xset +fp /usr/share/fonts/cyrillic
xset +fp ~/.fonts
xset +fp /usr/share/fonts/local 
xset +fp ~/.git_repos/lokaltog-fonts/lokaltog-fixed
xset +fp ~/.git_repos/lokaltog-fonts/lokaltog-symbols
xset fp rehash 
wmname LG3D
xcalib /home/juliosueiras/x230.icm &
xsetroot -cursor_name left_ptr &
xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape' -e "keycode  94 = z" &


unclutter -grab -noevents -root &
mount /dev/sda4 /home/juliosueiras/mnt 
urxvtd &

if [[ -z `xrandr | grep " connected" | grep 'VGA'` ]]; then
	echo "No monitor found" &
else
	xrandr --output VGA1 --auto --above LVDS1 &
fi

if [[ -z `xrandr | grep " connected" | grep 'HDMI'` ]]; then
	echo "No monitor found" &
else
	xrandr --output HDMI2 --auto --above eDP1 &
fi

feh ~/Pictures/touhou_keine_wallpaper.jpg --bg-scale &
exec ~/.scripts/bspwm-launch
