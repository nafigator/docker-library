FROM nafigat0r/node:13
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
COPY Gemfile /var/www/html
COPY Gemfile.lock /var/www/html

# Cleanup
RUN DEBIAN_FRONTEND=noninteractive apt-get purge -yqq --autoremove apt-transport-https \
	&& apt-get clean \
	&& rm -rf /var/tmp/* /tmp/* \
		/var/lib/apt/lists/* \
		/var/log/apt/* \
		/var/cache/debconf \
		/var/cache/apt/archives/* \
	&& mkdir -p /var/lib/gems \
	&& chmod -R 777 /var/lib/gems /usr/local/bin

# Bundler
RUN gem install bundler:1.17.3 \
	&& bundle install

ENV RUBY_VERSION 2.5.5
ENV PATH="/var/www/html/.gem/ruby/2.5.0/bin:${PATH}"

ENTRYPOINT ["docker-entrypoint.sh"]

# Launch node
CMD ["ruby"]

WORKDIR /var/www/html/
