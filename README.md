# R10K

## Supported tags

* latest: last version build

## Usage

Run r10k

```sh
$ docker run -d \
    -e SSH_KEY='<SSH_KEY>' \
    -e TIMEOUT=300 \
    -v path/to/r10k.yaml:/etc/puppetlabs/r10k/r10k.yaml \
    t7k312/r10k
```

## docker-compose

```
version: '3.7'

services:

  r10k:
    image: t7k312/r10k
    hostname: r10k
    environment:
      - SSH_KEY=-----BEGIN OPENSSH PRIVATE KEY-----\nbAgEAr/pz+IfL9d9QDBLy0mDc/O8+TXQtd\n==\n-----END OPENSSH PRIVATE KEY-----
      - TIMEOUT=300
    volumes:
      - ./environments:/environments
      - ./r10k:/etc/puppetlabs/r10k
    restart: unless-stopped
```

## Configuration

Environment Configuration:

* SSH_KEY  - SSH-key for repo access
* TIMEOUT  - update timeoutin seconds (defaul:300)
