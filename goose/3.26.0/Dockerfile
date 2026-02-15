FROM nafigat0r/go:1.26.0 AS builder

LABEL stage=builder

ENV GOOSE_VERSION=v3.26.0

RUN CGO_ENABLED=0 go install github.com/pressly/goose/v3/cmd/goose@${GOOSE_VERSION} \
	&& go clean -cache -testcache -modcache -fuzzcache

FROM scratch AS image

ENV GOOSE_VERSION=v3.26.0

COPY --from=builder /etc/passwd /etc/passwd
COPY --from=builder /etc/group /etc/group
COPY --from=builder /go/bin/goose /usr/local/sbin/goose

USER nobody

WORKDIR /var/goose

ENTRYPOINT ["/usr/local/sbin/goose"]

# docker build --force-rm --no-cache --tag nafigat0r/goose:3.26.0 ./ && docker image prune -f --filter label=stage=builder
# ./annotate.sh goose 3.26.0 'Goose migration tool'
