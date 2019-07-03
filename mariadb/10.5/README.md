# Supported tags and respective `Dockerfile` links
-	[`10.5` (*10.5/Dockerfile*)](https://github.com/nafigator/docker-library/blob/master/mariadb/10.5/Dockerfile)

# How to use this image

### Create a `docker-compose.yml`

Suggested path for `docker-compose.yml` root of your project.
```yaml
version: '3.6'
services:
  mariadb:
    restart: unless-stopped
    image: mariadb:10.1
    environment:
      MYSQL_DATABASE: db_name
      MYSQL_RANDOM_ROOT_PASSWORD: 1
      MYSQL_USER: user
      MYSQL_PASSWORD: password
    ports:
      - 3306:3306
    container_name: mariadb
    volumes:
      - mysqldata:/var/lib/mysql
      - ./mariadb/:/docker-entrypoint-initdb.d/

volumes:
  mysqldata:
    driver: local
    name: local_mysqldata
```

### Build and run container
```bash
docker-compose build --force-rm --no-cache --pull
docker-compose up -d --remove-orphans
```
