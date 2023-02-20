#!/bin/sh
BASH_ENV=container.env
while :
do
	echo "Starting git clone"
	git clone $GIT_REPO /usr/local/apache2/htdocs/
	echo "Starting git pull"
	cd /usr/local/apache2/htdocs/
	git pull
	echo "Waiting for 30 minutes"
	sleep 30m
done
