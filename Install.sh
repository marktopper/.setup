# Die on failures
set -e

# Load global system
source ~/.setup/System/Global.sh

# Load profile paths
load System/Profile/Bash/Paths.sh

# Install Homebrew
load System/Install/Homebrew.sh

# Install Bottles
load System/Install/Bottles.sh

# Install Apps
load System/Install/Apps.sh

# Install RVM
load System/Install/RVM.sh

# Install Powify
load System/Install/Powify.sh

# Configure Vagrant
load System/Install/Vagrant.sh

# Configure Preferences
load System/Install/Preferences.sh

# Configure Gitfiles
load System/Install/Gitfiles.sh

# Install Composer Packages
load System/Install/Packages.sh

# Install Valet
load System/Install/Valet.sh

# Install Homestead
load System/Install/Homestead.sh

# Set permisions for Homebrew folder
sudo chown -R $(whoami) $(brew --prefix)

# Install slack-cleaner
# https://github.com/kfei/slack-cleaner
# TODO: Move to config
pip install slack-cleaner

# Install pow!
# TODO: Fix or remove - conflicts with Valet (port conflict)
#curl get.pow.cx | sh

if [[ $WRITE_TO_PROFILE == true ]]; then
  # Add Profile.sh to .bash_profile
  echo 'source ~/.setup/System/Profile.sh' > ~/.bash_profile
fi

print_success "Installation complete!"

# Load profile
source ~/.bash_profile
