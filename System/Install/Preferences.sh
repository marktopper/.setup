# TODO: Make settings for these preferences
if [[ $INSTALL_PREFERENCES == true ]]; then
  # Set a blazingly fast keyboard repeat rate
  defaults write NSGlobalDomain KeyRepeat -int 2

  # Set a shorter Delay until key repeat
  defaults write NSGlobalDomain InitialKeyRepeat -int 15

  # Add a context menu item for showing the Web Inspector in web views
  defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

  # Show the ~/Library folder
  chflags nohidden ~/Library

  # Add a context menu item for showing the Web Inspector in web views
  defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

  # Expand save & print panels by default
  # Save menu
  defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
  defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true
  # Print menu
  defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
  defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

  # Always show scroll bars
  defaults write NSGlobalDomain AppleShowScrollBars -string "Always"
fi
