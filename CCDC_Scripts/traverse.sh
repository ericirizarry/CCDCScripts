#!/bin/bash
for d in $(find /etc /bin /sbin /home /root -maxdepth 99)
do
	md5sum $d
done > files3.txt
