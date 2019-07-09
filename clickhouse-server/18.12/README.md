# Supported tags and respective `Dockerfile` links
-	[`19` (*19/Dockerfile*)](https://github.com/nafigator/docker-library/blob/master/clickhouse-server/19/Dockerfile)
-	[`18.12` (*18.12/Dockerfile*)](https://github.com/nafigator/docker-library/blob/master/clickhouse-server/18.12/Dockerfile)

### Debian-based container for clickhouse listening 9888 port

# How to use this image
### Create a `docker-compose.yml`

Suggested path for `docker-compose.yml` root of your project.
```yaml
version: '3.6'
services:
    clickhouse-server:
      image: nafigat0r/clickhouse-server:19
      environment:
        DATABASE_NAME: db_name
        DATABASE_PORT: 9000
      networks:
        - network
      ports:
        - 9000:9000
      # init sql-files and custom config
      volumes:
        - ./clickhouse-server/19/conf.d:/etc/clickhouse-server/conf.d:ro
        - ./clickhouse-server/19/initdb.d:/docker-entrypoint-initdb.d
networks:
  network:
    driver: bridge
```
### Add initial sql-files
Put your sql-files to `initdb.d` dir.  Available formats:
`*.sql`
`*.sql.gz`
`*.csv`
`*.csv.gz`
### Override config settings
Put your custom config settings to `conf.d/overrides.xml` directory. Example:
```xml
<?xml version="1.0"?>
<yandex>
    <logger>
        <!-- Possible levels: https://github.com/pocoproject/poco/blob/develop/Foundation/include/Poco/Logger.h#L105 -->
        <level>information</level>
        <log>/proc/self/fd/2</log>
        <errorlog>/proc/self/fd/2</errorlog>
    </logger>
    <tcp_port>9888</tcp_port>
    <listen_host>0.0.0.0</listen_host>
</yandex>

```

### Build and run container
```bash
docker-compose build --force-rm --no-cache --pull
docker-compose up -d --remove-orphans
```

### Run client
```bash
docker run --user $(id -u):$(id -g) --rm -ti nafigat0r/clickhouse-server:19 client --port 9888
```
