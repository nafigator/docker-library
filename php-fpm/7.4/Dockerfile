FROM debian:buster-slim
MAINTAINER Alexander Yancharuk <alex at itvault dot info>

# Keys for PHP installation
ADD https://packages.sury.org/php/apt.gpg /etc/apt/trusted.gpg.d/php.gpg

RUN chmod 644 /etc/apt/trusted.gpg.d/php.gpg \
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
		php7.4-fpm \
		php7.4-bcmath \
		php7.4-curl \
		php7.4-gd \
		php7.4-intl \
		php7.4-json \
		php7.4-mbstring \
		php7.4-mysql \
		php7.4-sqlite3 \
		php7.4-opcache \
		php7.4-readline \
		php7.4-soap \
		php7.4-xml \
		php7.4-zip \
		php7.4-memcached \
		php7.4-redis \
		php7.4-amqp \
		php7.4-xdebug \
	# Cleanup
	&& DEBIAN_FRONTEND=noninteractive apt-get purge -yqq --allow-remove-essential --autoremove \
		gnupg \
		apt-transport-https \
		build-essential \
		e2fsprogs \
	&& rm /etc/apt/sources.list.d/php.list \
	&& apt-get update \
	&& apt-get clean \
	&& rm -rf /var/tmp/* /tmp/* \
		/var/lib/apt/lists/* \
		/var/log/apt/* \
		/var/cache/debconf \
		/var/cache/apt/archives/* \
		/etc/php/7.4/fpm/conf.d/20-xdebug.ini \
		/etc/apt/trusted.gpg.d/php.gpg \
	# Install locale
	&& sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen \
	&& DEBIAN_FRONTEND=noninteractive dpkg-reconfigure locales \
	&& update-locale LANG=en_US.UTF-8 \
	&& mkdir -p /run/php \
	&& chmod 777 /run/php

ENV LANG en_US.UTF-8

# Copy configs
COPY ./php-fpm.conf /etc/php/7.4/fpm/
COPY ./pool.d /etc/php/7.4/fpm/pool.d/

# Launch fpm
CMD ["php-fpm7.4"]

EXPOSE 9000

WORKDIR /var/www/html/
