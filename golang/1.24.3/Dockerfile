FROM debian:bookworm-20250520-slim AS builder

LABEL stage=builder

# Install packages needed for CGO
RUN apt-get update \
	&& DEBIAN_FRONTEND=noninteractive apt-get install -yqq --no-install-recommends \
		ca-certificates \
		curl \
		unzip

ENV PB_REL "https://github.com/protocolbuffers/protobuf/releases"
ENV GOPATH /go
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH
ENV GOLANG_VERSION 1.24.3
ENV GOMOCK_VERSION 0.5.0
ENV PROTOC_VERSION 30.2
ENV PROTOC_GEN_GO_VERSION v1.36.6
ENV PROTOC_GEN_GO_GRPC_VERSION v1.5.1
ENV LINTER_VERSION v0.55.6

# Download The Ministry of Digital Development and Communications certs
RUN curl --output-dir /usr/local/share/ca-certificates -sO https://gu-st.ru/content/lending/russian_trusted_root_ca_pem.crt \
	&& curl --output-dir /usr/local/share/ca-certificates -sO https://gu-st.ru/content/lending/russian_trusted_sub_ca_pem.crt \
	&& update-ca-certificates

# Go installation
ADD https://go.dev/dl/go${GOLANG_VERSION}.linux-amd64.tar.gz /tmp/
ADD $PB_REL/download/v${PROTOC_VERSION}/protoc-${PROTOC_VERSION}-linux-x86_64.zip /tmp/

# Go installation
RUN mkdir -p ${GOPATH}/src \
	&& mkdir -p ${GOPATH}/bin \
	&& chmod -R 777 "$GOPATH" \
	&& tar -C /usr/local -xzf /tmp/go${GOLANG_VERSION}.linux-amd64.tar.gz \
	# Install Uber gomock
	&& go install go.uber.org/mock/mockgen@v${GOMOCK_VERSION} \
	&& unzip /tmp/protoc-${PROTOC_VERSION}-linux-x86_64.zip -d /usr/local \
	# Install protoc-gen-go
	&& go install google.golang.org/protobuf/cmd/protoc-gen-go@${PROTOC_GEN_GO_VERSION} \
	# Install protoc-gen-go-grpc
	&& go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@${PROTOC_GEN_GO_GRPC_VERSION} \
	# Install protoc-gen-protolint
	&& go install github.com/yoheimuta/protolint/cmd/protoc-gen-protolint@${LINTER_VERSION} \
	&& go clean -cache -testcache -modcache -fuzzcache

FROM debian:bookworm-20250520-slim AS image

# Install packages needed for CGO
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -yqq --no-install-recommends \
		curl \
		g++ \
		gcc \
		libc6-dev \
		make \
		pkg-config \
		git \
	&& apt-get clean \
	&& rm -rf /var/tmp/* /tmp/* \
		/var/lib/apt/lists/* \
		/var/log/apt/*

ENV GOPATH /go
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH
ENV GOLANG_VERSION 1.24.3
ENV GOMOCK_VERSION 0.5.0
ENV PROTOC_VERSION 30.2
ENV PROTOC_GEN_GO_VERSION v1.36.6
ENV PROTOC_GEN_GO_GRPC_VERSION v1.5.1
ENV LINTER_VERSION v0.55.6
ENV ANALYZER_VERSION v0.0.0-20241125201851-f880bc31df61

COPY --from=builder /go /go
COPY --from=builder /usr/local/bin/protoc /usr/local/bin
COPY --from=builder /usr/local/include/google /usr/local/include/google
COPY --from=builder /usr/local/go /usr/local/go
# Copy CA certificates for HTTPS
COPY --from=builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/

RUN go env -w GOTOOLCHAIN=local \
	&& go telemetry off

ENTRYPOINT ["/usr/local/go/bin/go"]

WORKDIR $GOPATH

# docker build --force-rm --no-cache --tag nafigat0r/go:1.24.3 ./ && docker image prune -f --filter label=stage=builder
# ./annotate.sh go 1.24.3 'Google Go language image'
