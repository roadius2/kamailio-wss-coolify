FROM debian:bullseye

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    kamailio kamailio-extra-modules kamailio-websocket-modules \
    kamailio-tls-modules kamailio-outbound-modules kamailio-utils-modules \
    iproute2 dnsutils curl openssl nano && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY kamailio.cfg /etc/kamailio/kamailio.cfg
COPY tls.cfg /etc/kamailio/tls.cfg

CMD ["kamailio", "-DD", "-E", "-f", "/etc/kamailio/kamailio.cfg"]
