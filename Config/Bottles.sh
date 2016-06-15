# Define wether or not to install the taps, bottles and pins listed below
TAP_BOTTLES=true
INSTALL_BOTTLES=true
PIN_BOTTLES=true

# Define bottles to tap
taps=(\
 ravenac95/sudolikeaboss \
 homebrew/dupes \
 homebrew/php \
 caskroom/versions \
)

# Define bottles to install
# Simply comment out un-wanted bottles
bottles=(\
 ack \
 autojump \
 automake \
 colordiff \
 curl \
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
 composer \
 node \
 mysql \ # Conflicts with mariadb, so use eaither MySQL or MariaDB
 thefuck \ # https://github.com/nvbn/thefuck
 docker \
 sudolikeaboss \ # https://github.com/ravenac95/sudolikeaboss
 #mariadb \ # Conflicts with mysql, so use eaiher MySQL or MariaDB
)

# Define bottles to pin
pins=(\
 mysql \
)
