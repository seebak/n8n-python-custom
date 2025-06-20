FROM n8nio/n8n:latest

USER root

# Install system dependencies for matplotlib and other libraries
RUN apk add --no-cache \
    python3 \
    py3-pip \
    python3-dev \
    gcc \
    musl-dev \
    linux-headers \
    freetype-dev \
    libpng-dev \
    jpeg-dev \
    zlib-dev \
    tk-dev \
    tcl-dev

# Create symbolic link for python
RUN ln -sf python3 /usr/bin/python

# Upgrade pip
RUN pip3 install --upgrade pip

# Install common data science libraries
RUN pip3 install \
    matplotlib==3.7.2 \
    numpy==1.24.3 \
    pandas==2.0.3 \
    scipy==1.11.1 \
    seaborn==0.12.2 \
    plotly==5.15.0 \
    scikit-learn==1.3.0 \
    requests==2.31.0 \
    beautifulsoup4==4.12.2 \
    openpyxl==3.1.2 \
    pillow==10.0.0 \
    lxml==4.9.3 \
    python-dateutil==2.8.2 \
    pytz==2023.3

# Set matplotlib backend to Agg (non-interactive) for headless environment
ENV MPLBACKEND=Agg

USER node
