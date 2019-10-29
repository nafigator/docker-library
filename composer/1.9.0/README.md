# Supported tags and respective `Dockerfile` links
-	[`1.9.0` (*latest/Dockerfile*)](https://github.com/nafigator/docker-library/blob/master/composer/1.9.0/Dockerfile)
-	[`latest` (*latest/Dockerfile*)](https://github.com/nafigator/docker-library/blob/master/composer/latest/Dockerfile)

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
  composer:
    image: nafigat0r/composer:1.9.0
    environment:
      - SSH_AUTH_SOCK
      - HOME=/var/www
    volumes:
      - ./:/var/www/html/
      - /etc/passwd:/etc/passwd:ro
      - /etc/group:/etc/group:ro
      - ${SSH_AUTH_SOCK}:${SSH_AUTH_SOCK}
    user: ${UID}:${UID}
    restart: unless-stopped
```

### Manual run
```bash
docker run --user $(id -u):$(id -g) \
	--volume /etc/passwd:/etc/passwd:ro \
	--volume /etc/group:/etc/group:ro \
	--volume $SSH_AUTH_SOCK:/ssh-auth.sock \
	--env SSH_AUTH_SOCK=/ssh-auth.sock \
	--env HOME=/var/www \
	--rm -t nafigat0r/composer:latest \
	diagnose
```

### Build and run container
```bash
docker-compose build --force-rm --no-cache --pull
docker-compose up -d --remove-orphans
```

### Composer
Outside container usage:
```bash
docker-compose exec composer diagnose
```
Inside container usage:
```bash
docker-compose exec composer bash
composer diagnose
```

### Extending PHP configuration

Create new volume in `docker-compose.yml` like this:
```yaml
    volumes:
      - ./override.ini:/etc/php/7.3/cli/conf.d/zz-override.ini
```
