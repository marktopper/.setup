if [[ $INSTALL_PIPS == true ]]; then
  sudo easy_install pip
  sudo chown -R $USER /Library/Python/2.7

  # Install python package if not installed
  function install_pip {
    print_header "Installing $1..."
    pip install $1
    print_header "$1 installed."
  }

  # Install all python packages
  for package in "${pips[@]}"
  do
    install_pip $package
  done
fi
