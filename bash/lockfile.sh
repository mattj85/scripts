#!/usr/bin/env bash

if [ -f ".ocLockFile" ] ; then
        CURRENTPID=$(cat .ocLockFile)
        echo "[!] Lock file exists, script already running ($CURRENTPID)"
        exit 0
else
        # create lockfile with current pid
        echo $$ > .ocLockFile
fi
