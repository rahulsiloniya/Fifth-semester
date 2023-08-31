#!/usr/bin/sh

read -p "Enter a number " n
remainder=$(($n % 2))
if [ $remainder -eq 1 ]; then
	echo "Odd"
else
	echo "Even"
fi
