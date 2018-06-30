FROM debian:stretch-slim

ARG DEBIAN_FRONTEND=noninteractive

# Install packages needed for PHP
RUN apt-get update && apt-get install -yq --no-install-recommends \
    apt-transport-https \
    ca-certificates \
    gnupg \
    locales

# Keys for PHP installation
ADD https://packages.sury.org/php/apt.gpg /etc/apt/trusted.gpg.d/php.gpg
RUN chmod 644 /etc/apt/trusted.gpg.d/php.gpg

RUN echo "deb https://packages.sury.org/php/ stretch main" > /etc/apt/sources.list.d/php.list \
    && apt-get update \
    && apt-get install -yq --no-install-recommends \
        php-common \
        php-memcached \
        php-xdebug \
        php7.2-bcmath \
        php7.2-cli \
        php7.2-curl \
        php7.2-fpm \
        php7.2-gd \
        php7.2-intl \
        php7.2-json \
        php7.2-mbstring \
        php7.2-mysql \
        php7.2-opcache \
        php7.2-readline \
        php7.2-soap \
        php7.2-xml \
        php7.2-zip \
    && mkdir -p /run/php

# Cleanup
RUN apt-get purge -y --autoremove \
        apt-transport-https \
    && apt-get clean \
    && rm -rf /var/tmp/* /tmp/* \
        /var/lib/apt/lists/* \
        /var/log/apt/* \
        /etc/php/7.2/cli/conf.d/20-xdebug.ini \
        /etc/php/7.2/fpm/conf.d/20-xdebug.ini

# Copy configs
COPY ./php-fpm.conf /etc/php/7.2/fpm/
COPY ./pool.d/ /etc/php/7.2/fpm/pool.d/

# Install locale
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen \
	&& dpkg-reconfigure locales \
	&& update-locale LANG=en_US.UTF-8

ENV LANG en_US.UTF-8

# Launch fpm
CMD ["php-fpm7.2"]

EXPOSE 9000

WORKDIR /var/www/html/
