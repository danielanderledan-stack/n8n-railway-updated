FROM n8nio/n8n:latest

USER root

# jsdom for Code nodes (static-site fuser); installed globally because the
# n8n package dir uses pnpm catalog: refs that npm cannot re-resolve.
# /usr/local/lib/node_modules is on n8n's require() resolution path.
RUN npm install -g jsdom@26 --omit=dev --no-audit --no-fund
