# erza

Setting up a complete server

## Pre-requisites

- `ssh` connection to the server needs to be possible, and aliased to `erza`.
- `ruby` needs to be installed ([version](./ruby-version))

## Server

### Provisioning

It is done with [itamae](https://github.com/itamae-kitchen/itamae). Can be run with

```
itamae/run
```

to fully provision everything, certain files need to be accessible:

- `.env`: variables used by `docker-compose`
- `authorized_keys`: deployment user
- `cert`: Existing certificates (letsencrypt)

### ServerSpec tests

The test suite for the remote server can be run with

```
bundle install
rake
```

## Applications

### Restoring an application

TODO: right now it's a bit manual, using the pipeline is the best bet

### Backup

See [the backup script](./bin/backup) is used for the DBs mainly
    
### Serving a new subdomain

Everything is parametrized using [gomplate](https://docs.gomplate.ca/). Adding a new domain should require minimal effort, basicallly a variable for the `server_name`. If there is a backend it will need extending the [docker-compose configuration](./docker-compose.yml).

In order to serve a new subdomain using https, we need to complete the challenge from the `certbot`. The call that we are aiming to make from the server looks like this:

```
docker run -it --rm -v /cert:/etc/letsencrypt -v /srv/${subdomain}_public:/var/www deliverous/certbot certonly --webroot -d ${subdomain}.${domain} --register-unsafely-without-email --agree-tos -w /var/www
```

The configuration needs to be started in two steps: First the http part, then the https once we have a certificate.
