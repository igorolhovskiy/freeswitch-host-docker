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
        git \
    && wget -O - https://files.freeswitch.org/repo/deb/debian-release/fsstretch-archive-keyring.asc | apt-key add - \
    && echo "deb http://files.freeswitch.org/repo/deb/debian-release/ buster main" > /etc/apt/sources.list.d/freeswitch.list \
    && echo "deb-src http://files.freeswitch.org/repo/deb/debian-release/ buster main" >> /etc/apt/sources.list.d/freeswitch.list \
    && apt-get update \
    && apt-get build-dep -y freeswitch \
    && git clone https://github.com/signalwire/freeswitch.git -bv1.10 /usr/src/freeswitch \
    && mkdir -p /usr/src/freeswitch/src/mod/applications/mod_dpevents \
    && git clone https://github.com/kvishnivetsky/freeswitch-mod_dpevents.git /usr/src/freeswitch/src/mod/applications/mod_dpevents \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && cd /usr/src/freeswitch \
    && ./bootstrap.sh -j \
    && rm -f configure.ac modules.conf

COPY ./freeswitch/build/configure.ac /usr/src/freeswitch/configure.ac
COPY ./freeswitch/build/modules.conf /usr/src/freeswitch/modules.conf

RUN cd /usr/src/freeswitch \
    && ./configure \
    && make \
    && make install \
    && make moh-install \
    && make sounds-install \
    && ln /usr/local/freeswitch/bin/fs_cli /bin/ 

COPY ./docker-entrypoint.sh /docker-entrypoint.sh

RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]