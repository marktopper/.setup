if [[ $INSTALL_POWIFY == true ]]; then
  if ! command_exists powify; then
    print_header "Installing powify..."
    sudo gem install powify
    print_header "Powify installed."
  fi
  gem query --local |grep powify
fi
