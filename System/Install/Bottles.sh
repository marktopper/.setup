# Tap brew bottle
function tap_bottle {
  echo "=== Tapping $1..."
  brew tap $1
  echo "=== $1 tapped."
}

# Install brew bottle if command does not exists
function install_bottle {
  if ! command_exists $1; then
    echo "=== Installing $1..."
    brew install $1
    echo "=== $1 installed."
  else
    echo "=== Skipping $1, already installed."
  fi
}

# Pin brew bottle
function pin_bottle {
  echo "=== Pinging $1..."
  brew pin $1
  echo "=== $1 pinned."
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