#!/usr/bin/bash


echo -e "File name"

for path in *; do
	file_type=$(file -b "$path")
	# echo -e "$path"
	if [[ $file_type =~ "directory" ]]; then
		echo -e "$path"
	fi
done
