# Create UserConfig if not exists
if [ ! -d ~/.SetupUserConfig ]; then
    cp -r ~/.setup/Config ~/.SetupUserConfig
fi

configure () {
    # Copy file if it does not exists yet in .SetupUserConfig
    if [ ! -f "${HOME}/.SetupUserConfig/${1}.sh" ]; then
      cp "${HOME}/.setup/Config/${1}.sh" "${HOME}/.SetupUserConfig/${1}.sh"
    fi

    read -p "Configure $1? [y/N] " reply

    if [[ $reply =~ ^[Yy]$ ]]
    then
        open ~/.SetupUserConfig/$1.sh
    fi
}

configure General
configure Bottles
configure Apps
#configure Backup
configure Homestead
configure Node
configure Packages
configure SSH
configure Valet
configure Sync

read -p "Press enter once done configuring "

read -p "Do you wish to start the installer? [y/N] " install
if [[ $install =~ ^[Yy]$ ]]
then
    source ~/.setup/Install.sh
fi