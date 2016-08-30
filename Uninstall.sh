# Die on failures
set -e

# Load global system
source ~/.setup/System/Global.sh

# Uninstall Homestead
load System/Uninstall/Homestead.sh

# Uninstall Valet
load System/Uninstall/Valet.sh

# Uninstall Composer Packages
load System/Uninstall/Packages.sh

# Remove Vagrant
load System/Uninstall/Vagrant.sh

# Uninstall Powify
load System/Uninstall/Powify.sh

# Uninstall Apps
load System/Uninstall/Apps.sh

# Uninstall Bottles
load System/Uninstall/Bottles.sh

# Uninstall Homebrew
load System/Uninstall/Homebrew.sh

# Uninstall OhMyZsh
load System/Uninstall/OhMyZsh.sh

if [[ $WRITE_TO_PROFILE == true ]]; then
  # Remove Profile.sh from .bash_profile
  # TODO: Remove correcly instead of this
  echo '#source ~/.setup/System/Profile.sh' > ~/.bash_profile
fi

print_success "Uninstallation complete!"

# Do not die on failures
set +e

# Load profile
source ~/.bash_profile
