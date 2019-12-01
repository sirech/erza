FROM nginx:alpine

RUN rm /etc/nginx/conf.d/default.conf

COPY nginx.conf /etc/nginx/nginx.conf
COPY security-headers.conf /etc/nginx/security-headers.conf

COPY run.sh run.sh

COPY shelf2.conf /tmp/shelf2.conf.template
COPY cookery2.conf /tmp/cookery2.conf.template
COPY echo.conf /tmp/echo.conf.template
COPY main.conf /tmp/main.conf.template
COPY images.conf /tmp/images.conf.template

RUN mkdir /etc/nginx/sites-enabled

RUN adduser -D runner

USER runner
