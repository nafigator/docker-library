FROM debian:buster-slim
MAINTAINER Alexander Yancharuk <alex at itvault dot info>

# Install packages needed for sassc
RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -yqq --no-install-recommends \
        git \
        ca-certificates \
        build-essential \
    && cd /tmp \
    && git clone https://github.com/sass/sassc.git \
    && . sassc/script/bootstrap \
    && make -C sassc install \
    && DEBIAN_FRONTEND=noninteractive apt-get purge -yqq --autoremove \
        git \
        ca-certificates \
        build-essential \
    # Cleanup
    && apt-get clean \
    && rm -rf /var/tmp/* /tmp/* \
        /var/lib/apt/lists/* \
        /var/log/apt/* \
        /var/cache/debconf \
        /var/cache/apt/archives/*

COPY docker-entrypoint.sh /usr/local/bin/

ENTRYPOINT ["docker-entrypoint.sh"]

# Launch sassc
CMD ["sassc", "-v"]

WORKDIR /var/www/html/
