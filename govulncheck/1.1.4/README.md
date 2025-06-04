# Versions
Govulncheck 1.1.4

# Supported tags and respective `Dockerfile` links
-	[`1.1.4` (*1.1.4/Dockerfile*)](https://github.com/nafigator/docker-library/blob/master/govulncheck/1.1.4/Dockerfile)

# How to use this image
### Run container via docker
```bash
$ docker run --user $(id -u):$(id -g) --rm -ti \
    -e XDG_CACHE_HOME=/var/cache \
    -v $HOME/.cache:/var/cache \
    -v "$(pwd):/var/govulncheck" \
    nafigat0r/govulncheck:1.1.4 -show verbose ./...
```
