FROM alpine:latest

RUN apk add --no-cache git nodejs npm
RUN adduser --system --disabled-password --uid 10000 --shell /bin/sh sillytavern
COPY files/sillytavern.sh /usr/libexec/sillytavern.sh
COPY files/start.sh /usr/libexec/start.sh

USER sillytavern
WORKDIR /home/sillytavern
RUN mkdir /home/sillytavern/userdata
RUN git clone --branch=release https://github.com/SillyTavern/SillyTavern ./app

WORKDIR /home/sillytavern/app
RUN npm install --no-audit
COPY files/whitelist.txt whitelist.txt
COPY files/config.yaml config.yaml

USER root
CMD ["/usr/libexec/start.sh"]
