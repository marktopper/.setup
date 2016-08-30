# Remove thefabpot/php-cs-fixer, if needed use friendsofphp/php-cs-fixer instead.
if [ -d ~/.composer/vendor/thefabpot/php-cs-fixer ]; then
  composer global uninstall thefabpot/php-cs-fixer
fi
