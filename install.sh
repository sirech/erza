#!/usr/bin/env bash

# Install libraries
yum install -y git
yum install -y epel-release
yum install -y python-pip
pip install docker-compose

# Set up configuration
git clone https://github.com/sirech/erza.git
cd erza
git submodule init
git submodule update
