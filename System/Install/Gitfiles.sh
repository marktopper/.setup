if [[ $INSTALL_GITFILES ]]; then
  rm -f ~/.gitignore
  rm -f ~/.tmux.conf
  rm -f ~/.gemrc

  ln -s ~/.setup/etc/gitignore_global ~/.gitignore
  git config --global core.excludesfile ~/.gitignore
  ln -s ~/.setup/etc/tmux.conf_global ~/.tmux.conf
  ln -s ~/.setup/etc/gemrc_global ~/.gemrc
fi
