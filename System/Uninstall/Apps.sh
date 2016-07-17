# Install  app if not installed
function uninstall_app {
  if [ -d /usr/local/Caskroom/$1 ]; then
    print_header "Uninstalling $1..."
    brew cask uninstall $1
    print_header "$1 uninstalled."
  else
    print_header "Skipping $1, already uninstalled."
  fi
}

# Uninstall all cask applications
for app in "${apps[@]}"
do
  uninstall_app $app
done
