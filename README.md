# Dockerized LLVM 10 for Ubuntu 20.04 LTS

This Docker image, based on Ubuntu 20.04, contains the following components:

1. LLVM 10.0.1 (Binaries and development headers are installed at `/llvm`; the source code of LLVM can be found at `/llvm-src`)
2. Flex 2.6.4
3. Bison 3.5.1
4. GCC, G++ 9.3.0

## Filesystem

In addition to common files,

- `/llvm` : Binaries and development headers are installed here
- `/llvm-src` : Source code of LLVM

## Customization

- Default locale: `zh_CN.UTF-8`
- `/llvm/bin` is included in `PATH`
- `vim`, `nano` installed by default

## Usage

### Docker Concepts

- Image: an executable
- Container: a process (but you can stop it and resume it at any time)

### Fetch image

```
docker pull ksqsf/llvm
```

Consider using [USTC Mirrors](https://mirrors.ustc.edu.cn/help/dockerhub.html).

### Start a new container

```
docker run     \
  --name $NAME \
  -v $HOST_DIR:$DOCKER_PATH \
  -it ksqsf/llvm
```

- `$HOST_DIR` must be absolute. Consider using `realpath`.
- Since `--rm` is not present, after you exit, the container will not be deleted. Check its existence with `docker ps -a` or `docker container ls -a` (it doesn't display stopped containers without `-a`).

### Restart a container

```
docker start -ai $NAME
```
