# Uninstall brew bottle if command does not exists
function uninstall_bottle {
  if [ -d /usr/local/Cellar/$1 ]; then
    print_header "Uninstalling $1..."
    brew install $1
    print_header "$1 uninstalled."
  else
    print_header "Skipping $1, already uninstalled."
  fi
}

# Uninstall all bottles
for bottle in "${bottles[@]}"
do
  uninstall_bottle $bottle
done
