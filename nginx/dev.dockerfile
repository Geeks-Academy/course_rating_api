FROM nginx:1.10-alpine

ADD './nginx.conf' '/etc/nginx/nginx.conf'

ARG USER_ID

WORKDIR '/var/www'

RUN mkdir -p /var/www/logs

RUN chown -R ${USER_ID}:nginx /var/www/logs && chown ${USER_ID}:nginx /var/www/logs

USER ${USER_ID}
