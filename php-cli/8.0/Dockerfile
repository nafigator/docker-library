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
		php8.0-cli \
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
	&& rm /etc/apt/sources.list.d/php.list \
	&& apt-get update \
	&& apt-get clean \
	&& rm -rf /var/tmp/* /tmp/* \
		/var/lib/apt/lists/* \
		/var/log/apt/* \
		/var/cache/debconf \
		/var/cache/apt/archives/* \
		/etc/php/8.0/cli/conf.d/20-xdebug.ini \
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
