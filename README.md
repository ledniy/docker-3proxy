# 3proxy docker images

# Installation

```sh
docker pull e11it/docker-3proxy:latest
```

# Usage

## Simple:

```sh
docker run -d --name='3proxy' -P e11it/docker-3proxy
```

## Advance:
Use custom 3proxy.cfg 

```sh
docker run --name='3proxy' -v $(pwd)/3proxy.cfg:/etc/3proxy/3proxy:ro -p 8080:8080 e11it/docker-3proxy
```

# Example docker-compose.yml

```yml
3proxy:
  image: e11it/docker-3proxy:latest
  container_name: 3proxy
  restart: always
  ports:
    - 8080:8080
    - 3128:3128
  volumes:
    - ./3proxy.cfg:/etc/3proxy/3proxy.cfg:ro

```
