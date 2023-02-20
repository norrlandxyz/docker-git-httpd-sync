FROM httpd:2.4

# Updating packages and installing cron
RUN apt-get update && apt-get install cron -y 

COPY git-sync.sh .

RUN chmod +x git-sync.sh

# Adding crontab to the appropiate location
ADD crontab /etc/cron.d/git-sync

# Execute perms for corntab
RUN chmod 0644 /etc/cron.d/git-sync

# Running crontab
RUN crontab /etc/cron.d/git-sync

# Creating entry point for cron 
ENTRYPOINT ["cron", "-f"]
