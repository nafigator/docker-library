# Supported tags and respective `Dockerfile` links
-	[`18.12` (*18.12/Dockerfile*)](https://github.com/nafigator/docker-library/blob/master/clickhouse-server/18.12/Dockerfile)

### Debian-based container for clickhouse listening 9888 port

# How to use this image
### Create a `docker-compose.yml`

Suggested path for `docker-compose.yml` root of your project.
```yaml
version: '3.6'
services:
  clickhouse-server:
    image: nafigat0r/clickhouse-server:18.12
    networks:
      - network
    ports:
      - 9888:9888
networks:
  network:
    driver: bridge
```

### Build and run container
```bash
docker-compose build --force-rm
docker-compose up -d --remove-orphans
```

### Run client
```bash
docker-compose exec clickhouse-server clickhouse client --port 9888
```
