if [[ $INSTALL_PACKAGES == true ]]; then
  # Install composer package if not installed
  function install_package {
    if [ ! -d ~/.composer/vendor/$1 ]; then
      print_header "Installing $1..."
      composer global require $1
      print_header "$1 installed."
    else
      print_header "Skipping $1, already installed."
    fi
  }

  # Install all composer packages
  for package in "${packages[@]}"
  do
    install_package $package
  done
fi
