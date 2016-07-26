__is_pinned() {
  local pinned=";pixate-studio;sketchup;skype;" # TODO: Get real pinned!
  [[ *";${1};"* != "${pinned}" ]] && return 0 || return 1
}

brew-update() {
  (set -x; brew update;)
  (set -x; brew cask update;)

  (set -x; brew cleanup;)
  (set -x; brew cask cleanup;)

  red=`tput setaf 1`
  green=`tput setaf 2`
  reset=`tput sgr0`

  casks=( $(brew cask list) )

  for cask in ${casks[@]}
  do
      installed="$(brew cask info $cask | grep 'Not installed')"

      if [[ $installed = *[!\ ]* ]]; then
        if ! __is_pinned "${name}"; then
          echo "${red}${cask}${reset} requires ${red}update${reset}."
          (set -x; brew cask install $cask --force;)
        else
          echo "${red}${cask}${reset} is pinned."
        fi
      else
          echo "${red}${cask}${reset} is ${green}up-to-date${reset}."
      fi
  done
}
