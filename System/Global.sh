# Die on failures
set -e

# Echo all commands
# set -x

# Profile file from base path
load () {
  source ~/.setup/$1;
}

# Profile all files in a folder
loadFilesIn() {
  for ENTRY in `ls ~/.setup/$1`; do
    load "$1"/"$ENTRY"
  done
}

# Check if command exists
command_exists () {
  FILE=~/.setup/System/CommandExists/"$1".sh
  if [ -f "$FILE" ]
  then
    source $FILE
  else
    type "$1" &> /dev/null ;
  fi
}

# Print styled header
print_header () {
  printf "${TEXT_COLOR_LIGHT_BLUE}==> ${TEXT_COLOR_DEFAULT} $1 \n"
}

# Load color variables
load System/Global/Colors.sh

# Configuration
load System/Config.sh
