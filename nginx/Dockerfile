FROM nginx

RUN rm /etc/nginx/conf.d/default.conf

COPY nginx.conf /etc/nginx/nginx.conf

COPY run.sh run.sh

COPY shelf2.conf /tmp/shelf2.conf.template
COPY main.conf /tmp/main.conf.template
COPY images.conf /tmp/images.conf.template

RUN mkdir /etc/nginx/sites-enabled
