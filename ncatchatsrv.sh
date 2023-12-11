#!/bin/sh

/usr/pkg/bin/ncat --chat -l 9876 &
ncat_pid=$!
echo $ncat_pid > /var/run/ncatchatd.pid
