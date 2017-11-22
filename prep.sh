#!/bin/bash
set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/" && pwd )"

echo "Working dir: `pwd`"

[ ! -f CentOS-7-x86_64-DVD-1708.iso ] && curl -L 'http://mirrors.usc.edu/pub/linux/distributions/centos/7/isos/x86_64/CentOS-7-x86_64-DVD-1708.iso' -o CentOS-7-x86_64-DVD-1708.iso

if [ ! -d data ]; then
	mkdir data
        docker run -i --rm -v `pwd`/CentOS-7-x86_64-DVD-1708.iso:/dvd.iso -v `pwd`/data:/data --entrypoint /bin/sh ubuntu -c 'apt-get update; apt-get install -y xorriso; xorriso -osirrox on -indev /dvd.iso -extract / /data'
	chmod --recursive 755 data
fi
