#!/usr/bin/sh

#!/bin/bash

# Prompt the user for a process name or PID
echo "Enter the process name or PID:"
read process_name

# Use 'ps' command to display process attributes
ps aux | grep "$process_name"
