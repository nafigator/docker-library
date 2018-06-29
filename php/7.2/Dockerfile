FROM debian:stretch-slim

ARG DEBIAN_FRONTEND=noninteractive
# Set up debconf non-interactive mode
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

# Install packages needed for PHP
RUN umask 0022 && apt-get update && apt-get install -y --no-install-recommends \
    apt-transport-https \
    apt-utils \
    ca-certificates \
    curl \
    gnupg \
    locales \
    lsb-release

RUN printf "en_US.UTF-8 UTF-8\nru_RU.UTF-8 UTF-8" > /etc/locale.gen \
    && locale-gen

# Keys for PHP installation
ADD https://packages.sury.org/php/apt.gpg /etc/apt/trusted.gpg.d/php.gpg
RUN chmod 644 /etc/apt/trusted.gpg.d/php.gpg
# Copy composer installer
ADD https://getcomposer.org/installer /tmp/

RUN echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list \
    && apt-get update \
    && apt-get install -y \
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

# Install Composer
RUN mkdir -p /var/www/.composer \
    && php /tmp/installer --no-ansi --install-dir=/usr/local/bin --filename=composer

# Cleanup
RUN apt-get remove -y --purge \
        apt-transport-https \
        apt-utils \
        ca-certificates \
        curl \
        gnupg \
        locales \
        lsb-release \
    && apt-get autoremove -y --purge \
    && apt-get clean \
    && rm -rf /var/tmp/* /tmp/* \
        /var/lib/apt/lists/* \
        /var/log/apt/* \
        /etc/php/7.2/cli/conf.d/20-xdebug.ini \
        /etc/php/7.2/fpm/conf.d/20-xdebug.ini

# Copy configs
COPY ./php-fpm.conf /etc/php/7.2/fpm/
COPY ./pool.d/ /etc/php/7.2/fpm/pool.d/

# Launch fpm
CMD ["php-fpm7.2"]

EXPOSE 9000

WORKDIR /var/www/html/
