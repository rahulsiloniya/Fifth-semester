#!/usr/bin/sh

echo "Enter priority change"
read change

echo "Select a process ID for changes : "
read pid

if ps -p "$pid" > /dev/null; then
	sudo renice -n "$change" -p "$pid"
else
	echo "Invalid process ID"
fi
