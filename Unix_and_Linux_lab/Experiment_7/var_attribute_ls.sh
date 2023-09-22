#!/bin/bash

# Prompt the user to choose between checking a file or a process
echo "Choose an option:"
echo "1. Check file attributes"
echo "2. Check process attributes"
read option

if [ "$option" == "1" ]; then
    # Prompt the user for a file path
    echo "Enter the path to the file:"
    read file_path

    # Check if the file exists
    if [ -e "$file_path" ]; then
        # Use 'stat' command to display file attributes
        stat "$file_path"
    else
        echo "File does not exist."
    fi
elif [ "$option" == "2" ]; then
    # Prompt the user for a process name or PID
    echo "Enter the process name or PID:"
    read process_name

    # Use 'ps' command to display process attributes
    ps aux | grep "$process_name"
else
    echo "Invalid option."
fi

