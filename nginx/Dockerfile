FROM nginx

COPY run.sh run.sh
COPY nginx.conf /etc/nginx/nginx.conf
COPY shelf2.conf /tmp/shelf2.conf.template

RUN mkdir /etc/nginx/sites-enabled
