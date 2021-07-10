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
		php8.0-fpm \
		php8.0-bcmath \
		php8.0-curl \
		php8.0-gd \
		php8.0-intl \
		php8.0-mbstring \
		php8.0-mysql \
		php8.0-sqlite3 \
		php8.0-opcache \
		php8.0-readline \
		php8.0-soap \
		php8.0-xml \
		php8.0-zip \
		php8.0-memcached \
		php8.0-redis \
		php8.0-amqp \
		php8.0-xdebug \
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
		/etc/php/8.0/fpm/conf.d/20-xdebug.ini \
		/etc/apt/trusted.gpg.d/php.gpg \
	# Install locale
	&& sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen \
	&& DEBIAN_FRONTEND=noninteractive dpkg-reconfigure locales \
	&& update-locale LANG=en_US.UTF-8 \
	&& mkdir -p /run/php \
	&& chmod 777 /run/php

ENV LANG en_US.UTF-8

# Copy configs
COPY ./php-fpm.conf /etc/php/8.0/fpm/
COPY ./pool.d /etc/php/8.0/fpm/pool.d/

# Launch fpm
CMD ["php-fpm8.0"]

EXPOSE 9000

WORKDIR /var/www/html/
