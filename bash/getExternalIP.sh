#!/usr/bin/env bash

IPLIST="$HOME/.iplist.list"
EXTIP=$(curl -s -w '\n' ifconfig.me)

# check to see if list file already exists
if [ ! -f "$IPLIST" ] ; then
	touch $IPLIST
fi

MYIP="[+] $EXTIP"
case $1 in
	-l|--log)
		cat $IPLIST ;;
	*)
		if grep "$MYTIP" $IPLIST > /dev/null ; then
			echo $MYIP
		else
			echo $MYIP >> $IPLIST
		fi ;;
esac
