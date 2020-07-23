#!/usr/bin/env bash

if [ -z "$1" ] ; then
	echo "[!] No text string specified"
	exit 0
else
	A=$(echo "$1" | tr '[:lower:]' '[:upper:]')
	B=$(echo "$A" | sed 's/\(.\)/\1 /g')
	echo -n "SPELLCASTING: "
	
	# loop through letters and sleep 1
	for i in $B ; do
  		echo -n $i" "
  		sleep 1
	done ;
fi
echo ""
