if command_exists rvm; then
  echo "=== Uninstalling RVM..."
  rvm implode
  rm -rf ~/.rvm
  echo "=== RVM installed."
fi
