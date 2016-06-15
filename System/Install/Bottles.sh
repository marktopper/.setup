# Tap brew bottle
function tap_bottle {
  print_header "Tapping $1..."
  brew tap $1
  print_header "$1 tapped."
}

# Install brew bottle if command does not exists
function install_bottle {
  if ! command_exists $1; then
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

# Tap all taps
for tap in "${taps[@]}"
do
  tap_bottle $tap
done

# Install all bottles
for bottle in "${bottles[@]}"
do
  install_bottle $bottle
done

# Pin all pins
for pin in "${pin[@]}"
do
  pin_bottle $pin
done
