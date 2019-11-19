# Define whether or not to install the taps, bottles and pins listed below
TAP_BOTTLES=true
INSTALL_BOTTLES=true
PIN_BOTTLES=true

# Define bottles to tap
taps=(\
 # Required for installing sudolikeaboss bottle
 ravenac95/sudolikeaboss \
 # Required for installing drivers
 homebrew/cask-drivers \
 # Required for installing fonts
 homebrew/cask-fonts \
 # Required for installing specific versions of bottles
 homebrew/cask-versions \
)

# Define bottles to install
# Simply comment out un-wanted bottles
bottles=(\
 ack \
 autojump \
 automake \
 # Required by OhMyZsh
 bash-completion \
 colordiff \
 curl \
 doxygen \
 # Required by OhMyZsh
 gf-complete \
 git \
 git-flow \
 hub \
 httpie \
 icoutils \
 imagemagick \
 popt \
 libmemcached \
 librsync \
 openssl \
 ossp-uuid \
 qt5 \
 rdiff-backup \
 readline \
 redis \
 #selenium-server-standalone \
 tmux \
 wget \
 libxml2 \
 php@7.3 \
 #php71-mcrypt \
 phpunit \
 #postgres \
 # Required for using pip
 python \
 composer \
 node \
 # Conflicts with mysql, so use either MySQL or MariaDB
 #mariadb \
 memcached \
 #mongodb \
 # Conflicts with mariadb, so use either MySQL or MariaDB
 mysql \
 # https://github.com/nvbn/thefuck
 thefuck \
 docker \
 # https://github.com/ravenac95/sudolikeaboss
 sudolikeaboss \
 yarn \
 # Required by OhMyZsh
 zsh \
 # Required by OhMyZsh
 zsh-completions \
)

# Define bottles to pin
pins=(\
 mysql \
)
