# Supported tags and respective `Dockerfile` links
-	[`3.6.1` (*3.6.1/Dockerfile*)](https://github.com/nafigator/docker-library/blob/master/sassc/3.6.1/Dockerfile)

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
  sassc:
    image: nafigat0r/sassc:3.6.1
    user: ${UID}:${UID}
    command: ['sassc', 'source.scss', 'styles.css']
    volumes:
      - ./:/var/www/html/
    restart: unless-stopped
```
### Run container
```bash
docker-compose run --rm sassc
```

# Examples
```bash
docker run --rm -t nafigat0r/sassc:3.6.1 --version
docker run --rm -t nafigat0r/sassc:3.6.1 --help
docker run --user $(id -u):$(id -g) \
    --rm -t nafigat0r/sassc:3.6.1 source.scss styles.css
```
