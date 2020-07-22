options="learn shufflem output_file_name traindata/train.bin $(find gendata/*-*.bin -printf "%p ")
quit
"

printf "$options" | ./nnue-learn

options="learn shufflem output_file_name valdata/val.bin $(find genval/*-*.bin -printf "%p ")
quit
"

printf "$options" | ./nnue-learn
