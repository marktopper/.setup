if [[ $INSTALL_HOMESTEAD == true ]]; then
  # Install Homestead

  if vagrant box list | grep -q laravel/homestead; then
    echo "Box [laravel/homestead] already installed!";
  else
    vagrant box add laravel/homestead

    git clone https://github.com/laravel/homestead.git ~/Homestead

    chmod +x ~/Homestead/init.sh
    bash ~/Homestead/init.sh

    [ -d $HOMESTEAD_PATH ] || mkdir $HOMESTEAD_PATH
  fi
fi
