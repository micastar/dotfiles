#!/bin/env bash

# backfile folder
if [ -d ./backfile ]
then
		rm -rv ./backfile
        printf "\e[0;32m backfile removed, and task starting \e[0m\n"
else
        printf "\e[0;32m task starting! \e[0m\n"
fi

mkdir -p backfile

cd backfile

#
# basic file
#

printf "\e[0;32m basic file! \e[0m\n"

# .config etc systemd
if [ -d .config ] && [ -d etc ] && [ -d systemd ]
then
        printf "\e[0;32m task starting \e[0m\n"
else
        mkdir -p {.config,etc,systemd}
        printf "\e[0;32m task starting! \e[0m\n"
fi

# .pam_environment
# if [ -f ~/.pam_environment ]
# then
# 	cp ~/.pam_environment .
# 	printf ".pam_environment already copy \n"
# else
# 	printf "\e[0;31m .pam_environment no exist \e[0m\n"
# fi

# alacritty.yml
if [ -f ~/.config/alacritty/alacritty.yml ]
then
	cp -r ~/.config/alacritty ./.config/alacritty
	printf "alacritty.yml already copy \n"
else
	printf "\e[0;31m alacritty.yml no exist \e[0m\n"
fi

# fontconfig
if [ -d ~/.config/fontconfig ]
then
	cp -r ~/.config/fontconfig ./.config
	printf "fontconfig already already copy \n"
else
	printf "\e[0;31m fontconfig no exist \e[0m\n"
fi

# hooks
if [ -d /etc/pacman.d/hooks ]
then
	cp -r /etc/pacman.d/hooks ./etc/
	printf "hooks already copy \n"
else
	printf "\e[0;31m hooks no exist \e[0m\n"
fi

# autostart
# if [ -d ~/.config/autostart ]
# then
# 	cp -r ~/.config/autostart ./.config/
# 	printf "autostart already copy \n"
# else
# 	printf "\e[0;31m autostart no exist \e[0m\n"
# fi

# rofi
if [ -d ~/.config/rofi ]
then
	cp -r ~/.config/rofi .config/
	printf "rofi already copy \n"
else
	printf "\e[0;31m rofi no exist \e[0m\n"
fi

# daemon.json
if [ -f /etc/docker/daemon.json ]
then
	cp -r /etc/docker/daemon.json ./etc/
	printf "daemon.json already copy \n"
else
	printf "\e[0;31m daemon.json no exist \e[0m\n"
fi

# lock@.service
if [ -f /usr/lib/systemd/system/lock@.service ]
then
	cp -r /usr/lib/systemd/system/lock@.service ./systemd/
	printf "lock@.service already copy \n"
else
	printf "\e[0;31m lock@.service no exist \e[0m\n"
fi

# fh-sysctl.service
if [ -f /usr/lib/systemd/system/fh-sysctl.service ]
then
	cp -r /usr/lib/systemd/system/fh-sysctl.service ./systemd/
	printf "fh-sysctl.service already copy \n"
else
	printf "\e[0;31m fh-sysctl.service no exist \e[0m\n"
fi

# sysctl.conf
if [ -f /etc/sysctl.conf ]
then
	cp -r /etc/sysctl.conf ./etc/sysctl.conf
	printf "sysctl.conf already copy \n"
else
	printf "\e[0;31m sysctl.conf no exist \e[0m\n"
fi

# blacklist.conf
if [ -f /etc/modprobe.d/blacklist.conf ]
then
	mkdir -p etc/modprobe.d
	cp -r /etc/modprobe.d/blacklist.conf ./etc/modprobe.d/blacklist.conf
	printf "blacklist.conf already copy \n"
else
	printf "\e[0;31m blacklist.conf no exist \e[0m\n"
fi

# .zimrc
if [ -f ~/.zimrc ]
then
	cp ~/.zimrc ./.zimrc
	printf ".zimrc already copy \n"
else
	printf "\e[0;31m .zimrc no exist \e[0m\n"
fi

# .makepkg.conf
# if [ -f ~/.makepkg.conf ]
# then
# 	cp ~/.makepkg.conf ./.makepkg.conf
# 	printf ".makepkg.conf already copy \n"
# else
# 	printf "\e[0;31m .makepkg.conf no exist \e[0m\n"
# fi

# .zshrc
if [ -f ~/.zshrc ]
then
	cp ~/.zshrc ./.zshrc
	printf ".zshrc already copy \n"
else
	printf "\e[0;31m .zshrc no exist \e[0m\n"
fi

# subladder-mmdb.service
# if [ -f ~/.config/systemd/user/subladder-mmdb.service ]
# then
# 	mkdir -p .config/systemd/user
# 	cp ~/.config/systemd/user/subladder-mmdb.service .config/systemd/user/
# 	printf "subladder-mmdb.service already copy \n"
# else
# 	printf "\e[0;31m subladder-mmdb.service no exist \e[0m\n"
# fi

# subladder-mmdb.timer
# if [ -f ~/.config/systemd/user/subladder-mmdb.timer ]
# then
# 	mkdir -p .config/systemd/user
# 	cp ~/.config/systemd/user/subladder-mmdb.timer .config/systemd/user/
# 	printf "subladder-mmdb.timer already copy \n"
# else
# 	printf "\e[0;31m subladder-mmdb.timer no exist \e[0m\n"
# fi

# subladder.service
# if [ -f ~/.config/systemd/user/subladder.service ]
# then
# 	mkdir -p .config/systemd/user
# 	cp ~/.config/systemd/user/subladder.service .config/systemd/user/
# 	printf "subladder.service already copy \n"
# else
# 	printf "\e[0;31m subladder.service no exist \e[0m\n"
# fi

