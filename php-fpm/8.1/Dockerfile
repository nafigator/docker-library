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
		php8.1-fpm \
		php8.1-bcmath \
		php8.1-curl \
		php8.1-gd \
		php8.1-intl \
		php8.1-mbstring \
		php8.1-mysql \
		php8.1-sqlite3 \
		php8.1-opcache \
		php8.1-readline \
		php8.1-soap \
		php8.1-xml \
		php8.1-zip \
		php8.1-memcached \
		php8.1-redis \
		php8.1-amqp \
		php8.1-xdebug \
	# Cleanup
	&& DEBIAN_FRONTEND=noninteractive apt-get purge -yqq --allow-remove-essential --autoremove \
		gnupg \
		apt-transport-https \
	&& rm /etc/apt/sources.list.d/php.list \
	&& apt-get update \
	&& apt-get clean \
	&& rm -rf /var/tmp/* /tmp/* \
		/var/lib/apt/lists/* \
		/var/log/apt/* \
		/var/cache/debconf \
		/var/cache/apt/archives/* \
		/etc/php/8.1/fpm/conf.d/20-xdebug.ini \
		/etc/apt/trusted.gpg.d/php.gpg \
	# Install locale
	&& sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen \
	&& DEBIAN_FRONTEND=noninteractive dpkg-reconfigure locales \
	&& update-locale LANG=en_US.UTF-8 \
	&& mkdir -p /run/php \
	&& chmod 777 /run/php

ENV LANG en_US.UTF-8

# Copy configs
COPY ./php-fpm.conf /etc/php/8.1/fpm/
COPY ./pool.d /etc/php/8.1/fpm/pool.d/

# Launch fpm
CMD ["php-fpm8.1"]

EXPOSE 9000

WORKDIR /var/www/html/
