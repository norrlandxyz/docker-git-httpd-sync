FROM httpd:2.4

#remove default index.html
RUN rm -rf /usr/local/apache2/htdocs/*

# Update and install git
RUN apt-get update && apt-get install git -y 

#Script waits for 30 min, Cron did not work well with docker :(
COPY git-sync.sh .
RUN chmod +x git-sync.sh

# Adding crontab to the appropiate location
#ADD crontab /etc/cron.d/git-sync

# Execute perms for cornjob
#RUN chmod 0644 /etc/cron.d/git-sync

# Running crontab
#RUN crontab /etc/cron.d/git-sync

#ENTRYPOINT ["cron", "-f"]
#CMD ["httpd-foreground"]
COPY start.sh .
RUN chmod +x start.sh
CMD ["./start.sh"]
