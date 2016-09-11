#!/bin/bash
while true; do
read input
ut=$(echo $input | cut -d ':' -f 1)
port=$(echo $input | cut -d ':' -f 2)
io=$(echo $input | cut -d ':' -f 3)
#echo "yes"
protocol=$ut
if [ $ut = "t" ]; then
	protocol="tcp"
else
	protocol="udp"
fi
if [ $io = "i" ]; then
	echo $protocol":"$port":in"
else
	echo $protocol":"$port":out"
fi
done
