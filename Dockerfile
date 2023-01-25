FROM node:18.11.0

WORKDIR /app
COPY ./src/package*.json ./
RUN npm install
COPY ./src .
EXPOSE 3000

CMD ["node", "server.js"]