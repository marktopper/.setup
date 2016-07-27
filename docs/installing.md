# Installing

Setup `.setup` is quite easy, since the `.setup` script takes care of the most.

## Requirements
Before you continue you must install Xcode from AppStore.  
Once installed open Xcode and accept license and close Xcode.  
Download and install the __Xcode Command Line Tools__ by running `xcode-select --install`.  

## Download
Download and move setup
```
curl -LOk http://github.com/marktopper/.setup/archive/master.zip
unzip master.zip
mv .setup-master ~/.setup
rm master.zip
```

## Configure
Now you may modify the configuration which is located in `~/.setup/Config`, once done continue to running installer.  
To open the folder run `open ~/.setup/Config`.  
Read the [documentations](https://github.com/marktopper/.setup/tree/master/docs/configure.md) for help to configure your setup.

## Run
Run installer
```
sh ~/.setup/Install.sh
```
