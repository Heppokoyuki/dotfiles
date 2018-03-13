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
    fi
    ln -sf $DOTPATH/.vimrc $HOME/.vimrc
    ln -sf $DOTPATH/.zshrc $HOME/.zshrc
    ln -sf $DOTPATH/config $HOME/.config/i3/config
    ln -sf $DOTPATH/.Xdefaults $HOME/.Xdefaults
fi
