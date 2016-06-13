# Uninstall Homebrew
if command_exists brew; then
  echo "=== Uninstalling Homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/uninstall)"
  echo "=== Homebrew uninstalled."
fi
