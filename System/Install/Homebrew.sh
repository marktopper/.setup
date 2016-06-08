# Install Homebrew
if ! command_exists brew; then
  echo "=== Installing Homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew doctor
  echo "=== Homebrew installed."
fi
brew -v
sudo chown -R $USER /usr/local/Cellar
brew update
echo "=== Updated homebrew bottles."