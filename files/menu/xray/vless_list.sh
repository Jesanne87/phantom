#!/bin/bash

clear
echo ""
echo "=============================="
echo "  Username       Exp. Date    "
echo "------------------------------"
n=0
while read user; do
	[[ -z $user ]] && break
	expired=$(cat /phantom/user_database.json | jq -r '(.xray.vless[] | select(.username == "'$user'")).expired')
	printf "  %-14s %s\n" $user "$(date -d "$expired" +"%d %b %Y")"
	n=$((n+1))
done <<< "$(cat /phantom/user_database.json | jq -r '.xray.vless[].username')"
echo "------------------------------"
echo "  Total users : $n"
echo "=============================="
echo ""
