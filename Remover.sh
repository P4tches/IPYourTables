#!/bin/bash
iptables -L
echo "(F)lush All Rules"
echo "(R)emove Rule:(line number)"
read input
if [ $input == 'F' ]; then #|| 'f' ]; then
iptables -F
fi
