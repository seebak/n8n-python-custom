# Use official n8n image (Alpine-based)
FROM n8nio/n8n:latest

USER root

# Install Python and required packages
RUN apk update && \
    apk add --no-cache python3 py3-pip gcc musl-dev python3-dev libffi-dev && \
    pip3 install --no-cache-dir matplotlib pandas

# Optional folders for your scripts/output
RUN mkdir -p /data/scripts /data/chart_output && \
    chown -R node:node /data

USER node

# Expose default n8n port
EXPOSE 5678
