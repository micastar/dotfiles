#!/bin/env

# .pam_environment
if [ -f ~/.pam_environment ]
then
	cp ~/.pam_environment .
	echo ".pam_environment already copy"
else
	echo ".pam_environment no exist"
fi

sleep 2

# .xinitrc
if [ -f ~/.xinitrc ]
then
	cp ~/.xinitrc .
	echo ".xinitrc already copy"
else
	echo ".xinitrc no exist"
fi

sleep 2

# .zprofile
if [ -f ~/.zprofile ]
then
	cp ~/.zprofile .
	echo ".zprofile already copy"
else
	echo ".zprofile no exist"
fi

sleep 2

# .config etc systemd
if [ -d .config ] && [ -d etc ] && [ -d systemd ]
then
        echo "task starting"
else
        mkdir -p {.config,etc,systemd}
        printf "\e[0;32mtask starting!\e[0m\n"
fi

# polybar
if [ -d ~/.config/polybar ]
then
	cp -r ~/.config/polybar ./.config/
	echo "polybar already copy"
else
	echo "polybar no exist"
fi

sleep 2

# alacritty
if [ -d ~/.config/alacritty ]
then
	cp -r ~/.config/alacritty ./.config/
	echo "alacritty already copy"
else
	echo "alacritty no exist"
fi

sleep 2

# dunst
if [ -d ~/.config/dunst ]
then
	cp -r ~/.config/dunst ./.config/
	echo "dunst already copy"
else
	echo "dunst no exist"
fi

sleep 2

# fontconfig
if [ -d ~/.config/fontconfig ]
then
	cp -r ~/.config/fontconfig ./.config/
	echo "fontconfig already already copy"
else
	echo "fontconfig no exist"
fi

sleep 2

# i3
if [ -d ~/.config/i3 ]
then
	cp -r ~/.config/i3 ./.config/
	echo "i3 already already copy"
else
	echo "i3 no exist"
fi

sleep 2

# hooks
if [ -d /etc/pacman.d/hooks ]
then
	cp -r /etc/pacman.d/hooks ./etc/
	echo "hooks already copy"
else
	echo "hooks no exist"
fi

sleep 2

# lock@.service
if [ -f /usr/lib/systemd/system/lock@.service ]
then
	cp -r /usr/lib/systemd/system/lock@.service ./systemd/
	echo "lock@.service already copy"
else
	echo "lock@.service no exist"
fi

printf "\e[0;32mDone!\e[0m\n"
