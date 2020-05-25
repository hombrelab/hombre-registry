# Dockerfile: hombre-python

FROM registry

ARG version

LABEL version="${version}"
LABEL description="Customized Docker Registry image"
LABEL maintainer="Hombrelab <me@hombrelab.com>"
LABEL inspiration="getting things done my way"

RUN apk add --no-cache \
    bash \
    nano \
    ca-certificates
