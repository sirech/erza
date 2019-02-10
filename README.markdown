## Installation Guide

    bash <(curl -s https://raw.githubusercontent.com/sirech/erza/master/bin/install)

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
    
## Serving a new https subdomain

In order to serve a new subdomain using https, we need to complete the challenge from the `certbot`. The call that we are aiming to make from the server looks like this:

```
docker run -it --rm -v /cert:/etc/letsencrypt -v /srv/${subdomain}_public:/var/www deliverous/certbot certonly --webroot -d ${subdomain}.${domain} --register-unsafely-without-email --agree-tos -w /var/www
```

we need to do some preparations:

- the folder has to be created
- `nginx` needs a temporary configuration to serve static files:

```nginx
server {
    listen *;
    server_name ${DOMAIN_HOST};

    location / {
      root /srv/${subdomain}_public;
    }
 }
```

- the domain has to be passed to the `nginx` container through the `environment`
- the folder needs to be mounted so that `nginx` can serve it.

```yaml
    volumes:
      - "/srv/${subdomain}_public:/srv/${subdomain}_public:ro"
```

all this code can be removed after creating the certificate if we are not serving static assets in the new subdomain. After this, the renew will happen based on the stored certificate automatically.



