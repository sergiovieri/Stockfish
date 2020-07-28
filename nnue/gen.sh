threads=${1:-"24"}

echo "Using $threads threads"

find gendata -name "*${HOSTNAME}.bin" -empty -delete

options="setoption name Threads value $threads
setoption name Hash value 16384
setoption name SyzygyPath value /temp/sergio-v/syzygy/6/:/temp/sergio-v/syzygy/3-4-5/
isready
gensfen depth 12 depth2 12 loop 2000000 random_multi_pv 4 random_multi_pv_depth 10 random_multi_pv_diff 100 random_move_count 15 random_move_maxply 80 write_minply 11 use_draw_in_training_data_generation 1 eval_limit 1000 output_file_name gendata/$(date +"%Y%m%d-%H%M")_${HOSTNAME}.bin
quit
"

printf "$options" | ./nnue-learn
