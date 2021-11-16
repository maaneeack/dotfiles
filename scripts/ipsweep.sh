#!/bin/bash
if [ "$1" == "" ]
then
	echo "ip address required"
else
	#for ip in `seq 1 254`; do
	for (( ip = 0; ip < 254; ip++ )); do
	ping -c 1 $1.$ip | grep "64 bytes" | cut -d " " -f 4 | tr -d ":" &
	done
fi
