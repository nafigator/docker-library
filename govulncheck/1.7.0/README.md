# Versions
Govulncheck 1.7.0

# Supported tags and respective `Dockerfile` links
-	[`1.7.0` (*1.7.0/Dockerfile*)](https://github.com/nafigator/docker-library/blob/master/govulncheck/1.7.0/Dockerfile)
-	[`1.6.0` (*1.6.0/Dockerfile*)](https://github.com/nafigator/docker-library/blob/master/govulncheck/1.6.0/Dockerfile)
-	[`1.1.4` (*1.1.4/Dockerfile*)](https://github.com/nafigator/docker-library/blob/master/govulncheck/1.1.4/Dockerfile)

# How to use this image
### Run container via docker
```bash
$ docker run --user $(id -u):$(id -g) --rm -ti \
    -e XDG_CACHE_HOME=/var/cache \
    -v $HOME/.cache:/var/cache \
    -v "$(pwd):/var/govulncheck" \
    nafigat0r/govulncheck:1.7.0 -show verbose ./...
```
