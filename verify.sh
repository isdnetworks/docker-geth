#!/bin/sh
if [ -z $1 ] || [ -z $2 ]; then
	echo "Usage: ${0} geth-alltools-windows-amd64-1.9.25-e7872729.zip MD5SUMS.asc"
	exit 1
fi
md5sum -c $2 2> /dev/null | grep $1
