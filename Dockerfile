FROM ghcr.io/sillytavern/sillytavern:latest

RUN adduser --system --disabled-password --no-create-home --uid 10000 --shell /bin/sh sillytavern

COPY files/init.sh /usr/libexec/init.sh

USER root
WORKDIR /home/node/app
CMD ["/usr/libexec/init.sh"]
