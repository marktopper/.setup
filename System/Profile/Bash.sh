source ~/.setup/System/Profile/Bash/Color.sh
source ~/.setup/System/Profile/Bash/Autocompletion.sh
source ~/.setup/System/Profile/Bash/Paths.sh
#source ~/.setup/System/Profile/Bash/Prompt.sh
source ~/.setup/System/Profile/Bash/Editor.sh
source ~/.setup/System/Profile/Bash/Go.sh
source ~/.setup/System/Profile/Bash/Heroku.sh
source ~/.setup/System/Profile/Bash/Node.sh
#source ~/.setup/System/Profile/Bash/Ruby.sh
source ~/.setup/System/Profile/Bash/XQuartz.sh

alias art='php artisan'
alias home='cd ~/'
alias hosts='sudo nano /etc/hosts'
alias reload='source ~/.bash_profile'
alias sim='open /Applications/Xcode.app/Contents/Applications/iOS Simulator.app'
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

boop() {
  brew update && brew upgrade && brew cleanup \
    && cask-upgrade && cask-retire && brew cask cleanup \
      && brew doctor && brew cask doctor
}

__is_pinned() {
  local pinned=";pixate-studio;sketchup;skype;"
  [[ *";${1};"* != "${pinned}" ]] && return 0 || return 1
}

cask-upgrade() {
  while read -r; do
    reply=(${REPLY})
    name="${reply[0]}"
    vers="${reply[1]}"
    if ! __is_pinned "${name}"; then
      if [[ "${vers}" == "latest" ]]; then
        brew cask install "${name}" --force
      else
        brew cask install "${name}" 2> >(grep -v "re-install")
      fi
    fi
  done < <(brew cask list --versions)
}

cask-retire() {
  room="/opt/homebrew-cask/Caskroom"
  while read -r; do
    reply=(${REPLY})
    name="${reply[0]}"
    vers="${reply[1]}"
    if ! __is_pinned "${name}"; then
      for inst in $(ls "${room}/${name}"); do
        if [[ "${inst}" != "${vers}" ]]; then
          echo "Removing ${name} version ${inst}"
          rm -r "${room}/${name}/${inst}"
        fi
      done
    fi
  done < <(brew cask list --versions)
}
alias bu="boop"

alias list-users="dscl . list /Users | grep -v ^_.*"
