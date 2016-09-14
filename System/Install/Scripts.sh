# Install scripts
function install_script {
  sh ~/.setup/System/Install/Scripts/$1.sh
}

if [[ $INSTALL_SCRIPTS == true ]]; then
  # Install all scripts
  for script in "${scripts[@]}"
  do
    install_script $script
  done
fi