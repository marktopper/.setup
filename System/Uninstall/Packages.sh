# Uninstall composer package if installed
function uninstall_package {
  echo "=== Uninstalling $1..."
  composer global remove $1
  echo "=== $1 uninstalled."
}

# Uninstall all composer packages
for package in "${packages[@]}"
do
  uninstall_package $package
done
