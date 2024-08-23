#/bin/bash
tsp -I srt --caller $BACKUPIP:$1 \
--passphrase $MAINPASSPHRASE --latency $LATENCY | \
tsstuff -b 30000000 --buffer-size 16000000  | \
tsp -v -b 30000000 -O dektec -d $2 > log/receptor$1.log 2>&1 &
