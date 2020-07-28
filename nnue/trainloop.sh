while :;
do
    ./log.sh "Started training"
    ./trim.sh gendata 500
    ./trim.sh genval 500
    ./shuffle.sh
    ./train.sh $(./getlatestnet.sh) | tee trainlog.txt
    lastnet=$(cat trainlog.txt | grep 'save_eval() finished' | tail -n 2 | head -n 1 | awk '{print $NF}')
    name="$(date +"%Y%m%d-%H%M")"
    echo "Copying $lastnet to evalsave/$name"
    cp -r $lastnet evalsave/$name
    cp evalsave/$name/nn.bin eval/nn.bin
    ./publish.sh $name
    ./log.sh "Train done $name"
    touch runmatch
    echo "Waiting"
    # sleep 600
done
