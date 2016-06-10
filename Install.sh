BASEDIR=$(dirname "$0")
source $BASEDIR/System/Global.sh

pushd `dirname $0` > /dev/null
FULLPATH=`pwd -P`
popd > /dev/null

# Install Homebrew
load System/Install/Homebrew.sh

# Install Bottles
load System/Install/Bottles.sh

# Install Apps
load System/Install/Apps.sh

# Install RVM
# TODO: Fix!
#load System/Install/RVM.sh

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

sudo chown -R $(whoami) $(brew --prefix)

# Add Profile.sh to .bash_profile
echo 'source ~/.setup/System/Profile.sh' > ~/.bash_profile

echo ""
echo " #################################"
echo " ##### INSTALLATION COMPLETE #####"
echo " #################################"
echo ""
