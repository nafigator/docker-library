FROM debian:buster-slim
MAINTAINER Alexander Yancharuk <alex at itvault dot info>

# Keys for PHP installation
ADD https://packages.sury.org/php/apt.gpg /etc/apt/trusted.gpg.d/php.gpg
ADD https://raw.githubusercontent.com/eficode/wait-for/master/wait-for /usr/local/bin/wait-for

RUN chmod 644 /etc/apt/trusted.gpg.d/php.gpg \
	&& chmod 755 /usr/local/bin/wait-for \
	# Install packages needed for PHP
	&& apt-get update \
	&& DEBIAN_FRONTEND=noninteractive apt-get install -yqq --no-install-recommends \
		apt-transport-https \
		ca-certificates \
		gnupg \
		locales \
		netcat-traditional \
	&& echo "deb https://packages.sury.org/php/ buster main" > /etc/apt/sources.list.d/php.list \
	&& apt-get update \
	&& DEBIAN_FRONTEND=noninteractive apt-get install -yqq --no-install-recommends \
		php7.2-cli \
		php7.2-bcmath \
		php7.2-curl \
		php7.2-gd \
		php7.2-intl \
		php7.2-json \
		php7.2-mbstring \
		php7.2-mysql \
		php7.2-sqlite3 \
		php7.2-opcache \
		php7.2-readline \
		php7.2-soap \
		php7.2-xml \
		php7.2-zip \
		php7.2-memcached \
		php7.2-redis \
		php7.2-amqp \
		php7.2-xdebug \
	# Cleanup
	&& DEBIAN_FRONTEND=noninteractive apt-get purge -yqq --allow-remove-essential --autoremove \
		gnupg \
		apt-transport-https \
		build-essential \
		e2fsprogs \
		fdisk \
	&& rm /etc/apt/sources.list.d/php.list \
	&& apt-get update \
	&& apt-get clean \
	&& rm -rf /var/tmp/* /tmp/* \
		/var/lib/apt/lists/* \
		/var/log/apt/* \
		/var/cache/debconf \
		/var/cache/apt/archives/* \
		/etc/apt/trusted.gpg.d/php.gpg \
	# Install locale
	&& sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen \
	&& DEBIAN_FRONTEND=noninteractive dpkg-reconfigure locales \
	&& update-locale LANG=en_US.UTF-8

ENV LANG en_US.UTF-8

COPY docker-entrypoint.sh /usr/local/bin/

ENTRYPOINT ["docker-entrypoint.sh"]

# Launch php
CMD ["php", "-a"]

WORKDIR /var/www/html/
