# Supported tags and respective `Dockerfile` links
-	[`7.2` (*7.2/Dockerfile*)](https://github.com/nafigator/docker-library/blob/master/composer/1.8.0/Dockerfile)

# How to use this image
### Create a `Dockerfile`

Suggested path for `Dockerfile` - `build/php`
```dockerfile
FROM nafigat0r/php-cli:7.2

ARG USER_NAME

RUN chown -R ${USER_NAME}:${USER_NAME} /run/php /var/www/.composer

# Change locale
#RUN sed -i -e "s/# ru_RU.UTF-8 UTF-8/ru_RU.UTF-8 UTF-8/" /etc/locale.gen \
#    && DEBIAN_FRONTEND=noninteractive dpkg-reconfigure locales \
#    && update-locale LANG=ru_RU.UTF-8

# ENV LANG ru_RU.UTF-8

# Change the docker default timezone from UTC to MSK
#RUN echo "Europe/Moscow" > /etc/timezone \
#    && DEBIAN_FRONTEND=noninteractive dpkg-reconfigure tzdata

USER ${USER_NAME}
```

### Create a `docker-compose.yml`

Suggested path for `docker-compose.yml` root of your project.
```yaml
version: '3.6'
services:
  composer:
    environment:
      - SSH_AUTH_SOCK
    build:
      context: .docker/composer
    volumes:
      - ./:/var/www/html/
      - /etc/passwd:/etc/passwd:ro
      - /etc/group:/etc/group:ro
      - ${SSH_AUTH_SOCK}:/ssh-auth.sock
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
	--rm -t nafigat0r/composer:1.8.0 --no-ansi
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
      - ./override.ini:/etc/php/7.2/cli/conf.d/zz-override.ini
```
