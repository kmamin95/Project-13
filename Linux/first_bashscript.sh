#!/bin/bash

mkdir ~/research2
sudo find ~research2 -type f -perm 777 >> ~/research2/sys_info.txt
ps aux -m | awk {'print $1, $2, $3, $4, $11'} | head >> ~/research2/sys_info.txt

