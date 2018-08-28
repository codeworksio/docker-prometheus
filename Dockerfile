FROM codeworksio/ubuntu:18.04-20180827

ARG APT_PROXY
ARG APT_PROXY_SSL
ENV PROMETHEUS_VERSION="2.3.2"

RUN set -ex && \
    \
    URL="https://github.com/prometheus/prometheus/releases/download/v${PROMETHEUS_VERSION}" && \
    NAME="prometheus-${PROMETHEUS_VERSION}.linux-amd64" && \
    FILE="$NAME.tar.gz" && \
    \
    curl -L "$URL/$FILE" -o /tmp/$FILE && \
    tar -xvf /tmp/$FILE -C /tmp/ && \
    cp \
        /tmp/$NAME/prometheus \
        /tmp/$NAME/promtool \
        /bin && \
    mkdir /etc/prometheus && \
    cp -r \
        /tmp/$NAME/consoles \
        /tmp/$NAME/console_libraries \
        /etc/prometheus && \
    \
    rm -rf /tmp/* /var/tmp/* /var/lib/apt/lists/* /var/cache/apt/*

COPY assets/ /

WORKDIR /var/lib/prometheus
VOLUME [ "/var/lib/prometheus" ]
EXPOSE 9090
CMD [ "/bin/prometheus", "--config.file=/etc/prometheus/prometheus.yml", "--storage.tsdb.path=/var/lib/prometheus", "--web.console.templates=/etc/prometheus/consoles", "--web.console.libraries=/etc/prometheus/console_libraries", "--web.listen-address=0.0.0.0:9090" ]

### METADATA ###################################################################

ARG IMAGE
ARG BUILD_DATE
ARG VERSION
ARG VCS_REF
ARG VCS_URL
LABEL \
    org.label-schema.name=$IMAGE \
    org.label-schema.build-date=$BUILD_DATE \
    org.label-schema.version=$VERSION \
    org.label-schema.vcs-ref=$VCS_REF \
    org.label-schema.vcs-url=$VCS_URL \
    org.label-schema.schema-version="1.0"
