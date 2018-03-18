# Install  app if not installed
function install_app {
  if [ ! -d /usr/local/Caskroom/$1 ]; then
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

# If Adobe Creative Cloud is installed, run installer
open /usr/local/Caskroom/adobe-creative-cloud/latest/Creative\ Cloud\ Installer.app > /dev/null 2>&1 || true

# If Battle.net is installed, run installer
open /usr/local/Caskroom/battle-net/latest/Battle.net-Setup.app > /dev/null 2>&1 || true
