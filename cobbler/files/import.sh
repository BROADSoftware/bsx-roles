#!/bin/bash

set -e

#http://mirror.ibcp.fr/pub/Centos/7/isos/x86_64/CentOS-7-x86_64-DVD-1511.iso

function usage {
	echo 'import.sh --url <url> --name <name>'
}



while [[ $# > 0 ]]
do
	case $1 in
		--url)
			URL=$2
			shift
		;;
		--name)
			NAME=$2
			shift
		;;
		*)
			echo "Unknown parameter $1"
			usage
			exit 1
		;;
	esac
	shift
done


if [ "$URL" = "" ]; then echo "Missing --url parameters"; usage; exit 1; fi
if [ "$NAME" = "" ]; then echo "Missing --name parameters";	usage; exit 1; fi

FILE=/tmp/$(basename $URL)

if [ ! -r "$FILE" ]
then
	cd /tmp; wget $URL
fi

mount -o loop -t iso9660 $FILE /mnt

cobbler import --path=/mnt --arch=x86_64 --name=$NAME

umount /mnt
