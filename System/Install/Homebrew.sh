if [[ $INSTALL_HOMEBREW ]]; then
  # Install Homebrew
  if ! command_exists brew; then
    print_header "Installing Homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew doctor
    print_header "Homebrew installed."
  fi
  #brew -v
  #sudo chown -R $USER /usr/local/Cellar
  brew update
  brew cleanup
  brew cask cleanup
  print_header "Updated homebrew bottles."

  # Update homebrew path if not updated
  # https://github.com/caskroom/homebrew-cask/issues/21913
  if [[ -e /opt/homebrew-cask/Caskroom ]]; then
    print_header "Updating homebrew path..."
    mv /opt/homebrew-cask/Caskroom /usr/local/Caskroom
    print_header "Homebrew path updated."
  fi
fi
