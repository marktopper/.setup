if [ ! -d ~/.git-subsplit ]; then
    git clone https://github.com/dflydev/git-subsplit.git ~/.git-subsplit

    rm -rf "$(git --exec-path)"/git-subsplit

    cp ~/.git-subsplit/git-subsplit.sh "$(git --exec-path)"/git-subsplit
fi