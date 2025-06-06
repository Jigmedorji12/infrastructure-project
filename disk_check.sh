#!/bin/bash
# Log the current date
date >> /var/log/disk_check.log
# Check disk usage
USAGE=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//')
# Log status
if [ "$USAGE" -gt 80 ]; then
  echo "WARNING: Disk usage is at ${USAGE}%!" >> /var/log/disk_check.log
else
  echo "Disk usage is normal: ${USAGE}%" >> /var/log/disk_check.log
fi

