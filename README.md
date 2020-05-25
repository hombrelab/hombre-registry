# hombre-registry
![Docker Pulls](https://img.shields.io/docker/pulls/hombrelab/hombre-registry) ![Docker Image Version (latest by date)](https://img.shields.io/docker/v/hombrelab/hombre-registry) ![GitHub commit activity](https://img.shields.io/github/last-commit/hombrelab/hombre-registry)  

The [hombre-registry](https://hub.docker.com/repository/docker/hombrelab/hombre-registry) image is based on the [official Docker Registry image](https://hub.docker.com/_/registry).  

Includes:
- linux packages: bash, nano, ca-certificates.  

Deployment examples:

Command line
```shell script
docker run \
    --name docker-registry \
    --detach \
    --restart unless-stopped \
    --volume /home/data/docker-registry:/var/lib/registry \
    --volume /home/data/docker-registry/auth:/auth \
    --volume /home/data/docker-registry/config.yaml:/etc/docker/registry/config.yml \
    --volume /etc/timezone:/etc/timezone:ro \
    --volume /etc/localtime:/etc/localtime:ro \
    --publish 5000:5000 \
    hombrelab/hombre-registry
```
Docker Compose
```yaml
  docker-registry:
    container_name: docker-registry
    restart: unless-stopped
    image: hombrelab/hombre-registry
    volumes:
      - /home/data/docker-registry:/var/lib/registry
      - /home/data/docker-registry/auth:/auth
      - /home/data/docker-registry/config.yaml:/etc/docker/registry/config.yml
      - /etc/timezone:/etc/timezone:ro
      - /etc/localtime:/etc/localtime:ro
    ports:
      - 5000:5000
```

Delete an image
```shell script
# delete image folder
sudo rm -r /home/data/docker-registry/docker/registry/v2/repositories/image-name
# enter into the running image
docker exec -it docker-registry /bin/bash
# garbage collect the delete image
/bin/registry garbage-collect --dry-run /etc/docker/registry/config.yml
```
**REMARK**
The first deployment of the new image will probably not work.