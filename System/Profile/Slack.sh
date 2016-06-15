# Clear channels in Slack (ask for token one first use for a new team)
# Usage: clear-slack-channel team channel
clear-slack-channel () {
  TEAM=$1
  CHANNEL=$2

  # Ensure that cache path for slack-team-tokens exists
  if [ ! -d ~/.setup/.cache/slack-team-tokens ]; then
    mkdir ~/.setup/.cache/slack-team-tokens
  fi

  if [ -z "$TEAM" ]; then
    echo "Usage: clear-slack-channel team channel"
  else
    if [ -z "$CHANNEL" ]; then
      echo "Usage: clear-slack-channel team channel"
    else
      FILE=~/.setup/.cache/slack-team-tokens/$TEAM.txt
      if [ ! -e "$FILE" ]; then
        print_error "We do not have a token for \"$TEAM\"."
        echo "Create one at https://api.slack.com/docs/oauth-test-tokens for \"$TEAM\"."
        read -p "Enter token: " TOKEN
        cache_write "slack-team-tokens/$TEAM.txt" "$TOKEN"
        print_success "Token saved at ~/.setup/.cache/slack-team-tokens/$TEAM.txt"
      fi

      TOKEN=$(cache_read "slack-team-tokens/$TEAM.txt")

      slack-cleaner --token $TOKEN --message --channel $CHANNEL --user "*" --bot --perform
      # TODO: Make a single post to the channel!
    fi
  fi
}
