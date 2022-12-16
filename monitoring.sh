#!/bin/bash
wall $'#Architecture: '`uname -a` \
$'\n#CPU physical: '`cat /proc/cpuinfo | grep processor | wc -l` \
$'\n#vCPU:  '`cat /proc/cpuinfo | grep processor | wc -l` \
$'\n#Memory Usage: '`free -m | awk 'NR==2{printf "%s/%sMB (%.2f%%)", $3,$2,$3/$2*100}'` \
$'\n#Disk Usage: '`df -h | awk '$NF=="/"{printf "%d/%dGB (%s)", $3,$2,$5}'` \
$'\n#CPU load: '`top -bn1 | grep load | awk '{printf "%.1f%%", $(NF-2)}'` \
$'\n#Last boot: ' `who -b | awk '{print $3" "$4" "$5}'` \
$'\n#LVM use: ' `lsblk |grep lvm | awk '{if ($1) {print "yes";exit;} else {print "no"} }'` \
$'\n#Connection TCP:' `netstat -an | grep ESTABLISHED |  wc -l` \
$'\n#User log: ' `users | wc -w` \
$'\n#Network: IP ' `hostname -I`"("`ip a | grep link/ether | awk '{print $2}'`")" \
$'\n#Sudo:  ' `grep sudo  /var/log/sudo.log | wc -l` 'cmd'