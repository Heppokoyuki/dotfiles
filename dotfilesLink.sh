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
DEPENDENCIES=neofetch ruby zsh-completions the_silver_search ctags fzf neovim

echo -e "\e[m\$DOTPATH:$DOTPATH\n"

yorn "Do you want to continue?"
if [ $? -eq 1 ]; then
    exit 1
else
    yorn "Do you want to install vim-plug?"
    if [ $? -eq 0 ]; then
        curl -fLo $HOME/.local/share/nvim/site/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    else
        :
    fi

    yorn "Do you want to install zplug?"
    if [ $? -eq 0 ]; then
        curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh
    else
        :
    fi

    sudo pacman -Sy $DEPENDENCIES

    ln -sf $DOTPATH/zshrc $HOME/.zshrc
    ln -sf $DOTPATH/config $HOME/.config/i3/config
    ln -sf $DOTPATH/Xdefaults $HOME/.Xdefaults
    ln -sf $DOTPATH/latexmkrc $HOME/.latexmkrc

    mkdir -p $HOME/.config/nvim/user/init
    mkdir -p $HOME/.config/nvim/user/plugins
    ln -sf $DOTPATH/init.vim $HOME/.config/nvim/init.vim
    ln -sf $DOTPATH/basic.vim $HOME/.config/nvim/user/init/basic.vim
    ln -sf $DOTPATH/keymap.vim $HOME/.config/nvim/user/init/keymap.vim
    ln -sf $DOTPATH/plugins.vim $HOME/.config/nvim/user/init/plugins.vim

    mkdir -p $HOME/.config/fontconfig
    ln -sf $DOTPATH/fonts.conf $HOME/.config/fontconfig/fonts.conf

    ln -sf $DOTPATH/pam_environment $HOME/.pam_environment
fi

