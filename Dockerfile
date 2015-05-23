FROM ubuntu:14.04
MAINTAINER Ilya Stepanov <dev@ilyastepanov.com>

RUN apt-get update && \
    apt-get install -y s3cmd cron && \
    rm -rf /var/lib/apt/lists/*

ADD s3cfg /root/.s3cfg

RUN touch /var/log/cron.log

ADD start.sh /start.sh
RUN chmod +x /start.sh

CMD /start.sh && tail -f /var/log/cron.log
