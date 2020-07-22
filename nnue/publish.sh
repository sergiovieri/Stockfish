if [[ $# -ne 1 ]] ; then
    echo 'missing params'
    exit 0
fi
chmod -R go+r evalsave/$1
scp evalsave/$1/nn.bin sunfire:~/public_html/nnue/$1.bin
