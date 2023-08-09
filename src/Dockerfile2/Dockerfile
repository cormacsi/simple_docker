FROM nginx:latest

ARG USERNAME=nginx
USER root

COPY ./server/mini_server.c /home/$USERNAME/mini_server.c
COPY ./server/nginx.conf /etc/nginx/nginx.conf
COPY ./server/start.sh /home/$USERNAME/start.sh

RUN apt-get update && \
apt-get install -y gcc spawn-fcgi libfcgi-dev && \
apt-get clean && \
rm -rf /var/lib/apt/lists/*

WORKDIR /home/$USERNAME

RUN chown -R $USERNAME:$USERNAME /etc/nginx/nginx.conf && \
    chown -R $USERNAME:$USERNAME /var/run/ && \
    chown -R $USERNAME:$USERNAME /var/cache/nginx && \
    chown -R $USERNAME:$USERNAME /home/$USERNAME/ && \
    chmod +x /home/$USERNAME/start.sh && \
    chmod g-s /usr/bin/wall && \
    chmod g-s /sbin/unix_chkpwd && \
    chmod g-s /usr/bin/expiry && \
    chmod g-s /usr/bin/chage && \
    chmod u-s /usr/bin/chfn && \
    chmod u-s /usr/bin/passwd && \
    chmod u-s /bin/mount && \
    chmod u-s /bin/umount && \
    chmod u-s /usr/bin/chsh && \
    chmod u-s /usr/bin/newgrp && \
    chmod u-s /bin/su && \
    chmod u-s /usr/bin/gpasswd

USER $USERNAME

HEALTHCHECK --interval=30s --timeout=7s --retries=2 \
  CMD curl -f http://localhost/ || exit 1

ENTRYPOINT ["sh", "./start.sh"]
CMD ["nginx", "-g", "daemon off;"]
