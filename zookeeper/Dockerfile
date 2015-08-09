FROM java:8
MAINTAINER Winston Zhang <winston.zhang@hybris.com>

ENV ZK_VERSION 3.4.6
ENV ZK_DATA /var/run/zookeeper/data
ENV ZK_LOG /var/log/zookeeper

RUN mkdir -p /opt/apache

COPY zookeeper-3.4.6.tar.gz /opt/apache/zookeeper-3.4.6.tar.gz

RUN cd /opt/apache && \
    tar -xzf zookeeper-3.4.6.tar.gz && \
    mv /opt/apache/zookeeper-$ZK_VERSION/ /opt/apache/zookeeper && \
    mv /opt/apache/zookeeper/conf/zoo_sample.cfg /opt/apache/zookeeper/conf/zoo.cfg && \
    sed -ri 's|(dataDir=).*$|\1'"$ZK_DATA"'|' /opt/apache/zookeeper/conf/zoo.cfg && \
    mkdir -p $ZK_DATA $ZK_LOG && \
    useradd --system --shell /bin/bash --home /opt/apache/zookeeper zookeeper && \
    chown -R zookeeper:zookeeper /opt/apache/zookeeper $ZK_DATA $ZK_LOG

EXPOSE 2181 2888 3888

WORKDIR /opt/apache/zookeeper

VOLUME ["$ZK_DATA", "/opt/apache/zookeeper/conf"]

USER zookeeper

ENTRYPOINT ["/opt/apache/zookeeper/bin/zkServer.sh"]

CMD ["start-foreground"]
