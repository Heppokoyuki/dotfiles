DOTPATH=$HOME/dotfiles

echo "\$DOTPATH:$DOTPATH"

echo "Do you want to continue? [Y/n]"
read ANSWER

case $ANSWER in
    "" | "Y" | "y" | "yes" | "Yes" | "YES" ) echo "continue";;
    * ) echo "aborted!";;
esac

ln -sf $DOTPATH/.vimrc $HOME/.vimrc
ln -sf $DOTPATH/.zshrc $HOME/.zshrc
ln -sf $DOTPATH/config $HOME/.config/i3/config
ln -sf $DOTPATH/.Xdefaults $HOME/.Xdefaults
