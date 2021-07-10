# Supported tags and respective `Dockerfile` links
-	[`2.1.3, latest` (*latest/Dockerfile*)](https://github.com/nafigator/docker-library/blob/master/composer/2.1.3/Dockerfile)

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
    image: nafigat0r/composer:2.1.3
    environment:
      - HOME=/var/www
      - SSH_AUTH_SOCK=/ssh-auth.sock
    volumes:
      - ./:/var/www/html/
      - /etc/passwd:/etc/passwd:ro
      - /etc/group:/etc/group:ro
      - ${SSH_AUTH_SOCK}:/ssh-auth.sock
      - ${HOME}/.cache/composer:/var/www/.cache/composer
      - ${HOME}/.ssh/config:/etc/ssh/ssh_config:ro
      - ${HOME}/.ssh/known_hosts:/etc/ssh/ssh_known_hosts:ro
    user: ${UID}:${UID}
    restart: unless-stopped
```

### Manual run
```bash
docker run --user $(id -u):$(id -g) \
	--volume /etc/passwd:/etc/passwd:ro \
	--volume /etc/group:/etc/group:ro \
	--volume $SSH_AUTH_SOCK:/ssh-auth.sock \
	--volume $HOME/.cache/composer/:/var/www/.cache/composer \
	--volume $HOME/.ssh/config:/etc/ssh/ssh_config \
	--volume $HOME/.ssh/known_hosts:/etc/ssh/ssh_known_hosts:ro \
	--env SSH_AUTH_SOCK=/ssh-auth.sock \
	--env HOME=/var/www \
	--rm -t nafigat0r/composer:2.1.3 \
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
