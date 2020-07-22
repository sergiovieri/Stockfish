if [[ $# -eq 0 ]] ; then
    echo 'missing params'
    exit 0
fi

options="setoption name EvalFile value $1
setoption name Threads value 32
setoption name Hash value 4096
setoption name SyzygyPath value /temp/sergio-v/syzygy/6/:/temp/sergio-v/syzygy/3-4-5/
isready
ucinewgame\n"

(printf "$options" && cat) | ./nnue
