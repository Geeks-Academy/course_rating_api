FROM nginx:1.10-alpine

ADD './nginx.conf' '/etc/nginx/nginx.conf'

WORKDIR '/var/www'

RUN mkdir -p /var/www/logs