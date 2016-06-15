brew_update() {
  brew update && brew upgrade && brew cleanup \
    && cask-upgrade && cask-retire && brew cask cleanup \
      && brew doctor && brew cask doctor
}

__is_pinned() {
  local pinned=";pixate-studio;sketchup;skype;" # TODO: Get real pinned!
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

alias bu="brew_update"
