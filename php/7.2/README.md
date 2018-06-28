# Supported tags and respective `Dockerfile` links
-	[`7.2` (*7.2/Dockerfile*)](https://github.com/nafigator/docker-library/blob/master/php/7.2/Dockerfile)

# How to use this image
### Create a `Dockerfile`

Mentioned path for `Dockerfile` - `build/php`
```dockerfile
FROM nafigat0r/php:7.2

ARG USER_ID
ARG USER_PASSWORD
ARG USER_NAME
ARG XDEBUG_HOST

RUN groupadd -g ${USER_ID} ${USER_NAME} \
    && useradd -u ${USER_ID} -g ${USER_NAME} -p ${USER_PASSWORD} -b /var/www/html -d /var/www ${USER_NAME} \
    && usermod -aG sudo ${USER_NAME} \
    && chown ${USER_ID}:${USER_ID} /run/php /var/www/.composer \
    && echo "xdebug.remote_host = ${XDEBUG_HOST}\nxdebug.remote_enable = 1" >> /etc/php/7.2/mods-available/xdebug.ini

USER ${USER_NAME}
```

### Create a `docker-compose.yml`

Mentioned path for `docker-compose.yml` root of your project.
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

`USER_ID` value must be equals to user `GID` of your host machine.

### Xdebug setup (optional)
If you want to Xdebug using FPM SAPI:
```bash
docker-compose exec -u0 php ln -s /etc/php/7.2/mods-available/xdebug.ini /etc/php/7.2/fpm/conf.d/20-xdebug.ini
```
If you want to Xdebug using CLI SAPI:
```bash
docker-compose exec -u0 php ln -s /etc/php/7.2/mods-available/xdebug.ini /etc/php/7.2/cli/conf.d/20-xdebug.ini
```

Than create `docker-compose.override.yml` inside root of your project
```yml
version: '3.6'
services:
  php:
    build:
      args:
        - XDEBUG_HOST=172.16.32.59
```
`XDEBUG_HOST` - host machine IP
### Build and run container
```bash
docker-compose build --force-rm
docker-compose up -d --remove-orphans
```
