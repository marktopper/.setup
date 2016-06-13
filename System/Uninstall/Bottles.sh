# Uninstall brew bottle if command does not exists
function uninstall_bottle {
  if command_exists $1; then
    echo "=== Uninstalling $1..."
    brew install $1
    echo "=== $1 uninstalled."
  else
    echo "=== Skipping $1, already uninstalled."
  fi
}

# Uninstall all bottles
for bottle in "${bottles[@]}"
do
  uninstall_bottle $bottle
done
