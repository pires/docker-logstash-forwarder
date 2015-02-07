# Ubuntu 14.04
FROM ubuntu:14.04

# Me, Myself and I
MAINTAINER Paulo Pires <pjpires@gmail.com>

# Install Go
RUN echo "deb http://archive.ubuntu.com/ubuntu trusty main universe" > /etc/apt/sources.list && \
  apt-get update && \
  apt-get -y dist-upgrade && \
  apt-get -y install git golang runit

# Build logstash-forwarder
RUN cd / && \
  git clone git://github.com/elasticsearch/logstash-forwarder.git source && \
  cd source && \
  go build && \
  cd / && \
  mkdir /logstash-forwarder && \
  mv source/source /logstash-forwarder/logstash-forwarder && \
  rm -rf source && \
  apt-get -y remove git golang && \
  apt-get -y autoremove && \
  apt-get autoclean

# Add configuration files
ADD logstash-forwarder.conf /logstash-forwarder/logstash-forwarder.conf
ADD certs /logstash-forwarder/certs

# Add runnable scripts
ADD run_logstash_forwarder.sh /etc/service/logstash-forwarder/run
RUN chmod u+x /etc/service/logstash-forwarder/run

CMD ["/usr/bin/runsvdir", "-P", "/etc/service"]