if [[ $# -eq 0 ]] ; then
    echo 'missing params'
    exit 0
fi

options="setoption name Threads value 32
setoption name EvalFile value evalsave/$1/nn.bin
learn targetdir traindata loop 100 batchsize 1000000 use_draw_in_training 1 use_draw_in_validation 1 eta 0.5 lambda 0.5 eval_limit 32000 nn_batch_size 1000 newbob_decay 0.5 newbob_num_trials 6 eval_save_interval 10000000 loss_output_interval 10000000 mirror_percentage 0 validation_set_file_name valdata/val.bin
quit
"

printf "$options" | ./nnue-learn
