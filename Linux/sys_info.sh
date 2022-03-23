#!/bin/bash

d=$(date +%Y-%m-%d)
u=$(uname)
i=$(hostname -I | awk '{print $1}')
h=$(hostname)
bonus=$(ip addr | grep inet | tail -2 | head -1)
output=("$HOME/output.txt")


echo "Title $d"
echo "\n$u\n"
echo "\n$i\n"
echo "\n$h\n"

#check for the  ~/research directory

if [ ! -d ~/research ]
then
	echo ~/research directory does exist
else
	mkdir ~/research
fi

#check for existence of sys_info.txt and create one if it doesn't exist

if [ -f /sys_info.txt ]
then
	echo the file exists, removing it now. && rm /sys_info.txt
else
	echo the file does not exist.
fi


# Store current system IPv4 Address
ipv4=$hostname -I | awk -F" " '{print $1}')


# Store all executables found in /home.
executables=$(find /home -type f -perm 777
