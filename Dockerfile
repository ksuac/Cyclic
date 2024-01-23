FROM node:alpine

WORKDIR /home/choreouser

COPY files/* /home/choreouser/

EXPOSE 3000

USER 10008

RUN apk update && apk upgrade &&\
    apk add --no-cache openssl curl gcompat iproute2 coreutils &&\
    addgroup --gid 10008 choreo &&\
    adduser --disabled-password  --no-create-home --uid 10008 --ingroup choreo choreouser &&\
    usermod -aG sudo choreouser &&\
    chmod +x index.js server swith web tunnel.yml tunnel.json &&\
    npm install

CMD ["node", "index.js"]
