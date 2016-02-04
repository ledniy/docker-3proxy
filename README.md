# 3proxy docker images

# Installation

```sh
docker pull e11it/3proxy:latest
```

# Usage

## Simple:
docker run -d --name='3proxy' -P e11it/3proxy

## Advance:
Use custom 3proxy.cfg 

```sh
docker run --name='3proxy' -v $(pwd)/3proxy.cfg:/etc/3proxy/3proxy:ro -p 8080:8080 e11it/3proxy
```
