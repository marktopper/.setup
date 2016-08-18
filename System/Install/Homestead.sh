if [[ $INSTALL_HOMESTEAD == true ]]; then
  # Install Homestead

  LIST=`vagrant box list`

  # TODO: Fix this since it thinks laravel/homestead is not
  # allready installed another box is installed as well.
  if [[ ! $LIST == "laravel/homestead (virtualbox, 0.4.4)" ]]; then
    vagrant box add laravel/homestead

    git clone https://github.com/laravel/homestead.git ~/Homestead

    chmod +x ~/Homestead/init.sh
    bash ~/Homestead/init.sh

    [ -d $HOMESTEAD_PATH ] || mkdir $HOMESTEAD_PATH
  fi
fi
