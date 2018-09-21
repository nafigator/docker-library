FROM debian:stretch-slim

ARG DEBIAN_FRONTEND=noninteractive
ARG repository="deb http://repo.yandex.ru/clickhouse/deb/stable/ main/"
ARG version=18.12.17

# Install packages needed for ClickHouse
RUN apt-get update && apt-get install -yqq --no-install-recommends \
    apt-transport-https \
    ca-certificates \
    locales \
    gnupg \
    wget

# Keys for ClickHouse installation
RUN wget --quiet -O - https://repo.yandex.ru/clickhouse/CLICKHOUSE-KEY.GPG | apt-key add - \
    && echo $repository > /etc/apt/sources.list.d/clickhouse.list \
    && apt-get update \
    && apt-get install -yqq --no-install-recommends \
        clickhouse-server=$version \
        clickhouse-common-static=$version

COPY config.xml /etc/clickhouse-server/config.xml
RUN chown -R clickhouse /etc/clickhouse-server/

# Cleanup
RUN apt-get purge -yqq --autoremove \
        apt-transport-https \
        gnupg \
        wget \
    && rm -rf /var/tmp/* /tmp/* \
        /var/lib/apt/lists/* \
        /var/log/apt/* \
        /var/cache/debconf \
    && apt-get clean

# Install locale
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen \
	&& dpkg-reconfigure locales \
	&& update-locale LANG=en_US.UTF-8

ENV LANG en_US.UTF-8

USER clickhouse
EXPOSE 9888 8123 9009
VOLUME /var/lib/clickhouse

ENTRYPOINT exec /usr/bin/clickhouse-server --config=/etc/clickhouse-server/config.xml
