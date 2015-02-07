#!/bin/sh

sed -i 's/LOGSTASH_SERVICE_HOST/'"$LOGSTASH_SERVICE_HOST"'/g' /logstash-forwarder/logstash-forwarder.conf
sed -i 's/LOGSTASH_SERVICE_PORT/'"$LOGSTASH_SERVICE_PORT"'/g' /logstash-forwarder/logstash-forwarder.conf

exec /logstash-forwarder/logstash-forwarder -config /logstash-forwarder/logstash-forwarder.conf