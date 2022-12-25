FROM debian:buster-slim
MAINTAINER Alexander Yancharuk <alex at itvault dot info>

# Install packages needed for PHP
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -yqq --no-install-recommends \
		ca-certificates \
		locales \
		g++ \
		gcc \
		libc6-dev \
		make \
		pkg-config \
    # Install locale
	&& sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen \
	&& DEBIAN_FRONTEND=noninteractive dpkg-reconfigure locales \
	&& update-locale LANG=en_US.UTF-8 \
    && apt-get clean \
	&& rm -rf /var/tmp/* /tmp/* \
		/var/lib/apt/lists/* \
		/var/log/apt/*

ENV GOLANG_VERSION 1.19.4

# Go installation
ADD https://go.dev/dl/go1.19.4.linux-amd64.tar.gz /tmp/
RUN tar -C /usr/local -xzf /tmp/go1.19.4.linux-amd64.tar.gz

ENV GOPATH /go
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH
ENV LANG en_US.UTF-8

RUN mkdir -p "$GOPATH/{src,bin}" && chmod -R 777 "$GOPATH"

ENTRYPOINT ["/usr/local/go/bin/go"]

WORKDIR $GOPATH
