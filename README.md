# 3proxy docker images

# Installation

```sh
docker pull qautomatron/docker-3proxy:latest
```

# Usage

## Simple:

```sh
docker run -d --name='3proxy' -P qautomatron/docker-3proxy
```

## Advance:
Use custom 3proxy.cfg 

```sh
docker run --name='3proxy' -v $(pwd)/3proxy.cfg:/etc/3proxy/3proxy:ro -p 8080:8080 qautomatron/docker-3proxy
```

# Example docker-compose.yml

```yml
3proxy:
  image: qautomatron/docker-3proxy:latest
  container_name: 3proxy
  restart: always
  ports:
    - 8080:8080
    - 3128:3128
  volumes:
    - ./3proxy.cfg:/etc/3proxy/3proxy.cfg:ro

```
