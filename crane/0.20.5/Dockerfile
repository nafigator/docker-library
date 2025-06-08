FROM nafigat0r/go:1.24.3 as builder

# https://stackoverflow.com/questions/50126741/how-to-remove-intermediate-images-from-a-build-after-the-build
LABEL stage=builder

ENV CRANE_VERSION=v0.20.5

RUN CGO_ENABLED=0 go install github.com/google/go-containerregistry/cmd/crane@${CRANE_VERSION}

WORKDIR /go

FROM scratch AS image

ENV CRANE_VERSION=v0.20.5

LABEL category=utility \
	lang=go \
	name=crane

COPY --from=builder /etc/passwd /etc/passwd
COPY --from=builder /etc/group /etc/group
COPY --from=builder /go/bin/crane /usr/local/sbin/crane
COPY --from=builder /usr/local/share/ca-certificates /usr/local/share/ca-certificates
COPY --from=builder /etc/ssl/certs /etc/ssl/certs

WORKDIR /usr/local/sbin

USER nobody

ENTRYPOINT ["/usr/local/sbin/crane"]

# docker build --force-rm --no-cache --tag nafigat0r/crane:0.20.5 ./ && docker image prune -f --filter label=stage=builder
