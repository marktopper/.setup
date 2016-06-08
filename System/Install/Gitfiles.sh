echo `{ rm ~/.gitignore && cat output ; } || cat log`
echo `{ rm ~/.tmux.conf && cat output ; } || cat log`
echo `{ rm ~/.gemrc && cat output ; } || cat log`

ln -s $BASEDIR/etc/gitignore_global ~/.gitignore
git config --global core.excludesfile ~/.gitignore
ln -s $BASEDIR/etc/tmux.conf_global ~/.tmux.conf
ln -s $BASEDIR/etc/gemrc_global ~/.gemrc