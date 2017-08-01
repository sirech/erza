## Installation Guide

### Required packages

these packages are needed in the main host:

    yum install git
    yum install epel-release
    yum install -y python-pip
    pip install docker-compose
    
    
### Setting up the repository

download the repo and set it up:

    git clone https://github.com/sirech/erza.git
    cd erza
    git submodule init
    git submodule update
   
After this, the `.env.example` file should be copied to `.env`. Adapt the values
there.

## Running the server

### First run

Before running `docker-compose` for the first time, do:

    docker-compose run shelf rake db:create
    docker-compose run shelf rake db:migrate
    
### Running

    docker-compose up -d
