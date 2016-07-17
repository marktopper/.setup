if [[ $INSTALL_HOMEBREW ]]; then
  # Install Homebrew
  if ! command_exists brew; then
    print_header "Installing Homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew doctor
    print_header "Homebrew installed."
  else
    brew upgrade
    brew update
    brew cleanup
    brew cask cleanup
  fi
fi
