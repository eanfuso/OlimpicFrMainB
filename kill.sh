#/bin/bash
path="/home/pomi/Olimpicos"
source $path/env.sh
servicio=
output=
port=
    case $1 in
                "4" )
                 servicio=$MAINHDX14
                 output="0"
                 port="5001"
                ;;
                "5" )
                 servicio=$MAINHDX15
                 output="1"
                 port="5002"
                ;;
                "*" )
                 break
                ;;
        esac


pids=$(ps -eo pid,args | grep srt | grep $servicio | awk 'NF > 2 {print $1}')
kill -9 $pids 
sleep 1
pidt=$(ps -eo pid,args | grep tsp | grep $port | awk 'NF > 6 {print $1}')
kill -9 $pidt

# /home/pomi/srt/./srt-live-transmit srt://$MAINIP:$servicio/?passphrase=$MAINPASSPHRASE\&latency=$LATENCYM udp://localhost:$port & \
# #tsstuff -b $BRSERVICE --buffer-size 16000000  | \
# tsp -v --debug  -I ip $port -O dektec -d $output > log/receptor$1.log 2>&1 &





# pid=$(ps -eo pid,args | grep $servicio | awk 'NF > 6 {print $1} ')
# kill -9 $pid 

# tsp -I srt --caller $MAINIP:$servicio \
# --passphrase $MAINPASSPHRASE --latency $LATENCY | \
# tsstuff -b $BRSERVICE --buffer-size 16000000  | \
# tsp -v -b $BRSERVICE -O dektec -d $output > log/receptor$1.log 2>&1 &
# echo $servicio
# echo $output
