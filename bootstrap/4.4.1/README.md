##Tools for building Twitter Boostrap

# Supported tags and respective `Dockerfile` links
-	[`4.4.1` (*4.4.1/Dockerfile*)](https://github.com/nafigator/docker-library/blob/master/bootstrap/4.4.1/Dockerfile)

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
  bootstrap:
    image: nafigat0r/bootstrap:4.4.1
    user: ${UID}:${UID}
    command: ['npm', 'run', 'dist']
    environment:
      - HOME=/var/www/html
    volumes:
      - ./lib/bootstrap:/var/www/html
```
### Run container via docker-compose
```bash
docker-compose up -d --remove-orphans
```
