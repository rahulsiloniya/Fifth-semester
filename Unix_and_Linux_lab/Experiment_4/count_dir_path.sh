#!/bin/bash

# Prompt the user for the directory path
read -p "Enter the directory path: " directory

# Check if the directory exists
if [ -d "$directory" ]; then
    # Use 'ls' to list the files in the directory and pipe the output to 'wc -l' to count them
    file_count=$(ls "$directory" | wc -l)
    
    echo "There are $file_count files in the directory."
else
    echo "$directory is not a valid directory."
fi

