########################################
# VAGRANT IS UNINSTALLED UNDER Apps.sh #
#    Here we just configure Vagrant    #
########################################

# Uninstall Parallels Plugin for Vagrant
if vagrant plugin list | grep -q '^vagrant-parallels '; then
  vagrant plugin uninstall vagrant-parallels
fi
