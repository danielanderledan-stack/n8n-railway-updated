FROM n8nio/n8n:latest

USER root

# allow Code nodes to require jsdom (static-site fuser)
RUN cd /usr/local/lib/node_modules/n8n && npm install jsdom@26 --omit=dev --no-audit --no-fund
