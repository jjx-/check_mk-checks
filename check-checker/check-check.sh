#!/bin/sh
# Script zur Überprüfung ob Agent output bestimmte Sektion enthält
# AKA: ein check der checkt ob ein check gecheckt wird (TM)
# $1 ist Hostname
# $2 ist sektion z.b. apt

# Aufruf: check-check.sh 192.168.1.1 apt

HOSTNAME=$1
SECTION=$2
#  grep "^<<<apt>>>" Line Starts with - agent output
# nc -w secs         timeout for connects and final net reads


SETISOK=$(nc $HOSTADDRESS 6556 -w 5 |  grep "^<<<$SECTION>>>")

if [ -z "$SETISOK" ]; then
    echo "CRITICAL - MONITORINGSET $SECTION CHECK IS NOT THERE"
exit 1
else
    echo "OK -  MONITORINGSET $SECTION CHECK IS THERE"
fi
