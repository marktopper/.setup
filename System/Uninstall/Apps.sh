# Install  app if not installed
function uninstall_app {
  echo "=== Uninstalling $1..."
  brew cask uninstall $1
  echo "=== $1 uninstalled."
}

# Uninstall all cask applications
for app in "${apps[@]}"
do
  uninstall_app $app
done
