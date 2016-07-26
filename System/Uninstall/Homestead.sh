# Uninstall Homestead
if vagrant box list | grep -q '^laravel/homestead '; then
  vagrant box remove laravel/homestead
fi
