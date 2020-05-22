#!/bin/bash
while sleep 1; do
FIRST=$(sha256sum "/etc/passwd" | cut -f 1 -d ' ')                                                                           
if [[ "$FIRST" != "${LAST:-}" ]]; then
LAST=$FIRST
logger change to /etc/passwd
echo “stuf” | wall
# change this to echo whatever depending on version wall might not work
netstat -pauntl > /var/log/netstatlog.log
ps -aux > /var/log/psaux.log
cp /etc/passwd "/var/log/passwd$LAST"                                                                                                      
fi
FIRST1=$(sha256sum "/etc/shadow" | cut -f 1 -d ' ')
if [[ "$FIRST1" != "${LAST1:-}" ]]; then
LAST1=$FIRST1
logger change to /etc/shadow
echo "change to /etc/shadow" | wall
netstat -pauntl > /var/log/netstat.log                                                                                              
ps -aux > /var/log/psaux.log                                                                                                                       
cp /etc/shadow "/var/log/shadow$LAST1"
fi
done
