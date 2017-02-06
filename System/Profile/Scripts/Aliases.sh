# Clear User Setup Config
alias clear-setup-config='rm -rf ~/.SetupUserConfig; cp -r ~/.setup/Config ~/.SetupUserConfig'

# Airport/Wifi Scan - get details: airport -s
alias airport='/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport /usr/sbin/airport'

# Prevent Mac From Sleep - choose seconds: nosleep -u -t 3600
alias nosleep='caffeinate'

# Show hidden files
alias showHiddenFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'

# Hide hidden files
alias hideHiddenFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

# Enable autocorrect
alias enableAutocorrect='defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool true'

# Disable autocorrect
alias disableAutocorrect='defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false'

alias clear-setup-cache="rm -rf ~/.setup/.cache"
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
alias flush="dscacheutil -flushcache && sudo killall -HUP mDNSResponder"
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl; sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'delete from LSQuarantineEvent'"
alias list-users="dscl . list /Users | grep -v ^_.*"
alias ls="ls -G"
alias lsla="ls -la"
alias laravel-cs-fixer="php-cs-fixer fix . --fixers=\"-psr0\""

function valet-site () {
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

function chuck () {
  echo `curl -s http://api.icndb.com/jokes/random` | python -c 'import json,sys;obj=json.load(sys.stdin);print obj["value"]["joke"]';
}

alias snake="php ~/.php-snake/play.php"

function servephp () {
    if [ $# -eq 1 ]; then
        php -S 0.0.0.0:$1
    else
        php -S 0.0.0.0:8000
    fi
}

# A fix since Valet often break on Sierra.
function valet-fix () {
    brew uninstall caddy && brew install caddy
    rm ~/.composer/vendor/laravel/valet/bin/caddy
    cd ~/.composer/vendor/laravel/valet/bin
    ln -s /usr/local/bin/caddy
}

function node-docs {
    local section=${1:-all}
    open "https://nodejs.org/docs/$(node --version)/api/$section.html"
}

function laravel-docs {
    local section=${1:-''}
    open "https://laravel.com/docs/$section"
}

# IP/ASN lookup by using cymru's whois server
#>whois 8.8.8.8
#AS      | IP               | AS Name
#15169   | 8.8.8.8          | GOOGLE - Google Inc., US
#>cwhois as15169
#AS Name
#GOOGLE - Google Inc., US
function cwhois() {
    whois -h whois.cymru.com "$@";
}

_symfony_console () {
  echo "php $(find . -maxdepth 2 -mindepth 1 -name 'console' -type f | head -n 1)"
}
_symfony2_get_command_list () {
   `_symfony_console` --no-ansi | sed "1,/Available commands/d" | awk '/^  ?[^ ]+ / { print $1 }'
}
_symfony2 () {
   compadd `_symfony2_get_command_list`
}
#Symfony aliases
alias sf='`_symfony_console`'
alias sfcl='sf cache:clear'
alias sfai='sf assets:install'
alias sfsr='sf server:run -vvv'
alias sfsc='sf security:check'
alias sfcw='sf cache:warmup'
alias sfroute='sf debug:router'
alias sfcontainer='sf debug:container'
alias sfgb='sf generate:bundle'
alias sfgc='sf generate:controller'
alias sfdev='sf --env=dev'
alias sfprod='sf --env=prod'
#Doctrine alias
alias sfge='sf doctrine:generate:entity'
alias sfdc='sf doctrine:database:create'
alias sfdd='sf doctrine:database:drop --force'
alias sfsc='sf doctrine:schema:create'
alias sfsu='sf doctrine:schema:update'
#Need DoctrineFixturesBundle
alias sffixtures='sf doctrine:fixtures:load'




#
# Aliases
# (sorted alphabetically)
#

alias dk='docker'

alias dkb='docker build'

alias dkex='docker exec'
alias dkexit='docker exec -it'

alias dknet='docker network'

alias dkps='docker ps'
alias dkpsa='docker ps -a'

alias dkr='docker run'
alias dkrit='docker run -it'

alias dkv='docker version'
alias dkvol='docker volume'

# Reload bash profile
function reload {
    source ~/.bash_profile
}
