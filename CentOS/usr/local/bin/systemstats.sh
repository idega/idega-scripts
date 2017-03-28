#!/bin/bash
#
# Server Status Script
# Version 0.1.3 m
# Updated: July 26th 2011 m

CPUTIME=$(ps -eo pcpu | awk 'NR>1' | awk '{tot=tot+$1} END {print tot}')
CPUCORES=$(cat /proc/cpuinfo | grep -c processor)
UP=$(echo `uptime` | awk '{ print $3 " " $4 }')
echo "
This is the testserver for idegaweb applications
System Status
Updated: `date`

- Server Name               = `hostname`
- Public IP                 = `dig +short myip.opendns.com @resolver1.opendns.com`
- OS Version                = `cat /etc/redhat-release`
- Load Averages             = `cat /proc/loadavg`
- System Uptime             = `echo $UP`
- Platform Data             = `uname -orpi`
- CPU Usage (average)       = `echo $CPUTIME / $CPUCORES | bc`%
- Memory free (real)        = `free -m | head -n 2 | tail -n 1 | awk {'print $4'}` Mb
- Memory free (cache)       = `free -m | head -n 3 | tail -n 1 | awk {'print $3'}` Mb
- Swap in use               = `free -m | tail -n 1 | awk {'print $3'}` Mb
- Disk Space Used           = `df -h / | awk '{ a = $5 } END { print a }'`
" > /etc/motd 
