FROM progrium/busybox
MAINTAINER pjpires@gmail.com

ADD binaries/logstash-forwarder /logstash-forwarder/logstash-forwarder
ADD binaries/runsvdir /usr/local/bin/runsvdir
ADD binaries/runsv /usr/local/bin/runsv

# Certificates
VOLUME ["/logstash/config"]
VOLUME ["/logstash/certs"]

# Add configuration files
ADD logstash-forwarder.conf /logstash-forwarder/config/logstash-forwarder.conf

# Add runnable scripts
ADD run_logstash_forwarder.sh /etc/service/logstash-forwarder/run
RUN chmod u+x /etc/service/logstash-forwarder/run

CMD ["/usr/local/bin/runsvdir", "-P", "/etc/service"]
