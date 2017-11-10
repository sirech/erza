FROM mysql:5.6

RUN apt-get update && apt-get install -qq -y ca-certificates wget --fix-missing --no-install-recommends
RUN wget https://releases.hashicorp.com/envconsul/0.7.2/envconsul_0.7.2_linux_amd64.tgz && tar -zxvf envconsul_*.tgz && rm envconsul_*.tgz && ln -sf $PWD/envconsul /usr/bin
