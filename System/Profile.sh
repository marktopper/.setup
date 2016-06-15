TEXT_COLOR_BLACK='\33[0;30m'
TEXT_COLOR_RED='\33[0;31m'
TEXT_COLOR_GREEN='\33[0;32m'
TEXT_COLOR_BROWN='\33[0;33m'
TEXT_COLOR_ORANGE='\33[0;33m'
TEXT_COLOR_BLUE='\33[0;34m'
TEXT_COLOR_PURPLE='\33[0;35m'
TEXT_COLOR_CYAN='\33[0;36m'
TEXT_COLOR_LIGHT_GRAY='\33[0;37m'
TEXT_COLOR_DARK_GRAY='\33[1;30m'
TEXT_COLOR_LIGHT_RED='\33[1;31m'
TEXT_COLOR_LIGHT_GREEN='\33[1;32m'
TEXT_COLOR_YELLOW='\33[1;33m'
TEXT_COLOR_LIGHT_BLUE='\33[1;34m'
TEXT_COLOR_LIGHT_PURPLE='\33[1;35m'
TEXT_COLOR_LIGHT_CYAN='\33[1;36m'
TEXT_COLOR_WHITE='\33[1;37m'
TEXT_COLOR_DEFAULT='\033[0m'

print_header () {
  printf "${TEXT_COLOR_LIGHT_BLUE}==> ${TEXT_COLOR_DEFAULT} $1 \n"
}

# Loads all the needed configuration, functions and aliases for the terminal user
source ~/.setup/System/Profile/Autojump.sh
source ~/.setup/System/Profile/Bash.sh
source ~/.setup/System/Profile/Git.sh
source ~/.setup/System/Profile/Java.sh
source ~/.setup/System/Profile/Aliases.sh
source ~/.setup/System/Profile/Fuck.sh
source ~/.setup/System/Profile/Slack.sh
