threads=${1:-"32"}

echo "Using $threads threads"

find genval -name "*${HOSTNAME}.bin" -empty -delete

options="setoption name Threads value $threads
setoption name Hash value 16384
setoption name SyzygyPath value /temp/sergio-v/syzygy/6/:/temp/sergio-v/syzygy/3-4-5/
isready
gensfen depth 12 depth2 14 loop 4000 random_multi_pv 4 random_multi_pv_depth 10 random_multi_pv_diff 50 random_move_count 10 random_move_maxply 40 write_minply 11 use_draw_in_training_data_generation 1 eval_limit 1000 output_file_name genval/$(date +"%Y%m%d-%H%M")_${HOSTNAME}.bin
quit
"

printf "$options" | ./nnue-learn
