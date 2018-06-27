FROM debian:stretch-slim

ARG USER_ID
ARG USER_PASSWORD
ARG USER_NAME
ARG XDEBUG_HOST

ARG DEBIAN_FRONTEND=noninteractive
# Set up debconf non-interactive mode
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

# Install packages needed for PHP
RUN umask 0022 && apt-get update && apt-get install -y --no-install-recommends \
    apt-transport-https \
    lsb-release \
    ca-certificates \
    gnupg \
    apt-utils \
    curl

# Keys for PHP installation
ADD https://packages.sury.org/php/apt.gpg /etc/apt/trusted.gpg.d/php.gpg
RUN chmod 644 /etc/apt/trusted.gpg.d/php.gpg
# Copy composer installer
ADD https://getcomposer.org/installer /tmp/

RUN echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list \
    && apt-get update \
    && apt-get install -y \
        php-common \
        php7.2-cli \
        php7.2-fpm \
        php7.2-json \
        php7.2-opcache \
        php7.2-readline \
        php7.2-bcmath \
        php7.2-mbstring \
        php7.2-mysql \
        php7.2-xml \
        php7.2-zip \
        php7.2-curl \
        php7.2-gd \
        php7.0-intl \
        php-memcached \
        php-xdebug \
    && php /tmp/installer --no-ansi --install-dir=/usr/local/bin --filename=composer \
    && apt-get remove -y --purge \
        apt-transport-https \
        lsb-release \
        ca-certificates \
        gnupg \
        apt-utils \
        curl \
    && touch /var/log/php7.2-fpm.log \
    && mkdir -p /run/php /var/www/.composer \
    && rm /etc/php/7.2/cli/conf.d/20-xdebug.ini \
    && apt-get autoremove -y --purge \
    && apt-get clean \
    && rm -rf /var/tmp/* /tmp/*

# Copy configs
COPY ./pool.d/ /etc/php/7.2/fpm/pool.d/
COPY ./php-fpm.conf /etc/php/7.2/fpm/

RUN groupadd -g ${USER_ID} ${USER_NAME} \
    && useradd -u ${USER_ID} -g ${USER_NAME} -p ${USER_PASSWORD} -b /var/www/html -d /var/www ${USER_NAME} \
    && usermod -aG sudo ${USER_NAME} \
    && chown ${USER_ID}:${USER_ID} /run/php /var/log/php7.2-fpm.log /var/www/.composer \
    && echo "xdebug.remote_host = ${XDEBUG_HOST}\nxdebug.remote_enable = 1" >> /etc/php/7.2/mods-available/xdebug.ini

# Launch fpm
CMD ["php-fpm7.2"]

EXPOSE 9000

USER ${USER_NAME}

WORKDIR /var/www/html/
