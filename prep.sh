#!/bin/bash
set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/" && pwd )"

echo "Working dir: `pwd`"

[ ! -f CentOS-7-x86_64-DVD-1708.iso ] && curl -L 'http://mirrors.usc.edu/pub/linux/distributions/centos/7/isos/x86_64/CentOS-7-x86_64-DVD-1708.iso' -o CentOS-7-x86_64-DVD-1708.iso

if [ ! -d data ]; then
	curl -L 'https://sourceforge.net/projects/p7zip/files/p7zip/16.02/p7zip_16.02_x86_linux_bin.tar.bz2/download' -o 7zip.tar.bz2
	tar -jxvf 7zip.tar.bz2
	chmod +x "$DIR"/p7zip_16.02/bin/7z
	mkdir data
	pushd data
	ls -l ../CentOS-7-x86_64-DVD-1708.iso
	ls -l "$DIR"/p7zip_16.02/bin/7z
	"$DIR"/p7zip_16.02/bin/7z x ../CentOS-7-x86_64-DVD-1708.iso
	popd
	chmod --recursive 755 data
fi
