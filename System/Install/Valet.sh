if [[ $INSTALL_VALET == true ]]; then
  valet install
fi

if [ package_exists laravel/valet ]; then
  if [[ $CONFIGURE_VALET ]]; then
    [ -d $VALET_PATH ] || mkdir $VALET_PATH

    cd $VALET_PATH

    valet park
  fi
fi
