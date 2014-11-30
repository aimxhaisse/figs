#!/usr/bin/env bash
#
# s. rannou <mxs@sbrk.org>

# a script to manage rss.mxs.sbrk.org

BACKUP_DIR="~/backups/rss"

case $1 in
    "init")
	fig up -d
	exit
	;;
    "start")
	fig start
	exit
	;;
    "stop")
	fig stop
	exit
	;;
    "backup")
	$0 stop
	if [ -d $BACKUP_DIR ]
	then
	    mv $BACKUP_DIR $BACKUP_DIR.old
	fi
	mkdir -p $BACKUP_DIR
	sudo cp -r ~/volumes/rss $BACKUP_DIR
	if [ -d $BACKUP_DIR.old ]
	then
	    sudo rm -rf $BACKUP_DIR.old
	fi
	$0 start
	exit
	;;
esac

echo >&2 "usage: $0 [init|start|stop|backup]"
