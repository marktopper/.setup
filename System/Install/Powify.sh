if ! command_exists powify; then
  echo "=== Installing powify..."
  sudo gem install powify
fi
gem query --local |grep powify