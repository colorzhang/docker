#!/bin/bash

sh /opt/solr/solr-5.2.1/server/scripts/cloud-scripts/zkcli.sh -cmd upconfig -zkhost $ZKHOST -confname hybris -confdir /opt/solr/solr-5.2.1/server/solr/conf

cd /opt/solr/solr-5.2.1
bin/solr start -f -cloud -s server/solr -p 8983 -z $ZKHOST

