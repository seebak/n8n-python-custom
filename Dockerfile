FROM n8nio/n8n:latest

USER root

# Update package index and install system dependencies
RUN apk update && apk add --no-cache \
    python3 \
    python3-dev \
    py3-pip \
    gcc \
    musl-dev \
    linux-headers \
    freetype-dev \
    libpng-dev \
    jpeg-dev \
    zlib-dev \
    openblas-dev \
    lapack-dev \
    gfortran \
    pkgconfig \
    g++

# Create symbolic link for python
RUN ln -sf python3 /usr/bin/python

# Upgrade pip using python module
RUN python3 -m pip install --upgrade pip

# Install wheel first for better compatibility
RUN python3 -m pip install wheel

# Install Python libraries in smaller batches to avoid memory issues
RUN python3 -m pip install numpy==1.24.3

RUN python3 -m pip install \
    matplotlib==3.7.2 \
    pandas==2.0.3 \
    scipy==1.11.1

RUN python3 -m pip install \
    seaborn==0.12.2 \
    plotly==5.15.0 \
    requests==2.31.0

RUN python3 -m pip install \
    beautifulsoup4==4.12.2 \
    openpyxl==3.1.2 \
    pillow==10.0.0 \
    lxml==4.9.3

RUN python3 -m pip install \
    python-dateutil==2.8.2 \
    pytz==2023.3 \
    scikit-learn==1.3.0

# Set matplotlib backend to Agg (non-interactive) for headless environment
ENV MPLBACKEND=Agg
ENV PYTHONUNBUFFERED=1

# Clean up
RUN apk del gcc musl-dev linux-headers python3-dev g++ gfortran && \
    rm -rf /var/cache/apk/*

USER node

EXPOSE 5678
