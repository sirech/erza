## Installation Guide

    bash <(curl -s https://raw.githubusercontent.com/sirech/erza/master/bin/install)

## Running the server

### First run

Before running `docker-compose` for the first time, do:

    docker-compose run shelf2 rake db:create
    docker-compose run shelf2 rake db:migrate
    
### Running

    docker-compose up -d
    
## Data

### Backup of the database

    docker exec db mysqldump -u root --password=PASSWORD shelf2_production > backup.sql

### Restore existing database

    cat backup.sql | docker exec -i db mysql -u root --password=PASSWORD shelf2_production

