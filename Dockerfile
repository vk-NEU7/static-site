# syntax=docker/dockerfile:1
FROM caddy:latest

# Copy the index.html file to the appropriate directory
COPY index.html /opt

# Copy the caddy config
COPY Caddyfile /etc/caddy/Caddyfile

# Expose port 80
EXPOSE 80