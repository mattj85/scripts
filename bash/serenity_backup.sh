#!/usr/bin/env bash

function notify() {
	# if libnotify installed, send a notification
	if [ -f "/usr/bin/notify-send" ] ; then
		notify-send "RSYNC" "Backup of serenity $1 $(date)"
	fi
}

function doBackup() {
	echo "[+] Starting incremental backup"
	rsync -avrz --stats --quiet\
		--exclude ".config"\
		--exclude ".local"\
		--exclude ".cache"\
		--include ".config/i3"\
		--include ".config/i3blocks"\
		--include ".config/compton.conf"\
		$HOME/ /media/$USER/Backup/backups/serenity.debian

	# log the backup
	echo "[+] Backup completed - $(date)" >> $HOME/.backuplog.log
	notify "complete"
	exit 0
}

function logView() {
	cat $HOME/.backuplog.log
}


# main
case $1 in
	--view-log|--log|--logs)
		logView ;;
	*)
		if [ -d "/media/matt/Backup" ] ; then
			doBackup
		else
			notify "failed"
			echo "[!] Backup drive not connected"
			echo "[!] Backup failed - $(date)" >> $HOME/.backuplog.log
		fi ;;
esac
