#!/bin/sh
. ./chatcmn.sh
/usr/pkg/bin/ncat --chat -l ${port} 
