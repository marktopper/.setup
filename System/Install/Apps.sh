# Install  app if not installed
function install_app {
  if ! application_installed $1; then
    print_header "Installing $1..."
    brew cask install $1
    print_header "$1 installed."
  else
    print_header "Skipping $1, already installed."
  fi
}

if [[ $INSTALL_APPS == true ]]; then
  # Install all cask applications
  for app in "${apps[@]}"
  do
    install_app $app
  done
fi
