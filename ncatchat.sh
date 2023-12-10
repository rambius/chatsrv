#!/bin/sh
mydir=$(dirname $(readlink -f $0))
. ${mydir}/ncatchatcmn.sh
/usr/pkg/bin/ncat ${host} ${port} 
