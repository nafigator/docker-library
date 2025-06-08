#!/bin/bash

# Usage example
# ./annotate.sh govulncheck 1.1.4 'Security utility for checking dependencies vulnerabilities.'

IMAGE_REF="nafigat0r/$1";
GITHUB_REF="nafigator/docker-library";
REVISION=$(git log -n 1 --format=%h);
IMAGE_TAG="$2";
BUILD_TIME="$(docker inspect ${IMAGE_REF}:${IMAGE_TAG} | grep -oP '(?<=Created": ")[^"]*')";
docker run -u 0 \
    --rm -it \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v "/home/${USER}/.docker/config.json:/root/.docker/config.json" \
    --network host \
    nafigat0r/crane:0.20.5 mutate \
    --annotation "org.opencontainers.image.revision=${REVISION}" \
    --annotation "org.opencontainers.image.created=${BUILD_TIME}" \
    --annotation "org.opencontainers.image.title=$1" \
    --annotation "org.opencontainers.image.ref.name=${IMAGE_TAG}" \
    --annotation "org.opencontainers.image.version=${IMAGE_TAG}" \
    --annotation "org.opencontainers.image.description=$3" \
    --annotation "org.opencontainers.image.authors=alex@itvault.info" \
    --annotation "org.opencontainers.image.vendor=Alexander Yancharuk" \
    --annotation "org.opencontainers.image.licenses=MIT" \
    --annotation "org.opencontainers.image.url=https://github.com/${GITHUB_REF}/blob/${REVISION}/$1/${IMAGE_TAG}/README.md" \
    --annotation "org.opencontainers.image.source=https://github.com/${GITHUB_REF}/blob/${REVISION}/$1/${IMAGE_TAG}/Dockerfile" \
    ${IMAGE_REF}:${IMAGE_TAG}
