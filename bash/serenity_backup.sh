#!/usr/bin/env bash

function doBackup {
	echo "[+] Starting incremental backup"
	rsync -avrz --stats\
		--exclude ".config"\
		--exclude ".local"\
		--exclude ".cache"\
		$HOME/ /media/$USER/Backup/backups/serenity.debian

	# log the backup
	echo "[+] Backup completed - $(date)" >> $HOME/.backuplog.log
	# if libnotify installed, send a notification
	if [ -f "/usr/bin/notify-send" ] ; then
		notify-send "RSYNC" "Backup of serenity complete $(date)"
	fi
	exit 0
}

if [ -d "/media/matt/Backup" ] ; then
	doBackup
else
	echo "[!] Backup drive not connected"
	echo "[!] Backup failed - $(date)" >> $HOME/.backuplog.log
fi
