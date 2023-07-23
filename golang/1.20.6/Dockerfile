FROM debian:bullseye-20230411-slim as builder
MAINTAINER Alexander Yancharuk <alex at itvault dot info>

LABEL stage=builder

# Install packages needed for CGO
RUN apt-get update \
	&& DEBIAN_FRONTEND=noninteractive apt-get install -yqq --no-install-recommends \
		ca-certificates

ENV GOLANG_VERSION 1.20.6
ENV GOPATH /go
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH

# Go installation
ADD https://go.dev/dl/go${GOLANG_VERSION}.linux-amd64.tar.gz /tmp/
RUN mkdir -p ${GOPATH}/src \
	&& mkdir -p ${GOPATH}/bin \
	&& chmod -R 777 "$GOPATH" \
	&& tar -C /usr/local -xzf /tmp/go${GOLANG_VERSION}.linux-amd64.tar.gz \
	&& go clean -cache -testcache -modcache -fuzzcache

FROM debian:bullseye-20230411-slim as production
MAINTAINER Alexander Yancharuk <alex at itvault dot info>

# Install packages needed for CGO
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -yqq --no-install-recommends \
		ca-certificates \
		g++ \
		gcc \
		libc6-dev \
		make \
		pkg-config \
	&& apt-get clean \
	&& rm -rf \
    	/tmp/* \
    	/var/tmp/* \
		/var/lib/apt/lists/* \
		/var/log/apt/*

COPY --from=builder /go /go
COPY --from=builder /usr/local/go /usr/local/go

ENV GOLANG_VERSION 1.20.6
ENV GOPATH /go
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH

ENTRYPOINT ["/usr/local/go/bin/go"]

WORKDIR $GOPATH

# docker build --force-rm --no-cache --tag nafigat0r/go:1.20.6 ./ && docker image prune -f --filter label=stage=builder
