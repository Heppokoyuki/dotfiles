ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
hwclock --systohc --utc

echo en_US.UTF-8 UTF-8 >> /etc/locale.gen
echo ja_JP.UTF-8 UTF-8 >> /etc/locale.gen

locale-gen

echo LANG=en_US.UTF-8 > /etc/locale.conf

echo Fuji > /etc/hostname

pacman -Syu --noconfirm

# xorgs and dm
pacman -S --noconfirm xorg-server xorg-apps xorg-xinit xorg-xmodmap xorg-xclock xterm lightdm lightdm-gtk-greeter xdg-user-dirs-gtk xf86-input-synaptics xf86-video-intel i3 dmenu 
# if your gpu is from amd, you should select xf86-video-amdgpu

# miscs
pacman -S --noconfirm sudo qtcreator boost grub os-prober dosfstools mesa dialog rxvt-unicode zsh tmux vlc clang gcc openssh git openssl tree alsa-utils unzip htop

# networks
pacman -S --noconfirm dhcpcd NetworkManager net-tools iw wpa_supplicant 

# fonts
pacman -S --noconfirm otf-ipafont adobe-source-han-sans-jp-fonts adobe-source-han-serif-jp-fonts noto-fonts adobe-source-code-pro-fonts

# fcitx5
pacman -S --noconfirm fcitx5 fcitx5-im fcitx5-mozc

passwd
useradd -m -g wheel -s /bin/zsh yuki
passwd yuki
visudo

## if lightdm daemon exits with failed code, you should set logind-check-graphical=true to /etc/lightdm/lightdm.conf
systemctl enable lightdm.service

systemctl enable dhcpcd.service

# yay installation
sudo -u yuki sh -c "git clone https://aur.archlinux.org/yay && cd yay && makepkg -si --noconfirm && cd .. && rm -rf yay"

pacman -S intel-ucode efibootmgr grub

# for x86_64 UEFI grub
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=grub2 --recheck
mkdir /boot/EFI/boot
cp /boot/EFI/grub2/grubx64.efi /boot/EFI/boot/bootx64.efi
grub-mkconfig -o /boot/grub/grub.cfg
