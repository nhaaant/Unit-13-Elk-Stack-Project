#!/bin/bash


#Prints the amount of free momory on the system & save

free -mh >> ~/backups/freemem/free_mem.txt

#Prints disk usage & save

du -h >> ~/backups/diskuse/disk_usage.txt

#Lists all open files & save

lsof >> ~/backups/openlist/open_list.txt

#Prints file system disk space statistics & save

df -h >> ~/backups/freedisk/free_disk.txt
