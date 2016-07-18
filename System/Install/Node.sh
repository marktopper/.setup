if [[ $INSTALL_NODE_PACKAGES == true ]]; then
  # Install node package if not installed
  function install_node_package {
    if [ ! -d /usr/local/lib/node_modules/$1 ]; then
      print_header "Installing $1..."
      npm install -g $1
      print_header "$1 installed."
    else
      print_header "Skipping $1, already installed."
    fi
  }

  # Install all node packages
  for package in "${node_packages[@]}"
  do
    install_node_package $package
  done
fi
