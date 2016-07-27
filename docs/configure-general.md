# General Configuration
Modify running `open ~/.setup/Config/General.sh`.

## Homebrew
You can read about Homebrew at http://brew.sh/.  
To skip installation of Homebrew set `INSTALL_HOMEBREW` to `false`.  
However [apps](https://github.com/marktopper/.setup/tree/master/docs/configure-apps.md) will not be installed since it uses Homebrew.

## Profile
Our profile bash includes a lot of functions, configuration and aliases.  
Many of our tools requires that profile is loaded.  
However if you have problems with your terminal you might wanna try turn it off for debugging by setting `LOAD_PROFILE` to `false`.  
The installation will overwrite your `~/.bash_profile`-file, if you do not want this to be overwriting, you would turn `WRITE_TO_PROFILE` to `false` and insert `source ~/.setup/System/Profile.sh` to the end of your `~/.bash_profile`-file manually.

## Debug
Enable debugging by setting `DEBUG` to `true`.

## Powify
Powify is a management tool for Pow by 37 signals. It allows you to easily install, update, and manage pow and pow applications seamlessly. To get started, read the installation section below.  
Disable it by setting `INSTALL_POWIFY` to `false`.

## Gitfiles
The script will setup recommented `.gitignore` settings and others.  
You can set `INSTALL_GITFILES` to `false` to skip installing it.

## PREFERENCES
My personal preferences are setup in this step.  
Set `INSTALL_PREFERENCES` to `false` to skip this step.

> Working on setting up configurations for those preferences.

## RVM
This should stay turned `false` for now.  
It have some bugs which I will have to fix first.
