if ! command_exists rvm; then
  echo "=== Installing RVM..."
  curl -L https://get.rvm.io | bash -s stable
  echo "=== RVM installed."
  source ~/.bash_profile
fi
rvm -v