# subladder.timer
# if [ -f ~/.config/systemd/user/subladder.timer ]
# then
# 	mkdir -p .config/systemd/user
# 	cp ~/.config/systemd/user/subladder.timer .config/systemd/user/
# 	printf "subladder.timer already copy \n"
# else
# 	printf "\e[0;31m subladder.timer no exist \e[0m\n"
# fi

# paru.conf
if [ -f ~/.config/paru/paru.conf ]
then
	cp -r ~/.config/paru ./.config/paru
	printf "paru.conf already copy \n"
else
	printf "\e[0;31m paru.conf no exist \e[0m\n"
fi

# default.custom.yaml
if [ -f ~/.local/share/fcitx5/rime/default.custom.yaml ]
then
	mkdir -p .local/share/fcitx5/rime
	cp -r ~/.local/share/fcitx5/rime/default.custom.yaml ./.local/share/fcitx5/rime
	printf "default.custom.yaml already copy \n"
else
	printf "\e[0;31m default.custom.yaml no exist \e[0m\n"
fi

# extended.dict.yaml
if [ -f ~/.local/share/fcitx5/rime/extended.dict.yaml ]
then
	mkdir -p .local/share/fcitx5/rime
	cp -r ~/.local/share/fcitx5/rime/extended.dict.yaml ./.local/share/fcitx5/rime
	printf "extended.dict.yaml already copy \n"
else
	printf "\e[0;31m extended.dict.yaml no exist \e[0m\n"
fi

# pinyin_simp.custom.yaml
if [ -f ~/.local/share/fcitx5/rime/pinyin_simp.custom.yaml ]
then
	mkdir -p .local/share/fcitx5/rime
	cp -r ~/.local/share/fcitx5/rime/pinyin_simp.custom.yaml ./.local/share/fcitx5/rime
	printf "pinyin_simp.custom.yaml already copy \n"
else
	printf "\e[0;31m pinyin_simp.custom.yaml no exist \e[0m\n"
fi

# fehbg
if [ -f ~/.fehbg ]
then
	cp -r ~/.fehbg ./.fehbg
	printf ".fehbg already copy \n"
else
	printf "\e[0;31m .fehbg no exist \e[0m\n"
fi

# .zprofile
if [ -f ~/.zprofile ]
then
	cp ~/.zprofile ./.zprofile
	printf ".zprofile already copy \n"
else
	printf "\e[0;31m .zprofile no exist \e[0m\n"
fi

sleep 1

#
# i3 file
#

# cd i3

printf "\e[0;32m i3 file! \e[0m\n"

# .xinitrc
if [ -f ~/.xinitrc ]
then
	cp ~/.xinitrc ./.xinitrc
	printf ".xinitrc already copy \n"
else
	printf "\e[0;31m .xinitrc no exist \e[0m\n"
fi

# polybar
if [ -d ~/.config/polybar ]
then
	cp -r ~/.config/polybar ./.config/polybar
	printf "polybar already copy \n"
else
	printf "\e[0;31m polybar no exist \e[0m\n"
fi

# dunst
if [ -d ~/.config/dunst ]
then
	cp -r ~/.config/dunst ./.config/dunst
	printf "dunst already copy \n"
else
	printf "\e[0;31m dunst no exist \e[0m\n"
fi

# i3
if [ -d ~/.config/i3 ]
then
	cp -r ~/.config/i3 ./.config/i3
	printf "i3 already copy \n"
else
	printf "\e[0;31m i3 no exist \e[0m\n"
fi

# picom.conf
if [ -f ~/.config/picom/picom.conf ]
then
	cp -r ~/.config/picom ./.config/picom
	printf "picom.conf already copy \n"
else
	printf "\e[0;31m picom.conf no exist \e[0m\n"
fi

# xorg.conf.d
if [ -d /etc/X11/xorg.conf.d ]
then
	mkdir -p ./etc/X11/xorg.conf.d
	cp -r /etc/X11/xorg.conf.d ./etc/X11/xorg.conf.d
	printf "xorg.conf.d already copy \n"
else
	printf "\e[0;31m xorg.conf.d no exist \e[0m\n"
fi

# .Xresources
if [ -f ~/.Xresources ]
then
	cp ~/.Xresources ./.Xresources
	printf ".Xresources already copy \n"
else
	printf "\e[0;31m .Xresources no exist \e[0m\n"
fi

# cd ..

sleep 1

#
# sway file
#

# cd sway

# printf "\e[0;32m sway file! \e[0m\n"

# # sway
# if [ -d ~/.config/sway ]
# then
# 	mkdir -p .config/sway
# 	cp -r ~/.config/sway ./.config/
# 	printf "sway already copy \n"
# else
# 	printf "\e[0;31m sway no exist \e[0m\n"
# fi

# # waybar
# if [ -d ~/.config/waybar ]
# then
# 	cp -r ~/.config/waybar ./.config/
# 	printf "waybar already copy \n"
# else
# 	printf "\e[0;31m waybar no exist \e[0m\n"
# fi

# # mako
# if [ -d ~/.config/mako ]
# then
# 	cp -r ~/.config/mako ./.config/
# 	printf "mako already copy \n"
# else
# 	printf "\e[0;31m mako no exist \e[0m\n"
# fi

# # swayppy
# if [ -d ~/.config/swayppy ]
# then
# 	cp -r ~/.config/swayppy ./.config/
# 	printf "swayppy already copy \n"
# else
# 	printf "\e[0;31m swayppy no exist \e[0m\n"
# fi

# #---------------------------
# printf "\e[0;32m Done! \e[0m\n"
