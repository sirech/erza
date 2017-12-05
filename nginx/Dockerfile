FROM nginx

RUN apt-get update && apt-get install -qq -y ca-certificates wget --fix-missing --no-install-recommends
RUN wget https://releases.hashicorp.com/envconsul/0.7.2/envconsul_0.7.2_linux_amd64.tgz && tar -zxvf envconsul_*.tgz && rm envconsul_*.tgz && ln -sf $PWD/envconsul /usr/bin

RUN rm /etc/nginx/conf.d/default.conf

COPY nginx.conf /etc/nginx/nginx.conf

COPY run.sh run.sh

COPY shelf2.conf /tmp/shelf2.conf.template
COPY main.conf /tmp/main.conf.template
COPY images.conf /tmp/images.conf.template

RUN mkdir /etc/nginx/sites-enabled
