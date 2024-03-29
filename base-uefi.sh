#!/bin/env

ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
hwclock --systohc

echo "en_US.UTF-8 UTF-8" >>  /etc/locale.gen
echo "zh_CN.UTF-8 UTF-8" >>  /etc/locale.gen

# sed -i 'en_US.UTF-8 UTF-8' /etc/locale.gen

# sed -i 'zh_CN.UTF-8 UTF-8' /etc/locale.gen

locale-gen

echo "LANG=en_US.UTF-8" >> /etc/locale.conf

echo -n "Enter your hostname: "
read hostname
echo "$hostname" >> /etc/hostname
echo "$hostname is already written "

echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1       localhost" >> /etc/hosts
echo "127.0.1.1 $hostname.localdomain $hostname" >> /etc/hosts

# update passwords in batch mode
echo root:qazx | chpasswd

# You can add xorg to the installation packages, I usually add it at the DE or WM install script
# You can remove the tlp package if you are installing on a desktop or vm

pacman -Syy

# pacman -S --needed grub efibootmgr networkmanager network-manager-applet dialog wpa_supplicant mtools dosfstools base-devel linux-headers avahi xdg-user-dirs xdg-utils gvfs gvfs-smb nfs-utils inetutils dnsutils bluez bluez-utils cups hplip alsa-utils pipewire pipewire-alsa pipewire-pulse pipewire-jack bash-completion openssh rsync reflector acpi acpi_call tlp virt-manager qemu qemu-arch-extra edk2-ovmf bridge-utils dnsmasq vde2 openbsd-netcat iptables-nft ipset firewalld flatpak sof-firmware nss-mdns acpid os-prober ntfs-3g terminus-font

pacman -S grub efibootmgr os-prober dosfstools ntfs-3g intel-ucode \
    iwd nm-connection-editor dialog wpa_supplicant network-manager-applet \
    base base-devel linux-lts-headers linux-lts \
    # xdg-user-dirs xdg-utils gvfs gvfs-smb nfs-utils inetutils dnsutils bluez bluez-libs \
    # cups hplip \
    pipewire pipewire-jack pipewire-pulse wireplumber \
    openssh rsync reflector tlp \
    qemu-base libvirt virt-manager dmidecode dnsmasq \
    # terminus-font pavucontrol btop \
    docker docker-compose jq zsh wireshark-qt 


# pacman -S xf86-video-amdgpu
# pacman -S nvidia nvidia-utils nvidia-settings

# if linux want to coexist with win that to mount /efi
grub-install --target=x86_64-efi --efi-directory=/efi --bootloader-id=Arch
#change the directory to /boot/efi is you mounted the EFI partition at /boot/efi

grub-mkconfig -o /boot/grub/grub.cfg

# systemctl enable NetworkManager
# systemctl enable bluetooth
# systemctl enable cups.service # this is a printer
# systemctl enable sshd
# systemctl enable avahi-daemon
systemctl enable tlp # You can comment this command out if you didn't install tlp, see above
# systemctl enable reflector.timer
# systemctl enable fstrim.timer
systemctl enable libvirtd
# systemctl enable firewalld
# systemctl enable acpid
systemctl enable docker

echo -n "Enter your user-name: "
read username
echo $username

useradd -mG wheel -s /bin/zsh $username
echo $username:qazx. | chpasswd
usermod -aG libvirt $username
usermod -aG docker $username
usermod -aG wireshark $username
usermod -aG video $username


echo "$username ALL=(ALL) ALL" >> /etc/sudoers.d/$username


printf "\e[1;32mDone! Type exit, umount -a and reboot.\e[0m"

