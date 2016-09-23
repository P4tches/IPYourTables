#!/bin/bash
while true; do
read input
ut=$(echo $input | cut -d ':' -f 1)
port=$(echo $input | cut -d ':' -f 2)
io=$(echo $input | cut -d ':' -f 3)
#echo "yes"
#if[ $port>='1' || port<='65565']
protocol=$ut
if [ $ut = "t" ]; then
	protocol="tcp"
elif [ $ut = "u" ]; then
	protocol="udp"
else
echo "Try Again."
fi
s=' '
port1=$(echo $port | cut -d '-' -f 1)
port2=$(echo $port | cut -d '-' -f 2)
echo "port1:"$port1
if [ $io = "i" ]; then
	if [[ "$port" == *"-"* ]]; then
		for((i=$port1; i<=$port2; i++)); do
			echo $protocol" on port "$i" inbound"
			iptables -A INPUT -p $protocol --dport $i -j ACCEPT
		done
	else
		echo $protocol" on port "$port" inbound"
		iptables -A INPUT -p $protocol --dport $port -j ACCEPT
	fi
elif [ $io = "o" ]; then
	if [[ "$port" == *"-"* ]]; then
		for((i=$port1; i<=$port2; i++)); do
			echo $protocol" on port "$i" outbound"
			iptables -A OUTPUT -p $protocol --sport $i  -j ACCEPT
		done
	else
		echo $protocol" on port "$port" outbound"
		iptables -A OUTPUT -p $protocol --sport $port -j ACCEPT
	fi
else
echo "You fucked up"
fi
done
