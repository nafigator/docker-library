FROM nafigat0r/php-cli:8.0
MAINTAINER Alexander Yancharuk <alex at itvault dot info>

ENV COMPOSER_VERSION 2.1.3

# Copy composer installer
ADD https://getcomposer.org/installer /tmp/installer
ADD https://composer.github.io/snapshots.pub /var/www/.composer/keys.dev.pub
ADD https://composer.github.io/releases.pub /var/www/.composer/keys.tags.pub

# Prepare composer dir
RUN chmod -R 777 /var/www/.composer \
	# Install packages needed for PHP
	&& apt-get update \
	&& DEBIAN_FRONTEND=noninteractive apt-get install -yqq --no-install-recommends \
		openssh-client \
		gnupg \
		unzip \
		git

# Install Composer
RUN php /tmp/installer --no-ansi --install-dir=/usr/local/bin --filename=composer  --version=2.1.3 \
	# Cleanup
	&& apt-get clean \
	&& DEBIAN_FRONTEND=noninteractive apt-get purge -yqq --allow-remove-essential --autoremove \
		gnupg \
	&& rm -rf /var/tmp/* /tmp/* \
		/var/lib/apt/lists/* \
		/var/log/apt/* \
		/var/cache/debconf \
		/var/cache/apt/archives/* \
		/tmp/installer

COPY docker-entrypoint.sh /usr/local/bin/

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["composer"]

WORKDIR /var/www/html/
