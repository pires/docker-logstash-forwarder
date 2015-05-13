
# logstash-forwarder
Lean (11MB) `logstash-forwarder` Docker image for using with [pires/docker-logstash](http://github.com/pires/docker-logstash) but with a [ELK Kubernetes](https://github.com/pires/kubernetes-elk-cluster) twist (see `logstash-forwarder.conf`).

Here you will find a Dockerfile for assembling a `logstash-forwarder` container that communicates with `logstash` server over secure Lumberjack protocol. This could be the base for all your Docker images that need `logstash-forwarder`.

[runit](http://smarden.org/runit/) will make sure that your service runs on container start-up and supervises it. In case the service dies, `runit` brings it back to life. 

The image is available at [quay.io/pires](https://quay.io/repository/pires/docker-logstash-forwarder).

## Disclaimer 

`runit` and `logstash-forwarder` binaries are available in `binaries` folder but I recommend to compile them yourself.

## Pre-requisites

* Docker (tested with boot2docker v1.5.0)
* Go (optional, if you want to build `logstash-forwarder` binary)

## Run it

```
docker run --rm -v /path/to/config:/logstash-forwarder/config -v /path/to/certs:/logstash-forwarder/certs quay.io/pires/docker-logstash-forwarder:0.2
```

## Binaries

### `logstash-forwarder`

The following command will clone [`logstash-forwarder` repo](git://github.com/elasticsearch/logstash-forwarder.git), build `logstash-forwarder` and copy the resulting binary to `binaries` folder.

```
./build_logstash_forwarder.sh
```

Now, you just need to rebuild the image.

### `runit`

`runit` binaries should be built according to [official instructions](http://smarden.org/runit/install.html).
