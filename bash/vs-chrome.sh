#!/bin/bash
#
# https://storage.googleapis.com/chromium-browser-snapshots/index.html?prefix=Linux_x64/

#CHROMEVERSION="549031"
CHROMEVERSION="684285"
GOOGLEHOST="https://storage.googleapis.com/chromium-browser-snapshots/Linux_x64/$CHROMEVERSION/chrome-linux.zip"


function install {
	if [ -f "/tmp/chrome-linux.zip" ] ; then
		rm /tmp/chrome-linux.zip
	fi

	if [ -d "$HOME/.vs-chrome/" ] ; then
		echo "[+] Removing current install"
		rm -rf $HOME/.vs-chrome
	fi

	echo "[+] Downloading Chrome $CHROMEVERSION"
	wget $GOOGLEHOST -O /tmp/chrome-linux.zip > /dev/null 2>&1
	echo "[+] Installing to ~/.vs-chrome"
	unzip /tmp/chrome-linux.zip -d ~/.vs-chrome > /dev/null 2>&1
	echo "[+] Installation complete"
}

case $1 in
	--install-chrome)
		install ;;
	*)
		$HOME/.vs-chrome/chrome-linux/chrome "https://live.valueservices.uk" --no-sandbox --disable-setuid-sandbox
esac
