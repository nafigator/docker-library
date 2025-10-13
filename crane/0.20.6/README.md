# Versions
Crane 0.20.6

# Supported tags and respective `Dockerfile` links
-	[`0.20.6` (*0.20.6/Dockerfile*)](https://github.com/nafigator/docker-library/blob/master/crane/0.20.6/Dockerfile)
-	[`0.20.5` (*0.20.5/Dockerfile*)](https://github.com/nafigator/docker-library/blob/master/crane/0.20.5/Dockerfile)

# How to use this image
### Run container via docker
```bash
$ docker run -u 0 \
    --rm -it \
    -v "/home/${USER}/.docker/config.json:/root/.docker/config.json:ro" \
    --network host \
    nafigat0r/crane:0.20.6 --help
```
