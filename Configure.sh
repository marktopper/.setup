# Create UserConfig if not exists
if [ ! -d ~/.SetupUserConfig ]; then
    cp -r ~/.setup/Config ~/.SetupUserConfig
fi

configure () {
    read -p "Configure $1? [y/N] " reply

    if [[ $reply =~ ^[Yy]$ ]]
    then
        # TODO: if file does not exists, copy it from ~/.setup/Config/$1.sh
        open ~/.SetupUserConfig/$1.sh
    fi
}

configure General
configure Bottles
configure Apps
#configure Backup
configure Homestead
configure Node
configure OhMyZsh
configure Packages
configure SSH
configure Valet

read -p "Press enter once done configuring "

read -p "Do you wish to start the installer? [y/N] " install
if [[ $install =~ ^[Yy]$ ]]
then
    source ~/.setup/Install.sh
fi