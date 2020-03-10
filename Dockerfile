FROM debian:buster
LABEL mainteiner = Igor Olhovskiy <IgorOlhovskiy@gmail.com>

# Install Required Dependencies
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y \
        wget \
        curl \
        net-tools \
        gnupg2 \
        ssl-cert \
        ca-certificates \
        procps \
    && wget -O - https://files.freeswitch.org/repo/deb/debian-release/fsstretch-archive-keyring.asc | apt-key add - \
    && echo "deb http://files.freeswitch.org/repo/deb/debian-release/ buster main" > /etc/apt/sources.list.d/freeswitch.list \
    && echo "deb-src http://files.freeswitch.org/repo/deb/debian-release/ buster main" >> /etc/apt/sources.list.d/freeswitch.list \
    && apt-get update \
    && apt-get install -y freeswitch-meta-all \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY ./docker-entrypoint.sh /docker-entrypoint.sh

RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]