#/bin/bash

pids=$(ps -eo pid,args | grep java | grep olimpic | awk 'NF > 2 {print $1}')
kill -9 $pids 
