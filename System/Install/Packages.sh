# Install composer package if not installed
function install_package {
  echo "=== Installing $1..."
  composer global require $1
  echo "=== $1 installed."
}

# Install all composer packages
for package in "${packages[@]}"
do
  install_package $package
done
