# Supported tags and respective `Dockerfile` links
-	[`7.2-slim` (*7.2-slim/Dockerfile*)](https://github.com/nafigator/docker-library/blob/master/php/7.2-slim/Dockerfile)

# How to use this image
### Create a `Dockerfile`

Suggested path for `Dockerfile` - `build/php`
```dockerfile
FROM nafigat0r/php:7.2

ARG DEBIAN_FRONTEND=noninteractive
ARG USER_ID
ARG USER_PASSWORD
ARG USER_NAME

RUN groupadd -g ${USER_ID} ${USER_NAME} \
    && useradd -u ${USER_ID} -g ${USER_NAME} -p ${USER_PASSWORD} -b /var/www/html -d /var/www ${USER_NAME} \
    && usermod -aG sudo ${USER_NAME} \
    && chown -R ${USER_ID}:${USER_ID} /run/php /var/www/.composer

# Change locale
#RUN sed -i -e "s/# ru_RU.UTF-8 UTF-8/ru_RU.UTF-8 UTF-8/" /etc/locale.gen \
#    && dpkg-reconfigure locales \
#    && update-locale LANG=ru_RU.UTF-8

# ENV LANG ru_RU.UTF-8

# Change the docker default timezone from UTC to MSK
#RUN echo "Europe/Moscow" > /etc/timezone \
#    && dpkg-reconfigure tzdata

USER ${USER_NAME}
```

### Create a `docker-compose.yml`

Suggested path for `docker-compose.yml` root of your project.
```yaml
version: '3.6'
services:
  php:
    build:
      context: build/php
      args:
        - USER_ID=1000
        - USER_NAME=username
        - USER_PASSWORD=password
    volumes:
      - ./:/var/www/html/
    restart: unless-stopped
```

`USER_ID` value must be equals to user `UID` of your host machine.

### Xdebug setup (optional)
If you want to debug using FPM SAPI:
```bash
docker-compose exec -u0 php ln -s /etc/php/7.2/mods-available/xdebug.ini /etc/php/7.2/fpm/conf.d/20-xdebug.ini
```
If you want to debug using CLI SAPI:
```bash
docker-compose exec -u0 php ln -s /etc/php/7.2/mods-available/xdebug.ini /etc/php/7.2/cli/conf.d/20-xdebug.ini
```

Than add ini-settings to `99-custom.ini`
```ini
xdebug.remote_host = 192.168.100.100
xdebug.remote_enable = 1
```
`xdebug.remote_host` - host machine IP

### Build and run container
```bash
docker-compose build --force-rm
docker-compose up -d --remove-orphans
```
### Extending PHP configuration

Create new volume in `docker-compose.yml` like this:
```yaml
    volumes:
      - ./:/var/www/html/
      - ./custom.ini:/etc/php/7.2/fpm/conf.d/99-custom.ini
```
