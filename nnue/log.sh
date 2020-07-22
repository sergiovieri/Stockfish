if [[ $# -ne 1 ]] ; then
    exit 1
fi
echo "$1"
echo "$(date +"%Y%m%d-%H%M"): $1" >> log.txt
