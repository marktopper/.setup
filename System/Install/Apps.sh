# Install  app if not installed
function install_app {
  echo "=== Installing $1..."
  brew cask install $1
  echo "=== $1 installed."
}

# Install all cask applications
for app in "${apps[@]}"
do
  install_app $app
done