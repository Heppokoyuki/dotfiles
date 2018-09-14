#!/bin/sh
#This script is written by yukium++[yuhki.yasuda@gmail.com]

yorn(){
    while true;do
        echo "$1 [Y/n]"
        read ANSWER
        case $ANSWER in
            "" | "Y" | "y" | "yes" | "Yes" | "YES")
                echo -e "\e[32mCONTINUE\e[m\n"
                return 0;;
            "N" | "n" | "no" | "No" | "NO")
                return 1;;
            *)
                ;;
        esac
    done
}
echo -e "     .___      __    _____.__.__                 "
echo -e "   __| _/_____/  |__/ ____\__|  |   ____   ______"
echo -e "  / __ |/  _ \   __\   __\|  |  | _/ __ \ /  ___/"
echo -e " / /_/ (  <_> )  |  |  |  |  |  |_\  ___/ \___ \ "
echo -e " \____ |\____/|__|  |__|  |__|____/\___  >____  >"
echo -e "      \/                               \/     \/ "


DOTPATH=$HOME/dotfiles

echo -e "\e[m\$DOTPATH:$DOTPATH\n"

yorn "Do you want to continue?"
if [ $? -eq 1 ]; then
    exit 1
else
    yorn "Do you want to install dein.vim?"
    if [ $? -eq 0 ]; then
        mkdir -p ~/.vim/dein/repos/github.com/Shougo/dein.vim
        git clone https://github.com/Shougo/dein.vim \
            ~/.vim/dein/repos/github.com/Shougo/dein.vim
    else
        :
    fi

    yorn "Do you want to install zplug?"
    if [ $? -eq 0 ]; then
        curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh
    else
        :
    fi

    sudo pacman -Sy powerline-fonts python python-pip neofetch ruby sakura zsh-completions
    sudo pip install --upgrade pip
    sudo pip install powerline-shell

    ln -sf $DOTPATH/vimrc $HOME/.vimrc
    ln -sf $DOTPATH/zshrc $HOME/.zshrc
    ln -sf $DOTPATH/config $HOME/.config/i3/config
    ln -sf $DOTPATH/Xdefaults $HOME/.Xdefaults
    ln -sf $DOTPATH/dbext_profile $HOME/.dbext_profile
    sudo chown root $DOTPATH/dbext_profile
    ln -sf $DOTPATH/latexmkrc $HOME/.latexmkrc
fi

