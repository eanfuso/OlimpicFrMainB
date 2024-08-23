#/bin/bash
# Define colores
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color
serv="1"
sleep="1"

for i in {4..5}
do
echo -e "${GREEN}Verificando la recepcion $i ${NC}------------------------------------"
tail -n 5 /home/pomi/Olimpicos/log/srt$i.log
#i= $i + 1
sleep $sleep
done
#$VIN/${!video}

for i in {4..5}
do
echo -e "${BLUE}/////////////////////////////////////////////////////"
echo -e "${BLUE}Verificando salida ASI Nº $i ${NC}------------------------------------"
tail -n 3 /home/pomi/Olimpicos/log/receptor$i.log
echo -e "∖n"
j=$((i - 3))
port="500"${j}
ps -eo pid,pcpu,pmem,args | grep tsp | grep $port | awk  'NF > 6 {print "pid=" $1 " cpu=" $2}'
#i= $i + 1
sleep $sleep
done

echo -e "${GREEN}Operación reciente de los servicios ##############################################${NC}"
tail -n 20 /home/pomi/Olimpicos/back/back.log
echo -e "${GREEN}##########################################################################${NC}"

echo -e "${RED}Verificando inactividad del sistema ${NC}------------------------------------"
top -b -n1 | grep "Cpu(s)" | awk '{print $8}'




