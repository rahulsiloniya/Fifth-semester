#!/usr/bin/bash

path_origin="$1"
path_destination="$2"

if [[ -f "$path_origin" ]]; then 
	cp "$path_origin" "$path_destination"
else
	echo "Source path does not exist"
fi
