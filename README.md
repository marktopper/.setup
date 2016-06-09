# Setup Mac OS X 10.11 El Capitan

This is my personal setup I do with a clean Mac OS X 10.11 El Capitan install.

## Requirements
Before you continue you must install Xcode from AppStore.  
Once installed open Xcode and accept license and close Xcode.  
Download and install the __Xcode Command Line Tools__ by running `xcode-select --install`.  

## Install
Download setup
```
curl -LOk http://github.com/marktopper/.setup/archive/master.zip
```

Unzip `master.zip`
```
unzip master.zip
```

Move to `~/.setup`
```
mv .setup-master ~/.setup
```

Remove `master.zip`
```
rm master.zip
```

Now you may modify the configuration which is located in `~/.setup/Config`, once done continue to running installer.

Run installer
```
sh ~/.setup/Install.sh
```

## Update
In order to update this installer script you must run the following task once in order to get the git repository.
```
rm -rf ~/.setup
git clone https://github.com/marktopper/.setup.git ~/.setup
```

Once this is done you can always update this way.
```
cd ~/.setup
git pull
```
