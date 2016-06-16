# Tap brew bottle
function tap_bottle {
  print_header "Tapping $1..."
  brew tap $1
  print_header "$1 tapped."
}

# Install brew bottle if command does not exists
function install_bottle {
  if [ ! -d /usr/local/Cellar/$1 ]; then
    print_header "Installing $1..."
    brew install $1
    print_header "$1 installed."
  else
    print_header "Skipping $1, already installed."
  fi
}

# Pin brew bottle
function pin_bottle {
  print_header "Pinging $1..."
  brew pin $1
  print_header "$1 pinned."
}

if [[ $TAP_BOTTLES == true ]]; then
  # Tap all taps
  for tap in "${taps[@]}"
  do
    tap_bottle $tap
  done
fi

if [[ $INSTALL_BOTTLES == true ]]; then
  # Install all bottles
  for bottle in "${bottles[@]}"
  do
    install_bottle $bottle
  done
fi

if [[ $PIN_BOTTLES == true ]]; then
  # Pin all pins
  for pin in "${pin[@]}"
  do
    pin_bottle $pin
  done
fi
