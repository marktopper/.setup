if [ ! -d ~/.php-snake ]; then
    git clone https://github.com/AndrewCarterUK/PHPSnake.git ~/.php-snake

    cd ~/.php-snake

    composer install

    sudo chown -R $(whoami) ~/.php-snake
    chmod -R 777 ~/.php-snake
fi