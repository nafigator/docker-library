FROM nafigat0r/go:1.20.6 as builder
MAINTAINER Alexander Yancharuk <alex at itvault dot info>

# https://stackoverflow.com/questions/50126741/how-to-remove-intermediate-images-from-a-build-after-the-build
LABEL stage=builder

ENV GOLANGCI_LINT_VERSION=v1.53.3

RUN go install github.com/golangci/golangci-lint/cmd/golangci-lint@${GOLANGCI_LINT_VERSION} \
    && go clean -cache -testcache -modcache -fuzzcache

WORKDIR /go

FROM nafigat0r/go:1.20.6 as image
MAINTAINER Alexander Yancharuk <alex at itvault dot info>

ENV GOLANGCI_LINT_VERSION=v1.53.3

COPY --from=builder /go /go
COPY --from=builder /usr/local/go /usr/local/go

ENTRYPOINT ["/go/bin/golangci-lint"]

WORKDIR /go

# docker build --force-rm --no-cache --tag nafigat0r/golangci-lint:1.53.3 ./ && docker image prune -f --filter label=stage=builder
