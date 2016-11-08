# Die on failures
set -e

# Prepare with permissions
sudo chown -R "$USER" /usr/local

# Load global system
source ~/.setup/System/Global.sh

# Load profile paths
load System/Profile/Scripts/Paths.sh

# Install Homebrew
load System/Install/Homebrew.sh

# Install Bottles
load System/Install/Bottles.sh

# Install Apps
load System/Install/Apps.sh

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

# Install Node Packages
load System/Install/Node.sh

# Install Valet
load System/Install/Valet.sh

# Install Homestead
load System/Install/Homestead.sh

# Install OhMyZsh
load System/Install/OhMyZsh.sh

# Install Scripts
load System/Install/Scripts.sh

# Install Pip Packages
load System/Install/Pips.sh

# Set permisions for Homebrew folder
sudo chown -R $(whoami) $(brew --prefix)

if [[ $WRITE_TO_PROFILE == true ]]; then
  # Add Profile.sh to .bash_profile
  # TODO: Append to end of file instead
  # TODO: Do not append if it's already there
  echo 'source ~/.setup/System/Profile.sh' > ~/.bash_profile
fi

print_success "Installation complete!"

# Do not die on failures
set +e

# Set variable to let scripts know that install have just been completed
INSTALL_COMPLETE=true

# Load profile
source ~/.bash_profile
