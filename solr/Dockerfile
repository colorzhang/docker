
FROM java:8
MAINTAINER Winston Zhang, <winston.zhang@hybris.com>

RUN mkdir /opt/solr

COPY solr-5.2.1 /opt/solr/solr-5.2.1
COPY start.sh /start.sh

RUN \
  chmod +x /start.sh && \
  useradd solr && \
  chown -RL solr:solr /opt/solr

WORKDIR /opt/solr/solr-5.2.1

VOLUME /opt/solr/solr-5.2.1/server/data

EXPOSE 8983

USER solr

## Run start script
CMD ["/start.sh"]

