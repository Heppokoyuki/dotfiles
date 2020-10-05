ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
hwclock --systohc --utc

echo en_US.UTF-8 UTF-8 >> /etc/locale.gen
echo ja_JP.UTF-8 UTF-8 >> /etc/locale.gen

locale-gen

echo LANG=en_US.UTF-8 > /etc/locale.conf

echo Fuji > /etc/hostname

systemctl enable dhcpcd.service
passwd

useradd -m -g wheel -s /bin/zsh yuki
passwd yuki

visudo

pacman -Syu --noconfirm

pacman -S --noconfirm net-tools xorg-server xorg-apps xorg-xinit xorg-xmodmap xorg-xclock xterm sudo qtcreator boost lightdm lightdm-gtk-greeter otf-ipafont xdg-user-dirs-gtk grub os-prober dosfstools xf86-input-synaptics xf86-video-intel mesa iw wpa_supplicant dialog rxvt-unicode zsh tmux i3 vlc dmenu clang gcc openssh git openssl tree alsa-utils unzip htop

systemctl enable lightdm.service

# yay installation
git clone https://aur.archlinux.org/yay
cd yay && makepkg -si --noconfirm && cd .. && rm -rf yay

# for SSD
systemctl enable fstrim.timer

pacman -S intel-ucode efibootmgr grub

# for x86_64 UEFI grub
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=grub2 --recheck
mkdir /boot/EFI/boot
cp /boot/EFI/ArchLinuxGrub/grubx64.efi /boot/EFI/boot/bootx64.efi
grub-mkconfig -o /boot/grub/grub.cfg
