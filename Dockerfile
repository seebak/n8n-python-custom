FROM n8nio/n8n:latest

USER root

# Install python + pip
RUN apk add --no-cache python3 py3-pip

# Copy your script into /mnt/data and fix permissions
COPY generate_chart.py /mnt/data/generate_chart.py
RUN chown node:node /mnt/data/generate_chart.py && chmod 644 /mnt/data/generate_chart.py

USER node
