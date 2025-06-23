FROM nafigat0r/go:1.24.4 AS builder

# https://stackoverflow.com/questions/50126741/how-to-remove-intermediate-images-from-a-build-after-the-build
LABEL stage=builder

ENV GOLANGCI_LINT_VERSION=v2.1.6

RUN go install github.com/golangci/golangci-lint/v2/cmd/golangci-lint@${GOLANGCI_LINT_VERSION} \
	&& go clean -cache -testcache -modcache -fuzzcache

WORKDIR /go

FROM nafigat0r/go:1.24.4 AS image

ENV GOLANGCI_LINT_VERSION=v2.1.6

COPY --from=builder /go/bin/golangci-lint /go/bin/golangci-lint

WORKDIR /go

USER nobody

ENTRYPOINT ["/go/bin/golangci-lint"]

# docker build --force-rm --no-cache --tag nafigat0r/golangci-lint:2.1.6 ./ && docker image prune -f --filter label=stage=builder
# ./annotate.sh golangci-lint 2.1.6 'Go linters runner'
