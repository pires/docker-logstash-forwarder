
# logstash-forwarder
Lean (11MB) `logstash-forwarder` Docker image resources for using with [pires/docker-logstash](http://github.com/pires/docker-logstash) but with a [ELK Kubernetes](https://github.com/pires/kubernetes-elk-cluster) twist.

Here you will find a Dockerfile for assembling a `logstash-forwarder` container that communicates with `logstash` server over secure Lumberjack protocol. This could be the base for all your Docker images that need `logstash-forwarder`.

[runit](http://smarden.org/runit/) will make sure that your service runs on container start-up and supervises it. In case the service dies, `runit` brings it back to life. 

## Disclaimer 

`runit` and `logstash-forwarder` binaries are available in `binaries` folder but I recommend to compile them yourself.

## Pre-requisites

* Docker (tested with boot2docker v1.5.0)

## Run it

```
docker run --rm -v /path/to/config:/logstash/config -v /path/to/certs:/logstash/certs pires/docker-logstash-forwarder
```