#!/bin/sh

GIT=`which git`
GO=`which go`
DIR=lfsource

rm -rf $DIR
$GIT clone git://github.com/elasticsearch/logstash-forwarder.git $DIR
cd $DIR
GOOS=linux ARCH=amd64 $GO build -o logstash-forwarder
cd ..
cp $DIR/logstash-forwarder binaries/
