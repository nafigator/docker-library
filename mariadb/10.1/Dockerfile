FROM debian:stretch-slim

ENV APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE 1

# Keys for PHP installation
RUN apt-get update \
	&& DEBIAN_FRONTEND=noninteractive apt-get install -yqq --no-install-recommends \
		ca-certificates \
		gnupg \
		locales \
		dirmngr \
	# Keys for PHP installation
	&& apt-key adv --no-tty --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xF1656F24C74CD1D8 \
	# Install packages needed for PHP
	&& echo "deb http://sfo1.mirrors.digitalocean.com/mariadb/repo/10.1/debian stretch main" > /etc/apt/sources.list.d/mariadb.list \
	&& apt-get update \
	&& DEBIAN_FRONTEND=noninteractive apt-get install -yqq --no-install-recommends \
		mariadb-server \
	# Cleanup
	&& DEBIAN_FRONTEND=noninteractive apt-get purge -yqq --autoremove \
		gnupg \
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
	&& find /etc/mysql/ -name '*.cnf' -print0 |\
		xargs -0 grep -lZE '^(bind-address|log)' | \
		xargs -rt -0 sed -Ei 's/^(bind-address|log)/#&/' \
	&& sed -Ei 's/^#(.*utf8.*)/\1/' /etc/mysql/conf.d/mariadb.cnf \
	&& echo '[mysqld]\nskip-host-cache\nskip-name-resolve' > /etc/mysql/conf.d/docker.cnf

ENV LANG en_US.UTF-8

VOLUME /var/lib/mysql

COPY docker-entrypoint.sh /usr/local/bin/

EXPOSE 3306

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["mysqld"]
