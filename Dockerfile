FROM n8nio/n8n:latest

USER root

# Install Python and build dependencies
RUN apk add --no-cache \
    python3 \
    py3-pip \
    build-base \
    musl-dev \
    libffi-dev \
    gcc \
    g++ \
    make \
    jpeg-dev \
    zlib-dev \
    freetype-dev \
    tcl-dev \
    tk-dev && \
    python3 -m ensurepip && \
    pip3 install --upgrade pip && \
    pip3 install matplotlib && \
    apk del build-base gcc g++ make

USER node
