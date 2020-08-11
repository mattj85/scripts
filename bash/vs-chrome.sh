#!/bin/bash

CHROMEVERSION="549031"
GOOGLEHOST="https://storage.googleapis.com/chromium-browser-snapshots/Linux_x64/$CHROMEVERSION/chrome-linux.zip"


function install {
	if [ -f "/tmp/chrome-linux.zip" ] ; then
		rm /tmp/chrome-linux.zip
	fi

	if [ -d "$HOME/.vs-chrome/" ] ; then
		rm -rf $HOME/.vs-chrome
	fi

	wget $GOOGLEHOST -O /tmp/chrome-linux.zip
	unzip /tmp/chrome-linux.zip -d ~/.vs-chrome
}

case $1 in
	--install-chrome)
		install ;;
	*)
		$HOME/.vs-chrome/chrome-linux/chrome "https://live.valueservices.uk" --no-sandbox
esac
