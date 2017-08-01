FROM nginx

COPY run.sh run.sh
COPY nginx.conf /etc/nginx/nginx.conf
COPY shelf.conf /tmp/shelf.conf.template

RUN mkdir /etc/nginx/sites-enabled
