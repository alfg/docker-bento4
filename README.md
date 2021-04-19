# docker-bento4
A Bento4  Dockerfile built from source. Built on Alpine Linux.

* https://www.bento4.com/

[![Docker Stars](https://img.shields.io/docker/stars/alfg/bento4.svg)](https://hub.docker.com/r/alfg/bento4/)
[![Docker Pulls](https://img.shields.io/docker/pulls/alfg/bento4.svg)](https://hub.docker.com/r/alfg/bento4/)
[![Docker Automated build](https://img.shields.io/docker/automated/alfg/bento4.svg)](https://hub.docker.com/r/alfg/bento4/builds/)
[![Build Status](https://travis-ci.org/alfg/docker-bento4.svg?branch=master)](https://travis-ci.org/alfg/docker-bento4)

## Usage

* Pull Docker image and run:
```
docker pull alfg/bento4
docker run -it --rm alfg/bento4 mp4info
```

* or build and run container from source:

```
docker build -t bento4 .
docker run -it bento4 mp4info
```

* or use as a base image in your Dockerfile:
```
FROM alfg/bento4:latest
```

* Example using a mounted volume:
```
docker run -v ${PWD}:/opt/tmp/ -it --rm alfg/bento4 mp4info /opt/tmp/video.mp4
```

## Resources
* https://alpinelinux.org/
* https://www.bento4.com/

## License
MIT