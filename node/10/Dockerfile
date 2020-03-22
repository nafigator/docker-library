FROM debian:stretch-slim
MAINTAINER Alexander Yancharuk <alex at itvault dot info>

ENV APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE 1

# Install packages needed for node
RUN apt-get update \
	&& DEBIAN_FRONTEND=noninteractive apt-get install -yqq --no-install-recommends \
		apt-transport-https \
		ca-certificates \
		gnupg \
		curl \
		locales \
		python-dev \
		build-essential \
	# Install locale
	&& sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen \
	&& DEBIAN_FRONTEND=noninteractive dpkg-reconfigure locales \
	&& update-locale LANG=en_US.UTF-8

ENV LANG en_US.UTF-8
COPY docker-entrypoint.sh /usr/local/bin/

# Node installation
ADD https://deb.nodesource.com/setup_10.x /tmp/setup_10.x
RUN bash /tmp/setup_10.x \
	&& apt-get update \
	&& DEBIAN_FRONTEND=noninteractive apt-get install -yqq --no-install-recommends nodejs \
	# Yarn installation
	&& curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
	&& echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list \
	&& apt-get update \
	&& DEBIAN_FRONTEND=noninteractive apt-get install -yqq --no-install-recommends yarn

# Cleanup
RUN DEBIAN_FRONTEND=noninteractive apt-get purge -yqq --autoremove apt-transport-https \
	&& apt-get clean \
	&& rm -rf /var/tmp/* /tmp/* \
		/etc/apt/sources.list.d/* \
		/var/lib/apt/lists/* \
		/var/log/apt/* \
		/var/cache/debconf \
		/var/cache/apt/archives/*

ENTRYPOINT ["docker-entrypoint.sh"]

# Launch node
CMD ["node"]

WORKDIR /var/www/html/
