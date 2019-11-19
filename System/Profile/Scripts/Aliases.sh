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

function __valet_site () {
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
function __valet_fix () {
    brew uninstall caddy && brew install caddy
    rm ~/.composer/vendor/laravel/valet/bin/caddy
    cd ~/.composer/vendor/laravel/valet/bin
    ln -s /usr/local/bin/caddy
}
alias valet-fix="__valet_fix"

function __node_docs {
    local section=${1:-all}
    open "https://nodejs.org/docs/$(node --version)/api/$section.html"
}
alias node-docs="__node_docs"

function __laravel_docs {
    local section=${1:-''}
    open "https://laravel.com/docs/$section"
}
alias laravel-docs="__laravel_docs"

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


# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
    colorflag="--color"
else # OS X `ls`
    colorflag="-G"
fi

# List all files colorized in long format, including dot files
alias ll="ls -lah ${colorflag}"

# List only directories
alias lsd='ls -l | grep "^d"'

# Make me say "please"
alias please="sudo"


# Easier navigation: .., ..., ~ and -
alias ..="cd .."
alias cd..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~" # `cd` is probably faster to type though
alias -- -="cd -"

# Editor
alias subl='open -a "Sublime Text"'

# Docker Compose
alias dc='/usr/local/bin/docker-compose'
alias dcu='/usr/local/bin/docker-compose up -d'
alias dcup='/usr/local/bin/docker-compose up -d'
alias dcs='/usr/local/bin/docker-compose stop'
alias dcstop='/usr/local/bin/docker-compose stop'
alias dcb='/usr/local/bin/docker-compose up -d --build'
alias dcbuild='/usr/local/bin/docker-compose up -d --build'
alias dce='/usr/local/bin/docker-compose exec'
alias dcexec='/usr/local/bin/docker-compose exec'
alias 'docker-compose'='__enforce_aliases /usr/local/bin/docker-compose \
"dc: docker-compose" \
"dcu: docker-compose up -d" \
"dcs: docker-compose stop" \
"dcb: docker-compose up -d build" \
"dce: docker-compose exec" \
"__END__"'

without_alias_enforcement() {
  if [[ $ENFORCE_ALIASES == true ]]; then
    ENFORCE_ALIASES_BACKUP="${ENFORCE_ALIASES}"
    ENFORCE_ALIASES=false
  fi
}

reset_alias_enforcement() {
  ENFORCE_ALIASES="${ENFORCE_ALIASES_BACKUP}"
}

# Usage:
# alias 'some-method with-args or-whatever'='__enforce_aliases /path/to/executable \
# "short-command: long-command" \
# "shorter: longer-command with-whatever args" \
# "__END__"'
__enforce_aliases() {
  if [[ $ENFORCE_ALIASES == true ]]; then
    # Complain and tell the user to use the shortcuts.
    echo -e "\e[31m⛔️ Usage of shortcuts enforced!\e[39m"
    echo "Please use one of the following aliases:"

    shift
    for cmd in "$@"
    do
      if [ $cmd = "__END__" ]; then
        break
      fi

      echo "* $cmd"
    done

    echo ""
    echo "If this is ran by a third-part command, you can surround the command by 'without_alias_enforcement && [COMMAND] && reset_alias_enforcement'."
    echo "Example: without_alias_enforcement && docker-compose up -d && reset_alias_enforcement"
  else
    # Run original command, but directly to executable
    # sample: docker-compose exec php bash => /usr/local/bin/docker-compose exec php bash
    PARAMS=()

    STARTED=false
    for cmd in "$@"
    do
      if [[ $STARTED == true ]]; then
        PARAMS+=($cmd)
      fi

      if [ $cmd = "__END__" ]; then
        STARTED=true
      fi
    done

    ($1 $PARAMS[@])
  fi
}
