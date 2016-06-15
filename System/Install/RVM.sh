if ! command_exists rvm; then
  print_header "Installing RVM..."
  curl -L https://get.rvm.io | bash -s stable
  print_header "RVM installed."
  source ~/.bash_profile
fi
rvm -v
