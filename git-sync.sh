#!/bin/sh
BASH_ENV=container.env
git clone $GIT_REPO /usr/local/apache2/htdocs/
cd /usr/local/apache2/htdocs/
git pull
