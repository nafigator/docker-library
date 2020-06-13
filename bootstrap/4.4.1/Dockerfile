FROM nafigat0r/node:14
MAINTAINER Alexander Yancharuk <alex at itvault dot info>

# Install packages needed for node
RUN apt-get update \
	&& DEBIAN_FRONTEND=noninteractive apt-get install -yqq --no-install-recommends \
		ruby-full \
		libpng-dev \
		zlibc \
		zlib1g \
		zlib1g-dev

COPY docker-entrypoint.sh /usr/local/bin/

# Cleanup
RUN DEBIAN_FRONTEND=noninteractive apt-get purge -yqq --autoremove apt-transport-https \
	&& apt-get clean \
	&& rm -rf /var/tmp/* /tmp/* \
		/var/lib/apt/lists/* \
		/var/log/apt/* \
		/var/cache/debconf \
		/var/cache/apt/archives/*

ENV RUBY_VERSION 2.5.5

ENTRYPOINT ["docker-entrypoint.sh"]

WORKDIR /var/www/html/
