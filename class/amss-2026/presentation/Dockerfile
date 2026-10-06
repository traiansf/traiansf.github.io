FROM node:24-alpine
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm ci --omit=dev
COPY server.mjs ./
COPY dist ./dist
ENV HOST=0.0.0.0 PORT=3000
EXPOSE 3000
USER node
CMD ["node", "server.mjs"]
