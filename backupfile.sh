#!/bin/env

cd backfile

# .pam_environment
if [ -f ~/.pam_environment ]
then
	cp ~/.pam_environment .
	printf ".pam_environment already copy \n"
else
	printf "\e[0;31m .pam_environment no exist \e[0m\n"
fi

sleep 2

# .xinitrc
if [ -f ~/.xinitrc ]
then
	cp ~/.xinitrc .
	printf ".xinitrc already copy \n"
else
	printf "\e[0;31m .xinitrc no exist \e[0m\n"
fi

sleep 2

# .zprofile
if [ -f ~/.zprofile ]
then
	cp ~/.zprofile .
	printf ".zprofile already copy \n"
else
	printf "\e[0;31m .zprofile no exist \e[0m\n"
fi

sleep 2

# .config etc systemd
if [ -d .config ] && [ -d etc ] && [ -d systemd ]
then
        printf "\e[0;32m task starting \e[0m\n"
else
        mkdir -p {.config,etc,systemd}
        printf "\e[0;32m task starting! \e[0m\n"
fi

# polybar
if [ -d ~/.config/polybar ]
then
	cp -r ~/.config/polybar ./.config/
	printf "polybar already copy \n"
else
	printf "\e[0;31m polybar no exist \e[0m\n"
fi

sleep 2

# alacritty
if [ -d ~/.config/alacritty ]
then
	cp -r ~/.config/alacritty ./.config/
	printf "alacritty already copy \n"
else
	printf "\e[0;31m alacritty no exist \e[0m\n"
fi

sleep 2

# dunst
if [ -d ~/.config/dunst ]
then
	cp -r ~/.config/dunst ./.config/
	printf "dunst already copy \n"
else
	printf "\e[0;31m dunst no exist \e[0m\n"
fi

sleep 2

# fontconfig
if [ -d ~/.config/fontconfig ]
then
	cp -r ~/.config/fontconfig ./.config/
	printf "fontconfig already already copy \n"
else
	printf "\e[0;31m fontconfig no exist \e[0m\n"
fi

sleep 2

# i3
if [ -d ~/.config/i3 ]
then
	cp -r ~/.config/i3 ./.config/
	printf "i3 already already copy \n"
else
	printf "\e[0;31m i3 no exist \e[0m\n"
fi

sleep 2

# hooks
if [ -d /etc/pacman.d/hooks ]
then
	cp -r /etc/pacman.d/hooks ./etc/
	printf "hooks already copy \n"
else
	printf "\e[0;31m hooks no exist \e[0m\n"
fi

sleep 2

# lock@.service
if [ -f /usr/lib/systemd/system/lock@.service ]
then
	cp -r /usr/lib/systemd/system/lock@.service ./systemd/
	printf "lock@.service already copy \n"
else
	printf "\e[0;31m lock@.service no exist \e[0m\n"
fi

printf "\e[0;32m Done! \e[0m\n"
