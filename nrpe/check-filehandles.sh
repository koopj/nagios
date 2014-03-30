#!/bin/bash

wlimit=$2
climit=$4

numhandles=`lsof | wc -l`

if [ $numhandles -gt $climit ]
then
	echo "File handle count $numhandles above critical limit $climit"
	exit 2
elif [ $numhandles -gt $wlimit ]
then
	echo "File handle count $numhandles above warning limit $wlimit"
	exit 1
else
	echo "File handle count $numhandles below warning limit $wlimit"
	exit 0
fi

