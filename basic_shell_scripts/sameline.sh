#!/bin/bash


# Author: Pratik Anand
# Author Email: anandpratik141@gmail.com

for pc in $(seq 1 10); do
	x="\\\\"
	if [[ $(expr $pc % 2) == 0 ]]; then
		x="/"
	fi
    echo -ne "$x\033[0K\r"
    sleep 0.4
done
echo

