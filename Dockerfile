FROM python:3.11-alpine

# Install Node.js and npm
RUN apk add --no-cache nodejs npm

# Install system dependencies for Python libraries
RUN apk add --no-cache \
    gcc \
    musl-dev \
    linux-headers \
    freetype-dev \
    libpng-dev \
    jpeg-dev \
    zlib-dev \
    openblas-dev \
    lapack-dev

# Install Python libraries
RUN pip install --no-cache-dir \
    matplotlib \
    numpy \
    pandas \
    scipy \
    seaborn \
    plotly \
    requests \
    beautifulsoup4 \
    openpyxl \
    pillow \
    lxml \
    python-dateutil \
    pytz \
    scikit-learn

# Install n8n
RUN npm install -g n8n

# Set environment variables
ENV MPLBACKEND=Agg
ENV PYTHONUNBUFFERED=1

# Create user
RUN addgroup -g 1000 node && \
    adduser -u 1000 -G node -s /bin/sh -D node

USER node
WORKDIR /home/node

EXPOSE 5678
CMD ["n8n"]
