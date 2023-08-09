FROM nginx:latest
USER root

RUN apt-get update && \
apt-get install -y gcc spawn-fcgi libfcgi-dev vim

COPY ./server/mini_server.c /mini_server.c
COPY ./server/nginx.conf /etc/nginx/nginx.conf
COPY ./server/start.sh /start.sh

RUN chmod +x ./start.sh

ENTRYPOINT ["sh", "./start.sh"]
