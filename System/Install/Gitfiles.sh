rm -f ~/.gitignore
rm -f ~/.tmux.conf
rm -f ~/.gemrc

ln -s $BASEDIR/etc/gitignore_global ~/.gitignore
git config --global core.excludesfile ~/.gitignore
ln -s $BASEDIR/etc/tmux.conf_global ~/.tmux.conf
ln -s $BASEDIR/etc/gemrc_global ~/.gemrc
