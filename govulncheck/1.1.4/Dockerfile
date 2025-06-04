FROM debian:bullseye-20230411-slim as builder

LABEL stage=builder

# Install packages needed for installation
RUN apt-get update \
	&& DEBIAN_FRONTEND=noninteractive apt-get install -yqq --no-install-recommends \
		ca-certificates \
		curl \
		unzip

ENV GOPATH /go
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH
ENV GOLANG_VERSION 1.24.3
ENV GOVULNCHECK_VERSION 1.1.4

# Go installation
ADD https://go.dev/dl/go${GOLANG_VERSION}.linux-amd64.tar.gz /tmp/

# Go installation
RUN mkdir -p ${GOPATH}/src \
	&& mkdir -p ${GOPATH}/bin \
	&& chmod -R 777 "$GOPATH" \
	&& tar -C /usr/local -xzf /tmp/go${GOLANG_VERSION}.linux-amd64.tar.gz \
	# Install govulncheck
	&& go install golang.org/x/vuln/cmd/govulncheck@v${GOVULNCHECK_VERSION} \
	&& go clean -cache -testcache -modcache -fuzzcache

FROM nafigat0r/go:1.24.3 AS production

ENV GOLANG_VERSION 1.24.3
ENV GOVULNCHECK_VERSION 1.1.4

ARG REVISION
LABEL org.opencontainers.image.revision="$REVISION" \
	org.opencontainers.image.authors="alex@itvault.info" \
	org.opencontainers.image.vendor="Alexander Yancharuk" \
	org.opencontainers.image.licenses=MIT \
	org.opencontainers.image.source="https://github.com/nafigator/docker-library/blob/${REVISION}/govulncheck/${GOVULNCHECK_VERSION}/Dockerfile"

COPY --from=builder /go/bin/govulncheck /usr/local/sbin/govulncheck

ENTRYPOINT ["/usr/local/sbin/govulncheck"]

WORKDIR /var/govulncheck

# docker build --force-rm --no-cache --build-arg REVISION=$(git log -n 1 --format=%h) --tag nafigat0r/govulncheck:1.1.4 ./ && docker image prune -f --filter label=stage=builder