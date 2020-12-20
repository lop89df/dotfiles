# Autostart X using startx after tty login

if [[ -z "$DISPLAY"  ]] && [[ $(tty) = /dev/tty* ]]; then
	exec startx
fi
