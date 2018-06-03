#!/bin/bash

# .xinitrc

# executed automatically by xinit, which is usually invoked by startx

# references:
# - https://unix.stackexchange.com/questions/281858/difference-between-xinitrc-xsession-and-xsessionrc

if [ -f "${HOME}/.Xresources" ]
then
	xrdb -merge "$HOME/.Xresources"
fi

# xbindkeys
# https://wiki.archlinux.org/index.php/Xbindkeys
if [ -f "${HOME}/.xbindkeysrc" ]
then
	xbindkeys
fi

# needed for xdm
exec openbox-session
