FROM n8nio/n8n:latest

USER root

# Install python + pip
RUN apk add --no-cache python3 py3-pip


USER node
