# Define wether or not to install the taps, bottles and pins listed below
TAP_BOTTLES=true
INSTALL_BOTTLES=true
PIN_BOTTLES=true

# Define bottles to tap
taps=(\
 # Required for installing sudolikeaboss bottle
 ravenac95/sudolikeaboss \
 # Required!
 homebrew/dupes \
 # Required for installing php70 bottle
 homebrew/php \
 # Required for installing specific versions of bottles
 caskroom/versions \
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
 # Required by OhMyZsh
 gf-complete \
 git \
 git-flow \
 hub \
 icoutils \
 imagemagick \
 popt \
 libmemcached \
 librsync \
 memcached \
 openssl \
 ossp-uuid \
 qt \
 rdiff-backup \
 readline \
 redis \
 tmux \
 wget \
 libxml2 \
 php70 \
 # Required for using pip
 python \
 composer \
 node \
 # Conflicts with mariadb, so use eaither MySQL or MariaDB
 mysql \
 # https://github.com/nvbn/thefuck
 thefuck \
 docker \
 # https://github.com/ravenac95/sudolikeaboss
 sudolikeaboss \
 # Conflicts with mysql, so use eaiher MySQL or MariaDB
 #mariadb \
 # Required by OhMyZsh
 zsh \
 # Required by OhMyZsh
 zsh-completions \
)

# Define bottles to pin
pins=(\
 mysql \
)
