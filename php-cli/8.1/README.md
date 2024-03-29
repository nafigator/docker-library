# Supported tags and respective `Dockerfile` links
-	[`7.2` (*7.2/Dockerfile*)](https://github.com/nafigator/docker-library/blob/master/php-cli/7.2/Dockerfile)
-	[`7.3` (*7.3/Dockerfile*)](https://github.com/nafigator/docker-library/blob/master/php-cli/7.3/Dockerfile)
-	[`7.4` (*7.4/Dockerfile*)](https://github.com/nafigator/docker-library/blob/master/php-cli/7.4/Dockerfile)
-	[`8.0` (*8.0/Dockerfile*)](https://github.com/nafigator/docker-library/blob/master/php-cli/8.0/Dockerfile)
-	[`8.1` (*8.1/Dockerfile*)](https://github.com/nafigator/docker-library/blob/master/php-cli/8.1/Dockerfile)

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
  php:
    image: nafigat0r/php-cli:8.1
    user: ${UID}:${UID}
    command: script.php
    volumes:
      - ./:/var/www/html/
    restart: unless-stopped
```

Than add ini-settings to `override.ini`
```ini
xdebug.remote_host = 192.168.100.100
xdebug.remote_enable = 1
```
`xdebug.remote_host` - host machine IP

### Build and run container
```bash
docker-compose build --force-rm --no-cache --pull
docker-compose up -d --remove-orphans
```
### Extending PHP configuration

Create new volume in `docker-compose.yml` like this:
```yaml
    volumes:
      - ./override.ini:/etc/php/8.1/fpm/conf.d/zz-override.ini
```

### Change locale and timezone

Create Dockerfile:
```dockerfile
FROM nafigat0r/php-cli:8.1

# Change locale
RUN sed -i -e "s/# ru_RU.UTF-8 UTF-8/ru_RU.UTF-8 UTF-8/" /etc/locale.gen \
    && DEBIAN_FRONTEND=noninteractive dpkg-reconfigure locales \
    && update-locale LANG=ru_RU.UTF-8

ENV LANG ru_RU.UTF-8

# Change the docker default timezone from UTC to MSK
RUN echo "Europe/Moscow" > /etc/timezone \
    && DEBIAN_FRONTEND=noninteractive dpkg-reconfigure tzdata
```

# Waiting for other container

```bash
command: wait-for rabbitmq:5432 -- script.php
```
