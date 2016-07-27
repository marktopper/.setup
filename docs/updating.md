# Updating

Updating `.setup` will get you the latest features and tools.

## Prepare updating

> This step is only needed once.

In order to update this installer script you must run the following task once in order to get the git repository.

> Please note that the below commands will remove your current configurations.  
> You may want to backup your current configurations before running the below commands and then you can manually merge the configurations afterwards.

```
rm -rf ~/.setup
git clone https://github.com/marktopper/.setup.git ~/.setup
```

## Update

Update easily with those few commands.

```
cd ~/.setup
git pull
```
