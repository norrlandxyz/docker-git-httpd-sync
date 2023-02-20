#!/bin/bash
set -e
# Apache gets grumpy about PID files pre-existing
rm -f /usr/local/apache2/logs/httpd.pid

sh git-sync.sh &

exec httpd -DFOREGROUND "$@"
