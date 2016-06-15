# Install composer package if not installed
function install_package {
  print_header "Installing $1..."
  composer global require $1
  print_header "$1 installed."
}

# Install all composer packages
for package in "${packages[@]}"
do
  install_package $package
done
