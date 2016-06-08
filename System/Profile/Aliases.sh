# Airport/Wifi Scan - get details: airport -s
alias airport='/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport /usr/sbin/airport'

# Prevent Mac From Sleep - choose seconds: nosleep -u -t 3600
alias nosleep='caffeinate'

# Restart Powify
alias powr='powify restart'

# Show hidden files
alias showHiddenFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'

# Hide hidden files
alias hideHiddenFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

# Enable autocorrect
alias enableAutocorrect='defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool true'

# Disable autocorrect
alias disableAutocorrect='defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false'
