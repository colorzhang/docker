# Container with Neo4j Server
# Repository http://github.com/neo4j-contrib/docker-neo4j

FROM winston/hybris:5.6-base
MAINTAINER Winston Zhang, <winston.zhang@hybris.com>

COPY config/local.properties /opt/hybris/hybris/config/local.properties
COPY config/localextensions.xml /opt/hybris/hybris/config/localextensions.xml

RUN chown -RL hybris:hybris /opt/hybris 

USER hybris

# 2nd round to build with extensions 
RUN ant clean all -Dinput.template=develop -Dmaven.update.dbdrivers=false

EXPOSE \
    9001 \
    9002 \
    8000

## Run start script
CMD ["hybrisserver.sh", "debug"]

