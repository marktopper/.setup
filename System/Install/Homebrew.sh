# Install Homebrew
if ! command_exists brew; then
  echo "=== Installing Homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew doctor
  echo "=== Homebrew installed."
fi
#brew -v
#sudo chown -R $USER /usr/local/Cellar
brew update
brew cleanup
brew cask cleanup
echo "=== Updated homebrew bottles."

# Update homebrew path if not updated
if [[ -e /opt/homebrew-cask/Caskroom ]]; then
  echo "=== Updating homebrew path..."
  mv /opt/homebrew-cask/Caskroom /usr/local/Caskroom
  echo "=== Homebrew path updated."
fi
