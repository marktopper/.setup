# Define wether or not to install the Oh My Zsh
if [[ $INSTALL_OH_MY_ZSH == true ]]; then
  sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

  rm -rf ~/.zshrc
  cp ~/.setup/bin/zshrc.txt ~/.zshrc
fi
