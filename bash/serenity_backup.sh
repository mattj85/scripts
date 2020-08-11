#!/usr/bin/env bash

function doBackup {
	echo "[+] Starting incremental backup"
	cd $HOME
	rsync -avrz --stats\
		--exclude ".config"\
		--exclude ".local"\
		--exclude ".cache"\
		\. /media/$USER/Backup/backups/serenity.debian

	# log the backup
	echo "[+] Backup completed - $(date)" >> $HOME/.backuplog.log
	exit 0
}

if [ -d "/media/matt/Backup" ] ; then
	doBackup
else
	echo "[!] Backup drive not connected"
	echo "[!] Backup failed - $(date)" >> $HOME/.backuplog.log
fi
