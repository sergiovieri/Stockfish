if [[ $# -eq 0 ]] ; then
    echo 'missing params'
    exit 0
fi

cp evalsave/$1/nn.bin evalsave/latest/
echo "$(date +"%Y%m%d-%H%M"): Upgrade $1" >> log.txt
