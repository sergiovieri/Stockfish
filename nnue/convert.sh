if [[ $# -eq 0 ]] ; then
    echo 'missing params'
    exit 0
fi

options="learn convert_plain output_file_name out.txt $1
quit
"

rm out.txt
printf "$options" | ./nnue-learn
