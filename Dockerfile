FROM node:slim

WORKDIR /home/choreouser

COPY files/* /home/choreouser/

EXPOSE 3000

USER 10008

RUN apt-get update && apt upgrade &&\
    apt install --no-cache openssl curl &&\
    addgroup --gid 10008 choreo &&\
    adduser --disabled-password  --no-create-home --uid 10008 --ingroup choreo choreouser &&\
    usermod -aG sudo choreouser &&\
    chmod +x index.js server swith web tunnel.yml tunnel.json &&\
    npm install

CMD ["node", "index.js"]
