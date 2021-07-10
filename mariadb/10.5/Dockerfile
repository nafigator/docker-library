FROM debian:buster-slim

ENV APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE 1
ENV MARIADB_MAJOR 10.5

# Keys for PHP installation
RUN apt-get update \
	&& DEBIAN_FRONTEND=noninteractive apt-get install -yqq --no-install-recommends \
		ca-certificates \
		gnupg \
		locales \
		software-properties-common \
		dirmngr \
		gosu \
		pwgen \
		tzdata \
		xz-utils \
	# Keys for MariaDB installation
	&& apt-key adv --fetch-keys 'https://mariadb.org/mariadb_release_signing_key.asc' \
	# Install packages needed for MariaDB
	&& echo "deb [arch=amd64] http://mirror.mephi.ru/mariadb/repo/$MARIADB_MAJOR/debian buster main" > /etc/apt/sources.list.d/mariadb.list \
	&& apt-get update \
	&& DEBIAN_FRONTEND=noninteractive apt-get install -yqq \
		mariadb-server-10.5=1:10.5.11+maria~buster \
	# Cleanup
	&& DEBIAN_FRONTEND=noninteractive apt-get purge -yqq --allow-remove-essential --autoremove \
		gnupg \
		software-properties-common \
		dirmngr \
		build-essential \
		e2fsprogs \
		fdisk \
	&& rm /etc/apt/sources.list.d/mariadb.list \
	&& apt-get update \
	&& apt-get clean \
	&& rm -rf /var/tmp/* /tmp/* \
		/var/lib/apt/lists/* \
		/var/log/apt/* \
		/var/cache/debconf \
		/var/cache/apt/archives/* \
	# Install locale
	&& sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen \
	&& DEBIAN_FRONTEND=noninteractive dpkg-reconfigure locales \
	&& update-locale LANG=en_US.UTF-8 \
	# comment out a few problematic configuration values
	&& find /etc/mysql/ -name '*.cnf' -print0 | \
		xargs -0 grep -lZE '^(bind-address|log|socket\s)' | \
		xargs -rt -0 sed -Ei 's/^(bind-address|log|socket\s)/#&/' \
	&& echo '[mysqld]\nskip-host-cache\nskip-name-resolve' > /etc/mysql/conf.d/docker.cnf \
	&& rm -rf /var/lib/mysql \
	&& mkdir -p /var/lib/mysql /var/run/mysqld \
	&& chown -R mysql:mysql /var/lib/mysql /var/run/mysqld \
	&& chmod 777 /var/run/mysqld \
	&& mkdir /docker-entrypoint-initdb.d

ENV LANG en_US.UTF-8

VOLUME /var/lib/mysql

COPY docker-entrypoint.sh /usr/local/bin/

EXPOSE 3306

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["mysqld"]
