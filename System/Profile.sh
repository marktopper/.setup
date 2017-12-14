# Load global system
source ~/.setup/System/Global.sh

if [[ $LOAD_PROFILE ]]; then
  # Loads all the needed configuration, functions and aliases for the terminal user
  load System/Profile/Scripts.sh
fi