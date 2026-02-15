FROM nafigat0r/go:1.26.0 AS builder

# https://stackoverflow.com/questions/50126741/how-to-remove-intermediate-images-from-a-build-after-the-build
LABEL stage=builder

ENV CRANE_VERSION=v0.20.7

RUN CGO_ENABLED=0 go install github.com/google/go-containerregistry/cmd/crane@${CRANE_VERSION}

WORKDIR /go

FROM scratch AS image

ENV CRANE_VERSION=v0.20.7

LABEL category=utility \
	lang=go \
	name=crane

COPY --from=builder /etc/passwd /etc/passwd
COPY --from=builder /etc/group /etc/group
COPY --from=builder /go/bin/crane /usr/local/sbin/crane
# Copy CA certificates for HTTPS
COPY --from=builder /etc/ssl/certs /etc/ssl/certs

WORKDIR /var/www

USER www-data

ENTRYPOINT ["/usr/local/sbin/crane"]

# docker build --force-rm --no-cache --tag nafigat0r/crane:0.20.7 ./ && docker image prune -f --filter label=stage=builder
# ./annotate.sh crane 0.20.7 'Tool for interacting with remote images and registries'
