#!/bin/bash
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/phantom/cron

# Clear Xray Core logs
echo "# phantom V1 " > /var/log/xray/access-tls.log
echo "# phantom V1 " > /var/log/xray/access-ntls.log
