# Die on failures
set -e

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

# Install Scripts
load System/Install/Scripts.sh

# Install Pip Packages
load System/Install/Pips.sh

# Set permisions for Homebrew folder
sudo chown -R $(whoami) $(brew --prefix)/*

# Add required folder for running mongod.
#sudo mkdir -p /data/db
#sudo chown -R $(whoami) /data/db

# Ensure profile exists
touch ~/.bash_profile

if [[ $WRITE_TO_PROFILE == true ]]; then
  # Add Profile.sh to .bash_profile
  if grep -q "source ~/.setup/System/Profile.sh" ~/.bash_profile; then
  	echo "Profile already loading in ~/.bash_profile"
  else
  	echo '\n\n#Load .setup profile\nsource ~/.setup/System/Profile.sh\n\n' >> ~/.bash_profile
  fi

  # Add Profile.sh to .zshrc
  if grep -q "source ~/.setup/System/Profile.sh" ~/.zshrc; then
  	echo "Profile already loading in ~/.zshrc"
  else
  	echo "\n\n#Load .setup profile\nsource ~/.setup/System/Profile.sh\n\n" >> ~/.zshrc
  fi
fi

print_success "Installation complete!"

# Do not die on failures
set +e

# Set variable to let scripts know that install have just been completed
INSTALL_COMPLETE=true

# Load profile
source ~/.bash_profile
