FROM debian:stretch-slim

ENV APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE 1

# Install packages needed for ClickHouse
RUN apt-get update \
	&& DEBIAN_FRONTEND=noninteractive apt-get install -yqq --no-install-recommends \
		apt-transport-https \
		ca-certificates \
		locales \
		gnupg \
		curl \
	&& curl -sL https://repo.yandex.ru/clickhouse/CLICKHOUSE-KEY.GPG | apt-key add - \
	&& echo "deb http://repo.yandex.ru/clickhouse/deb/stable/ main/" > /etc/apt/sources.list.d/clickhouse.list \
	&& apt-get update \
	&& DEBIAN_FRONTEND=noninteractive apt-get install -yqq --no-install-recommends \
		clickhouse-server=19.1.6 \
		clickhouse-common-static=19.1.6 \
	&& chown -R clickhouse /etc/clickhouse-server/ \
	# Cleanup
	&& DEBIAN_FRONTEND=noninteractive apt-get purge -yqq --autoremove apt-transport-https \
		gnupg \
		curl \
	&& apt-get clean \
	&& rm -rf /var/tmp/* /tmp/* \
		/var/lib/apt/lists/* \
		/var/log/apt/* \
		/var/cache/debconf \
		/var/cache/apt/archives/* \
	# Install locale
	&& sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen \
	&& DEBIAN_FRONTEND=noninteractive dpkg-reconfigure locales \
	&& DEBIAN_FRONTEND=noninteractive update-locale LANG=en_US.UTF-8 \
	# Create dirs for client
	&& mkdir /nonexistent /docker-entrypoint-initdb.d \
	&& chown -R clickhouse /nonexistent /docker-entrypoint-initdb.d

ENV LANG en_US.UTF-8

COPY docker-entrypoint.sh /usr/local/bin/

USER clickhouse
EXPOSE 9000 8123 9009
VOLUME /var/lib/clickhouse

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["/usr/bin/clickhouse-server", "--config=/etc/clickhouse-server/config.xml"]
