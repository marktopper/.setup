# Die on failures
set -e

# Echo all commands
# set -x

# Profile file from base path
load () {
  source $BASEDIR/$1;
}

# Profile all files in a folder
loadFilesIn() {
  for ENTRY in `ls $BASEDIR/$1`; do
    load "$1"/"$ENTRY"
  done
}

# Check if command exists
command_exists () {
  FILE=./"$BASEDIR"/System/CommandExists/"$1".sh
  if [ -f "$FILE" ]
  then
    source $FILE
  else
    type "$1" &> /dev/null ;
  fi
}

# Configuration
load System/Config.sh