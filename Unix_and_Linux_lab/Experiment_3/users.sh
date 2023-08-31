#!/usr/bin/sh

logged_in=$(who)
echo "Logged in : $logged_in"

echo "All users"
all_users=$(getent group rahulsiloniya | cut -d: -f1)
echo "$all_users"
