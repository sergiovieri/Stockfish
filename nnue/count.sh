if [[ $# -ne 1 ]] ; then
    echo "Wrong parameter count"
    exit 1
fi

find $1 -type f -printf '.' | wc -c
