# Versions
Go 1.24.3

# Supported tags and respective `Dockerfile` links
-	[`1.24.3` (*1.24.3/Dockerfile*)](https://github.com/nafigator/docker-library/blob/master/golang/1.24.3/Dockerfile)
-	[`1.24.1` (*1.24.1/Dockerfile*)](https://github.com/nafigator/docker-library/blob/master/golang/1.24.1/Dockerfile)
-	[`1.23.4` (*1.23.4/Dockerfile*)](https://github.com/nafigator/docker-library/blob/master/golang/1.23.4/Dockerfile)
-	[`1.20.6` (*1.20.6/Dockerfile*)](https://github.com/nafigator/docker-library/blob/master/golang/1.20.6/Dockerfile)
-	[`1.19.4` (*1.19.3/Dockerfile*)](https://github.com/nafigator/docker-library/blob/master/golang/1.19.4/Dockerfile)
-	[`1.19.3` (*1.19.3/Dockerfile*)](https://github.com/nafigator/docker-library/blob/master/golang/1.19.3/Dockerfile)

# How to use this image
### Run container via docker
```bash
$ docker run --user $(id -u):$(id -g) --rm -ti nafigat0r/go:1.24.3 version
```
### Work inside container
```bash
$ docker run -ti --rm --user "$(id -u):$(id -g)" \
    --entrypoint=/bin/bash \
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
    nafigat0r/go:1.24.3
```
