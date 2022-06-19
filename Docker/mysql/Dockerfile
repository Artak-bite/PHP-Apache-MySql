FROM mysql:latest

ADD script.sh /root/script.sh
RUN chmod 0644 /root/script.sh

RUN apt-get update
RUN apt-get -y install cron
RUN crontab -l | { cat; echo "* * * * * bash /root/script.sh"; } | crontab -
