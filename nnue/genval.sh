threads=${1:-"24"}

echo "Using $threads threads"

options="setoption name Threads value $threads
setoption name Hash value 32768
setoption name SyzygyPath value /temp/sergio-v/syzygy/6/:/temp/sergio-v/syzygy/3-4-5/
isready
gensfen depth 12 depth2 14 loop 10000 random_move_count 5 random_move_maxply 40 write_minply 10 use_draw_in_training_data_generation 1 eval_limit 10000 output_file_name genval/$(date +"%Y%m%d-%H%M")_${HOSTNAME}.bin
quit
"

printf "$options" | ./nnue-learn
