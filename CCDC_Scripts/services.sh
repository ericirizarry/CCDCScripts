#!/bin/bash
while sleep 1; do
CHECK=$(service --status-all)
TIME2=$TIME
if [[ "$CHECK" != "${NOT:-}" ]]; then
NOT=$CHECK
TIME=$(date +%T)
if [[ "$TIME" != "$TIME2" ]]; then
service --status-all > /var/log/services$TIME.txt
THING=$(diff /var/log/services$TIME2.txt /var/log/services$TIME.txt | strings | tr -d []+- | tr -d \<\> | awk -F: '{print $1}' | sed 's/.....//' | tail -n 1 || echo yo)
Echo “Service $THING went down“ | wall
service $THING restart
fi
fi
done
#STRINGS MIGHT NOT BE NECESSARY