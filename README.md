[![Circle CI](https://circleci.com/gh/codeworksio/docker-prometheus.svg?style=shield "CircleCI")](https://circleci.com/gh/codeworksio/docker-prometheus)&nbsp;[![Size](https://images.microbadger.com/badges/image/codeworksio/prometheus.svg)](http://microbadger.com/images/codeworksio/prometheus)&nbsp;[![Version](https://images.microbadger.com/badges/version/codeworksio/prometheus.svg)](http://microbadger.com/images/codeworksio/prometheus)&nbsp;[![Commit](https://images.microbadger.com/badges/commit/codeworksio/prometheus.svg)](http://microbadger.com/images/codeworksio/prometheus)&nbsp;[![Docker Hub](https://img.shields.io/docker/pulls/codeworksio/prometheus.svg)](https://hub.docker.com/r/codeworksio/prometheus/)

Docker Prometheus
=================

Installation
------------

Builds of the image are available on [Docker Hub](https://hub.docker.com/r/codeworksio/prometheus/).

    docker pull codeworksio/prometheus

Alternatively you can build the image yourself.

    docker build --tag codeworksio/prometheus \
        github.com/codeworksio/docker-prometheus

Quickstart
----------

Start container using:

    docker run --detach --restart always \
        --name prometheus \
        --hostname prometheus \
        --publish 9090:9090 \
        codeworksio/prometheus
