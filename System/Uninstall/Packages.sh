# Uninstall composer package if installed
function uninstall_package {
  if [ -d ~/.composer/vendor/$1 ]; then
    print_header "Uninstalling $1..."
    composer global remove $1
    print_header "$1 uninstalled."
  else
    print_header "Skipping $1, already uninstalled."
  fi
}

# Uninstall all composer packages
for package in "${packages[@]}"
do
  uninstall_package $package
done
