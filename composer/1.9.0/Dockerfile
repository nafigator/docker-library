FROM nafigat0r/php-cli:7.3
MAINTAINER Alexander Yancharuk <alex at itvault dot info>

ENV COMPOSER_VERSION 1.9.0

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
RUN php /tmp/installer --no-ansi --install-dir=/usr/local/bin --filename=composer  --version=1.9.0 \
	# Cleanup
	&& apt-get clean \
	&& rm -rf /var/tmp/* /tmp/* \
		/var/lib/apt/lists/* \
		/var/log/apt/* \
		/var/cache/debconf \
		/var/cache/apt/archives/* \
	# Install locale
	&& sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen \
	&& DEBIAN_FRONTEND=noninteractive dpkg-reconfigure locales \
	&& update-locale LANG=en_US.UTF-8

ENV LANG en_US.UTF-8

COPY docker-entrypoint.sh /usr/local/bin/

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["composer"]

WORKDIR /var/www/html/
