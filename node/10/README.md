# Supported tags and respective `Dockerfile` links
-	[`10` (*10/Dockerfile*)](https://github.com/nafigator/docker-library/blob/master/node/10/Dockerfile)

# How to use this image
### Create a `Dockerfile`

Suggested path for `Dockerfile` - `build/node`
```dockerfile
FROM nafigat0r/node:10

ARG DEBIAN_FRONTEND=noninteractive
ARG USER_ID
ARG USER_PASSWORD
ARG USER_NAME

RUN groupadd -g ${USER_ID} ${USER_NAME} \
    && useradd -u ${USER_ID} -g ${USER_NAME} -p ${USER_PASSWORD} -b /var/www/html -d /var/www ${USER_NAME} \
    && usermod -aG sudo ${USER_NAME} \
    && mkdir /var/www/.cache /var/www/.npm /var/www/.config /var/www/.yarn \
    && touch /var/www/.yarnrc \
    && chown -R ${USER_ID}:${USER_ID} /var/www/.yarnrc /var/www/.cache /var/www/.npm /var/www/.config /var/www/.yarn

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
  node:
    build:
      context: build/node
      args:
        - USER_ID=1000
        - USER_NAME=username
        - USER_PASSWORD=password
    volumes:
      - ./:/var/www/html/
```

`USER_ID` value must be equals to user `UID` of your host machine.

### Build and run container
```bash
docker-compose build --force-rm --no-cache --pull
docker-compose up -d --remove-orphans
```
