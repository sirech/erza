## Installation Guide

    bash <(curl -s https://raw.githubusercontent.com/sirech/erza/master/install.sh)

## Running the server

### Environment

`.env.example` file should be copied to `.env`. Adapt the values.

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

