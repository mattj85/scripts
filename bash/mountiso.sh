#!/usr/bin/env bash

# check we have superuser
if [ "$(whoami)" != "root" ] ; then
	echo "[!] Run as root (sudo)"
else

	# check iso dir exists
	if [ ! -d "/mnt/iso" ] ; then
		mkdir /mnt/iso
	fi

	# check unmount argument
	if [ $1 = "-u" ] ; then
		echo "[+] Unmounting ISO"
		umount /mnt/iso
	else
		echo "[+] Mounting ISO to /mnt/iso"
		mount -o loop $1 /mnt/iso > /dev/null 2>&1
	fi

fi
