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
export UID=$(id -u)
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

### Run via docker
```bash
docker run -u "$(id -u):$(id -g)" --rm \
    -e HOME=/var/www/html \
    -v $(pwd)/lib/bootstrap:/var/www/html \
    -it nafigat0r/bootstrap:4.4.1 npm install

docker run -u "$(id -u):$(id -g)" --rm \
    -e HOME=/var/www/html \
    -e GEM_HOME=/var/www/html/.gem \
    -e GEM_PATH=/var/www/html/.gem \
    -e PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/var/www/html/.gem/bin \
    -v $(pwd)/lib/bootstrap:/var/www/html \
    -it nafigat0r/bootstrap:4.4.1 gem install bundler:1.17.3

docker run -u "$(id -u):$(id -g)" --rm \
    -e HOME=/var/www/html \
    -e GEM_HOME=/var/www/html/.gem \
    -e GEM_PATH=/var/www/html/.gem \
    -e PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/var/www/html/.gem/bin \
    -v $(pwd)/lib/bootstrap:/var/www/html \
    -it nafigat0r/bootstrap:4.4.1 bundle install

docker run -u "$(id -u):$(id -g)" --rm \
    -e HOME=/var/www/html \
    -e GEM_HOME=/var/www/html/.gem \
    -e GEM_PATH=/var/www/html/.gem \
    -e PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/var/www/html/.gem/bin \
    -v $(pwd)/lib/bootstrap:/var/www/html \
    -it nafigat0r/bootstrap:4.4.1 npm run dist

# Build documentation
docker run -u "$(id -u):$(id -g)" --rm \
    -e HOME=/var/www/html \
    -e GEM_HOME=/var/www/html/.gem \
    -e GEM_PATH=/var/www/html/.gem \
    -e PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/var/www/html/.gem/bin \
    -v $(pwd)/lib/bootstrap:/var/www/html \
    -it nafigat0r/bootstrap:4.4.1 npm run docs

# Run documentation on http://localhost:9001
docker run -u "$(id -u):$(id -g)" --rm \
    -e HOME=/var/www/html \
    -e GEM_HOME=/var/www/html/.gem \
    -e GEM_PATH=/var/www/html/.gem \
    -e PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/var/www/html/.gem/bin \
    -v $(pwd)/lib/bootstrap:/var/www/html \
    -it -p 9001:9001 nafigat0r/bootstrap:4.4.1 bundle exec jekyll serve --host 0.0.0.0 --incremental --skip-initial-build --no-watch
```
