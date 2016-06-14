# Define bottles to tap
taps=(\
 ravenac95/sudolikeaboss \
 homebrew/dupes \
 homebrew/php \
 caskroom/versions \
)

# Define bottles to install
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
 mysql \
 # https://github.com/nvbn/thefuck
 thefuck \
 docker \
 # https://github.com/ravenac95/sudolikeaboss
 sudolikeaboss \
 # Conflicts with mysql, so use eaiher MySQL or MariaDB
 #mariadb \
)

# Define bottles to pin
pins=(\
 mysql \
)
