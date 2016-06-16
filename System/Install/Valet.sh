if [[ $INSTALL_VALET == true ]]; then
  valet install
fi

if [ -d ~/.composer/vendor/laravel/valet ]; thenn
  if [[ $CONFIGURE_VALET ]]; then
    [ -d $VALET_PATH ] || mkdir $VALET_PATH

    cd $VALET_PATH

    valet park
  fi
fi
