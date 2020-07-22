if [[ $# -ne 2 ]] ; then
    echo 'Wrong parameter count'
    exit 1
fi

currentnum=$(./count.sh $1)
target=$2
removenum=$(($currentnum - $2))
if [[ $removenum -le 0 ]] ; then
    echo "Nothing to remove"
    exit 0
fi

echo "Remove $removenum"
find $1 -type f | sort | head -n $removenum | xargs rm
