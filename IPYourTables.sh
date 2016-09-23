#!/bin/bash

while true; do
	read input
	input=${input//u/udp}; input=${input//t/tcp}
	input=${input//i/INPUT}; input=${input//o/OUTPUT}
	I=($input)
	PT="dport"
	if [ "${I[2]}" == "OUTPUT" ]; then
		PT="sport"
	fi
	P=(${I[1]//-/ })
	if [ "${P[1]}" == "" ]; then
		P[1]=${P[0]}
	fi
	for i in $(seq ${P[0]} ${P[1]}); do
		iptables -A ${I[2]} -p ${I[0]} --${PT} ${i} -j ACCEPT
	done
done
