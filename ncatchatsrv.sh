#!/bin/sh

mydir=$(dirname $(readlink -f $0))
. ${mydir}/ncatchatcmn.sh
/usr/pkg/bin/ncat --chat -l ${port} &
ncat_pid=$!
echo $ncat_pid > /var/run/ncatchatd.pid
