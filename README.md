
# logstash-forwarder
```logstash-forwarder``` Docker image resources for using with [pires/docker-logstash](http://github.com/pires/logstash) but with a [ELK Kubernetes](https://github.com/pires/kubernetes-elk-cluster) twist.

Here you will find a Dockerfile for assembling a ```logstash-forwarder``` container that communicates with ```logstash``` server over secure Lumberjack protocol. I made this so that I could [easily test my ELK cluster on top of Kubernetes](https://github.com/pires/kubernetes-elk-cluster).
This image can and should be changed to match your needs. Right now, it will only work with ```pires/docker-logstash``` and ELK Kubernetes cluster.

[runit](http://smarden.org/runit/) will make sure that your service runs on container start-up and supervises it. In case the service dies, ```runit``` brings it back to life. Cool, ain't it?

## Pre-requisites

* Docker (tested with boot2docker v1.5.0)
* Git (optional)

## Grab it

```
docker pull pires/logstash-forwarder
```

## Build images (optional)

Providing your own version of [the image automatically built for logstash-forwarder](https://registry.hub.docker.com/u/pires/logstash-forwarder) will not be supported. This is an *optional* step. You have been warned.

### Clone repository

```
git clone https://github.com/pires/logstash-forwarder.git
cd logstash-forwarder
```

### Assemble container

```
docker build -t pires/logstash-forwarder:latest .
```
