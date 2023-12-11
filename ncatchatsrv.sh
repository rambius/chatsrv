#!/bin/sh


pidfile=/var/run/ncatchatd.pid

start_chat()
{
	/usr/pkg/bin/ncat --chat -l 9876 &
	ncat_pid=$!
	echo $ncat_pid > $pidfile
}

status_chat()
{
	if [ -f "$pidfile" ]; then
		ncat_pid=`cat $pidfile`
		echo "ncatchatd is running as pid $ncat_pid"
	else
		echo "ncatchatd is not running; missing pid file $pidfile"
	fi
}

stop_chat()
{
	if [ -f "$pidfile" ]; then
		ncat_pid=`cat $pidfile`
		kill $ncat_pid
        fi
	rm -f $pidfile
}

case "$1" in
start)
	start_chat
	;;
stop)
	stop_chat
	;;
status)
	status_chat
	;;
*)
	echo 1>&2 "Invalid action $1. Usage: $0 start|stop|status" 
	;;
esac
