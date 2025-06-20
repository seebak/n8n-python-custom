# Use official n8n image as base
FROM n8nio/n8n:latest

# Install Python and pip
USER root

RUN apt-get update && \
    apt-get install -y python3 python3-pip && \
    pip3 install --no-cache-dir matplotlib pandas

# Optional: Set a working directory for Python scripts
RUN mkdir -p /data/scripts && \
    chown -R node:node /data/scripts

# Switch back to non-root user
USER node

# Expose port
EXPOSE 5678
