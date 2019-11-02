# Versions
Node 13.0.1

Yarn 1.19.1

# Supported tags and respective `Dockerfile` links
-	[`13` (*13/Dockerfile*)](https://github.com/nafigator/docker-library/blob/master/node/13/Dockerfile)
-	[`12` (*12/Dockerfile*)](https://github.com/nafigator/docker-library/blob/master/node/12/Dockerfile)
-	[`11` (*11/Dockerfile*)](https://github.com/nafigator/docker-library/blob/master/node/11/Dockerfile)
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
    image: nafigat0r/node:13
    user: ${UID}:${UID}
    command: ["node", "script.js"]
    volumes:
      - ./:/var/www/html/
    restart: unless-stopped
```
### Run container via docker-compose
```bash
docker-compose up -d --remove-orphans
```

### Run container via docker
```bash
docker run --user $(id -u):$(id -g) --rm -ti nafigat0r/node:13 --version
docker run --user $(id -u):$(id -g) --rm -ti nafigat0r/node:13 yarn --version
```
