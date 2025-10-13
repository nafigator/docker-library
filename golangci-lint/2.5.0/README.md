# Versions
GoLang Linter 2.5.0

# Supported tags and respective `Dockerfile` links
-	[`2.5.0` (*2.5.0/Dockerfile*)](https://github.com/nafigator/docker-library/blob/master/golangci-lint/2.5.0/Dockerfile)
-	[`2.1.6` (*2.1.6/Dockerfile*)](https://github.com/nafigator/docker-library/blob/master/golangci-lint/2.1.6/Dockerfile)
-	[`2.0.2` (*2.0.2/Dockerfile*)](https://github.com/nafigator/docker-library/blob/master/golangci-lint/2.0.2/Dockerfile)
-	[`1.63.4` (*1.63.4/Dockerfile*)](https://github.com/nafigator/docker-library/blob/master/golangci-lint/1.63.4/Dockerfile)
-	[`1.53.3` (*1.53.3/Dockerfile*)](https://github.com/nafigator/docker-library/blob/master/golangci-lint/1.53.3/Dockerfile)

# How to use this image
### Run container via docker
```bash
$ docker run --user $(id -u):$(id -g) --rm -ti nafigat0r/golangci-lint:2.5.0 version
```
### Check project
```bash
$ docker run -ti --rm --user "$(id -u):$(id -g)" \
    -e HOME=/tmp \
    -e XDG_CONFIG_HOME=/var/config \
    -e XDG_CACHE_HOME=/var/cache \
    -e GOCACHE=/var/cache/go-build \
    -e CGO_ENABLED=0 \
    -v /etc/passwd:/etc/passwd:ro \
    -v /etc/group:/etc/group:ro \
    -v "$(readlink -f ${HOME}/.gitconfig):/etc/gitconfig:ro" \
    -v "${HOME}/.config:/var/config" \
    -v "${GOPATH}/pkg:/go/pkg:Z" \
    -v "${GOPATH}/mod:/go/mod:Z" \
    -v "${HOME}/.cache:/var/cache" \
    -v "$(pwd):/tmp/project" \
    -w "/tmp/project" \
    --network host \
    nafigat0r/golangci-lint:2.5.0 run
```
