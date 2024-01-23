FROM node:alpine

WORKDIR /app

COPY . .

EXPOSE 3000

USER 10001

RUN apk update && apk upgrade &&\
    apk add --no-cache openssl curl gcompat iproute2 coreutils &&\
    chmod +x index.js server swith web tunnel.yml tunnel.json &&\
    npm install

CMD ["node", "index.js"]
