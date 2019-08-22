# Load all files in Config
load_files_in Config

# Create UserConfig if not exists
if [ ! -d ~/.SetupUserConfig ]; then
    cp -r ~/.setup/Config ~/.SetupUserConfig
fi

# Load all default config files
for ENTRY in `ls ~/.setup/Config`; do
    source ~/.setup/Config/"$ENTRY"
done

# Load all user config files
for ENTRY in `ls ~/.SetupUserConfig`; do
    source ~/.SetupUserConfig/"$ENTRY"
done