# Clear channels in Slack (ask for token one first use for a new team)
# Usage: clear-slack-channel team channel
clear-slack-channel () {
  TEAM=$1
  CHANNEL=$2

  if [ -z "$TEAM" ]; then
    echo "Usage: clear-slack-channel team channel"
  else
    if [ -z "$CHANNEL" ]; then
      echo "Usage: clear-slack-channel team channel"
    else
      print_header "Deleting..."
    fi
  fi

}
