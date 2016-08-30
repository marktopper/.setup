__secure_valet_sites() {
    GO=$(pwd)
    if [[ `valet paths` != 'No paths have been registered.' ]]; then
        for P in `valet paths`; do
            if [[ $P != '[' && $P != ']' ]]; then
                P="${P//\"}"
                for project in `ls $P`; do
                    cd "$P/$project"
                    valet secure
                    cd $GO
                done
            fi
        done
    fi
}

alias secure-valet-sites="__secure_valet_sites"

if [[ $VALET_AUTO_SECURE == true ]]; then
    # TODO: Setup interval on when to do this
    `secure-valet-sites > /dev/null &`
fi