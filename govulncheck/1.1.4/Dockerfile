FROM nafigat0r/go:1.25.5 AS builder

LABEL stage=builder

# Install packages needed for installation
RUN apt-get update \
	&& DEBIAN_FRONTEND=noninteractive apt-get install -yqq --no-install-recommends \
		unzip

ENV GOPATH /go
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH
ENV GOVULNCHECK_VERSION 1.1.4

# Govulncheck installation
RUN go install golang.org/x/vuln/cmd/govulncheck@v${GOVULNCHECK_VERSION} \
	&& go clean -cache -testcache -modcache -fuzzcache

FROM nafigat0r/go:1.25.5 AS image

ENV GOVULNCHECK_VERSION 1.1.4

COPY --from=builder /go/bin/govulncheck /usr/local/sbin/govulncheck

WORKDIR /var/govulncheck

USER nobody

ENTRYPOINT ["/usr/local/sbin/govulncheck"]

# docker build --force-rm --no-cache --tag nafigat0r/govulncheck:1.1.4 ./ && docker image prune -f --filter label=stage=builder
# ./annotate.sh govulncheck 1.1.4 'Security utility for checking dependencies vulnerabilities'
