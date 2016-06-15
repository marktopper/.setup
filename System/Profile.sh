# Load global system
source ~/.setup/System/Global.sh

if [[ $LOAD_PROFILE ]]; then
  # Loads all the needed configuration, functions and aliases for the terminal user
  load System/Profile/Autojump.sh
  load System/Profile/Bash.sh
  load System/Profile/Git.sh
  load System/Profile/Java.sh
  load System/Profile/Aliases.sh
  load System/Profile/Fuck.sh
  load System/Profile/Slack.sh
fi
