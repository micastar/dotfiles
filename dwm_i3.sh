#!/bin/env

# Variables
country=China
kbmap=ch
output=eDP-1-1
resolution=1920x1080

# Options
aur_helper=true
install_ly=true
gen_xprofile=false

sudo timedatectl set-ntp true
sudo hwclock --systohc
sudo reflector -c $country -a 6 --latest 3 --fastest 3 --threads 6 --sort rate --save /etc/pacman.d/mirrorlist

# sudo firewall-cmd --add-port=1025-65535/tcp --permanent
# sudo firewall-cmd --add-port=1025-65535/udp --permanent
# sudo firewall-cmd --reload
# sudo virsh net-autostart default

if [[ $aur_helper = true ]]; then
    cd /tmp
    git clone https://aur.archlinux.org/paru.git
    cd paru/;makepkg -si --noconfirm;cd
fi

# Install packages
sudo pacman -Sy

sudo pacman -S archlinuxcn-keyring

sudo pacman -S xorg-server xorg-xinit polkit-gnome lxappearance nemo xdg-desktop-portal xdg-desktop-portal-gtk timeshift

# Install fonts
# sudo pacman -Sy --noconfirm dina-font tamsyn-font bdf-unifont ttf-bitstream-vera ttf-croscore ttf-dejavu ttf-droid gnu-free-fonts ttf-ibm-plex ttf-liberation ttf-linux-libertine noto-fonts ttf-roboto tex-gyre-fonts ttf-ubuntu-font-family ttf-anonymous-pro ttf-cascadia-code ttf-fantasque-sans-mono ttf-fira-mono ttf-hack ttf-fira-code ttf-inconsolata ttf-jetbrains-mono ttf-monofur adobe-source-code-pro-fonts cantarell-fonts inter-font ttf-opensans gentium-plus-font ttf-junicode adobe-source-han-sans-otc-fonts adobe-source-han-serif-otc-fonts noto-fonts-cjk noto-fonts-emoji

# sudo pacman -S rust fcitx5-rime fcitx5-im rime-pinyin-simp

sudo pacman -S  alacritty polybar picom rofi rust \
                    fcitx5-rime fcitx5-im rime-pinyin-simp fcitx5-pinyin-moegirl-rime rime-pinyin-zhwiki \
                        redshift telegram-desktop tldr traceroute vim-plug \
                            x11vnc pavucontrol pbzip2 bzip2 gzip p7zip pbzip2 pigz unzip zip obs-studio obsidian ncdu hugo \
                                flameshot exa betterlockscreen dex \
                                smartdns clash java-runtime-common java-environment-common python


sudo pacman -S --noconfirm ttf-dejavu ttf-bitstream-vera ttf-apple-emoji ttf-sarasa-gothic ttf-opensans ttf-iosevka-nerd ttf-liberation ttf-croscore

paru -S firefox-esr ttf-ms-fonts 

# Pull Git repositories and install
# cd /tmp
# repos=( "dmenu" "dwm" "dwmstatus" "st" "slock" )
# for repo in ${repos[@]}
# do
#    git clone git://git.suckless.org/$repo
#    cd $repo;make;sudo make install;cd ..
# done

# XSessions and dwm.desktop
# if [[ ! -d /usr/share/xsessions ]]; then
#    sudo mkdir /usr/share/xsessions
# fi

# cat > ./temp << "EOF"
# [Desktop Entry]
# Encoding=UTF-8
# Name=Dwm
# Comment=Dynamic window manager
# Exec=dwm
# Icon=dwm
# Type=XSession
# EOF
# sudo cp ./temp /usr/share/xsessions/dwm.desktop;rm ./temp

# # .xprofile
# if [[ $gen_xprofile = true ]]; then
# cat > ~/.zprofile << EOF
# setxkbmap $kbmap
# nitrogen --restore
# xrandr --output $output --mode $resolution
# EOF
# fi

printf "\e[1;32mDone! you can now reboot.\e[0m\n"
