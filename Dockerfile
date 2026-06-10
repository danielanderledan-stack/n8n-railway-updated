FROM n8nio/n8n:latest

USER root

# jsdom for Code nodes (static-site fuser); installed globally because the
# n8n package dir uses pnpm catalog: refs that npm cannot re-resolve.
RUN npm install -g jsdom@26 --omit=dev --no-audit --no-fund

# cd-fuser: the static-site fuser (prerender/fuse.cjs) baked in as a global
# module so Code nodes can require('cd-fuser'). Redeploy this service to
# pick up a newer fuse.cjs from GitHub.
ADD https://raw.githubusercontent.com/danielanderledan-stack/Website/claude/elegant-maxwell-THblU/prerender/fuse.cjs /usr/local/lib/node_modules/cd-fuser/index.js
RUN printf '{"name":"cd-fuser","version":"1.0.0","main":"index.js"}' > /usr/local/lib/node_modules/cd-fuser/package.json && chmod -R a+r /usr/local/lib/node_modules/cd-fuser
