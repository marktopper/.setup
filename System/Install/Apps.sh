# Install  app if not installed
function install_app {
  print_header "Installing $1..."
  brew cask install $1
  print_header "$1 installed."
}

# Install all cask applications
for app in "${apps[@]}"
do
  install_app $app
done
