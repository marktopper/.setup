alias art='php artisan'
alias tinker='php artisan tinker'
alias ipconfig='/sbin/ifconfig'
alias watch='gulp watch'
alias home='cd ~/'
alias hosts='sudo nano /etc/hosts'
alias reload='source ~/.bash_profile'
alias sim='open /Applications/Xcode.app/Contents/Applications/iOS\ Simulator.app'
alias docs='cd ~/Documents'
alias c='clear'
alias lookbusy="cat /dev/urandom | hexdump -C | grep --color 'ca fe'"
alias morning='open spotify:track:6Z1Bm6R5I3Kc38ycsj6pgk'
alias gitmessage='curl -s http://whatthecommit.com/index.txt'
alias online='echo "Ping Google.com" && ping google.com'
alias ipinfo='curl ipinfo.io'
alias ip='curl icanhazip.com'
alias vag='cd ~/.homestead; vagrant'
alias flush="dscacheutil -flushcache && killall -HUP mDNSResponder"
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl; sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'delete from LSQuarantineEvent'"
alias list-users="dscl . list /Users | grep -v ^_.*"
alias ls="ls -G"
alias lsla="ls -la"
alias laravel-cs-fixer="php-cs-fixer fix . --fixers=\"-psr0\""

__valet_site () {
  if [[ -z $1 ]]; then
    print_error "Missing argument [name]."
  else
    GO=$(pwd)
    cd $VALET_PATH
    laravel new $1
    cd $1
    valet secure
    cd $GO
  fi
}

alias valet-site="__valet_site"
