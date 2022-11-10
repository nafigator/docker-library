FROM debian:buster-slim
MAINTAINER Alexander Yancharuk <alex at itvault dot info>

# Install packages needed for PHP
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -yqq --no-install-recommends \
    ca-certificates \
    locales \
    python-dev \
    # Install locale
	&& sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen \
	&& DEBIAN_FRONTEND=noninteractive dpkg-reconfigure locales \
	&& update-locale LANG=en_US.UTF-8

# Go installation
ADD https://go.dev/dl/go1.19.3.linux-amd64.tar.gz /tmp/
RUN tar -C /usr/local -xzf /tmp/go1.19.3.linux-amd64.tar.gz

# Cleanup
RUN DEBIAN_FRONTEND=noninteractive apt-get purge -yqq --allow-remove-essential --autoremove \
    	python-dev \
    && DEBIAN_FRONTEND=noninteractive apt-get clean \
    && rm -rf /var/tmp/* /tmp/* \
        /var/lib/apt/lists/* \
        /var/log/apt/*

# Copy configs
ENV GOPATH /go
ENV PATH $GOPATH/bin:$PATH
ENV LANG en_US.UTF-8

RUN mkdir -p "$GOPATH/src" "$GOPATH/bin" && chmod -R 777 "$GOPATH"

ENTRYPOINT ["/usr/local/go/bin/go"]

WORKDIR $GOPATH
