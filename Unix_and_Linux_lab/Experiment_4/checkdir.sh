#!/usr/bin/bash


echo -e "File name\t\tFile type"

for path in *; do
	file_type=$(file -b "$path")
	echo -e "$path\t\t$file_type"
done
