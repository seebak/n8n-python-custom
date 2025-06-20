FROM docker.n8n.io/n8nio/n8n:latest
USER root
RUN apt-get update && apt-get install -y python3 python3-pip && apt-get clean && rm -rf /var/lib/apt/lists/*
USER node
