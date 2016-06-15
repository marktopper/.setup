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

# Uninstall RVM
load System/Uninstall/RVM.sh

# Uninstall Apps
load System/Uninstall/Apps.sh

# Uninstall Bottles
load System/Uninstall/Bottles.sh

# Uninstall Homebrew
load System/Uninstall/Homebrew.sh

# Remove Profile.sh from .bash_profile
echo '#source ~/.setup/System/Profile.sh' > ~/.bash_profile

echo ""
echo " ###################################"
echo " ##### UNINSTALLATION COMPLETE #####"
echo " ###################################"
echo ""
