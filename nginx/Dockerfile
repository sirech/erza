FROM nginx:alpine

RUN apk add --no-cache gomplate

RUN rm /etc/nginx/conf.d/default.conf

COPY nginx.conf /etc/nginx/nginx.conf
COPY conf/*.conf /etc/nginx/

COPY run.sh .

COPY templates /tmp/templates

RUN mkdir /etc/nginx/sites-enabled
