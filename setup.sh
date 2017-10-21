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
passwd mokemoke

visudo

echo "[archlinuxfr]" >> /etc/pacman.conf
echo "SigLevel = Never" >> /etc/pacman.conf
echo "Server = http://repo.archlinux.fr/\$arch" >> /etc/pacman.conf

pacman --sync --refresh yaourt

pacman -Syu

pacman -S xorg-server xorg-apps xorg-xinit xorg-xmodmap  xorg-xclock xterm firefox sudo qtcreator boost opencv vim xfce4-goodies xfce4 lightdm lightdm-gtk-greeter flashplugin otf-ipafont fcitx-im fcitx-configtool fcitx-mozc xdg-user-dirs-gtk grub os-prober dosfstools xf86-input-synaptics xf86-video-intel  mesa iw wpa_supplicant dialog rxvt-unicode zsh tmux i3 vlc dmenu clang gcc openssh git openssl libreoffice libreoffice-ja blueman powertop  tree  alsa-utils tig  source-highlight unzip htop dstat iotop texlive-most texlive-lang networkmanager screenfetch

systemctl enable lightdm.service

echo 'Section "InputClass"'  >> /etc/X11/xorg.conf.d/10-keyboard.conf
echo 'Identifier "Keyboard Defaults"'  >> /etc/X11/xorg.conf.d/10-keyboard.conf
echo 'MatchIsKeyboard "yes"'  >> /etc/X11/xorg.conf.d/10-keyboard.conf
echo 'Option "XkbLayout" "jp"'  >> /etc/X11/xorg.conf.d/10-keyboard.conf
echo 'EndSection'  >> /etc/X11/xorg.conf.d/10-keyboard.conf

pacman -S git chromium zsh
yaourt -S eagle xournal boostnote
git clone https://github.com/zsh-users/zsh-completions.git
echo fpath=(~/.zsh-completions $fpath) >> ~/.zshrc
echo autoload -U compinit; compinit >> ~/.zshrc
echo zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \ >> ~/.zshrc
echo                         /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin \ >> ~/.zshrc
echo /usr/local/git/bin >> ~/.zshrc
echo /bin/zsh >> /etc/shells
chsh
echo mokemoke
echo /bin/zsh
