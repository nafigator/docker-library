FROM debian:stretch-slim

ARG DEBIAN_FRONTEND=noninteractive

# Install packages needed for PHP
RUN apt-get update && apt-get install -yqq --no-install-recommends \
	apt-transport-https \
	ca-certificates \
	gnupg \
	curl \
	locales

# Node installation
ADD https://deb.nodesource.com/setup_10.x /tmp/setup_10.x
RUN bash /tmp/setup_10.x \
	&& apt-get update \
	&& apt-get install -yqq --no-install-recommends nodejs

# Yarn installation
RUN curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
	&& echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
	&& apt-get update \
	&& apt-get install -yqq --no-install-recommends yarn

# Cleanup
RUN apt-get purge -yqq --autoremove \
		apt-transport-https \
	&& apt-get clean \
	&& rm -rf /var/tmp/* /tmp/* \
		/var/lib/apt/lists/* \
		/var/log/apt/*

# Install locale
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen \
	&& dpkg-reconfigure locales \
	&& update-locale LANG=en_US.UTF-8

ENV LANG en_US.UTF-8

# Launch fpm
CMD ["node"]

WORKDIR /var/www/html/
