ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
hwclock --systohc --utc

echo en_US.UTF-8 UTF-8 >> /etc/locale.gen
echo ja_JP.UTF-8 UTF-8 >> /etc/locale.gen

locale-gen

echo LANG=en_US.UTF-8 > /etc/locale.conf

echo RabbitHouse > /etc/hostname

systemctl enable dhcpcd.service
pacman -S vim
passwd

useradd -m -g wheel -s /bin/zsh yuki
passwd yuki

visudo

pacman -Syu

pacman -S net-tools xorg-server xorg-apps xorg-xinit xorg-xmodmap  xorg-xclock xterm firefox sudo qtcreator boost opencv vim lightdm lightdm-gtk-greeter flashplugin otf-ipafont xdg-user-dirs-gtk grub os-prober dosfstools xf86-input-synaptics xf86-video-intel  mesa iw wpa_supplicant dialog rxvt-unicode zsh tmux i3 vlc dmenu clang gcc openssh git openssl libreoffice libreoffice-ja blueman powertop  tree  alsa-utils tig  source-highlight unzip htop dstat iotop texlive-most texlive-lang screenfetch chromium sakura

systemctl enable lightdm.service

# ibus-skk and X-keyboard setting
echo 'Section "InputClass"' >> /etc/X11/xorg.conf.d/10-keyboard.conf
echo 'Identifier "system-keyboard"' >> /etc/X11/xorg.conf.d/10-keyboard.conf
echo 'MatchIsKeyboard "on"' >> /etc/X11/xorg.conf.d/10-keyboard.conf
echo 'Option "XkbLayout" "us,jp106"' >> /etc/X11/xorg.conf.d/10-keyboard.conf
echo 'Option "XkbModel" "pc104"' >> /etc/X11/xorg.conf.d/10-keyboard.conf
echo 'Option "XkbVariant" ",dvorak"' >> /etc/X11/xorg.conf.d/10-keyboard.conf
echo 'Option "XkbOptions" "grp:alt_shift_toggle"' >> /etc/X11/xorg.conf.d/10-keyboard.conf
echo 'EndSection' >> /etc/X11/xorg.conf.d/10-keyboard.conf

pacman -S ibus-skk

echo 'export GTK_IM_MODULE=ibus' >> /home/yuki/.xprofile
echo 'export XMODIFIERS=@im=ibus' >> /home/yuki/.xprofile
echo 'export QT_IM_MODULE=ibus' >> /home/yuki/.xprofile
echo 'ibus-daemon -drx' >> /home/yuki/.xprofile

pacman -S adobe-source-han-sans-otc-fonts adobe-source-han-serif-otc-fonts

pacman -S intel-ucode efibootmgr grub

# for x86_64 UEFI grub
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=ArchLinuxGrub --recheck
mkdir /boot/EFI/boot
cp /boot/EFI/ArchLinuxGrub/grubx64.efi /boot/EFI/boot/bootx64.efi
grub-mkconfig -o /boot/grub/grub.cfg
