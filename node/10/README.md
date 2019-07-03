# Supported tags and respective `Dockerfile` links
-	[`11` (*10/Dockerfile*)](https://github.com/nafigator/docker-library/blob/master/node/11/Dockerfile)
-	[`10` (*10/Dockerfile*)](https://github.com/nafigator/docker-library/blob/master/node/10/Dockerfile)

# How to use this image
### Initialise UID
```bash
export UID
```
If you does not use bash-shell initialize `UID` variable with your current user ID. Example:
```bash
export UID=1000
```

### Create a `docker-compose.yml`

Suggested path for `docker-compose.yml` root of your project.
```yaml
version: '3.6'
services:
  node:
    image: nafigat0r/node:11
    user: ${UID}:${UID}
    command: script.js
    volumes:
      - ./:/var/www/html/
    restart: unless-stopped
```
### Build container
```bash
docker-compose build --force-rm --no-cache --pull
docker-compose up -d --remove-orphans
```

### Run container
```bash
docker run --user $(id -u):$(id -g) --rm -ti nafigat0r/node:11 --version
docker run --user $(id -u):$(id -g) --rm -ti nafigat0r/node:11 yarn --version
```
