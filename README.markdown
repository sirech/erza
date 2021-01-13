# erza

Setting up a complete server infrastructure

## Pre-requisites

- `ruby` needs to be installed ([version](./ruby-version))
- `packer`
- `vagrant`

## Server

### Snapshots

Provisioning is done by creating snapshots with [packer](https://www.packer.io/). The targets that launch the process are:

```
./go install-plugin # Installs required plugin first
./go snapshot-{erza,natsu}
```

The server is set up with [ansible](https://www.ansible.com/), with the following [playbooks](./playbooks). There are two servers being provisioned, with the server-specific configuration in the following folders:

- [erza](./erza)
- [natsu](./natsu)

to fully provision everything, certain files need to be accessible:

- `.env`: variables used by `docker-compose`
- `authorized_keys`: deployment user
- `cert`: Existing certificates (letsencrypt)

### Provisioning

The provisioning of the actual servers uses [terraform](https://www.terraform.io/), through different modules. It's all in [this](./vultr) folder.

## Testing

### Local VM

[vagrant](https://www.vagrantup.com/) VMs are available to test things locally first. The hosts can be provisioned with:

```
./go vagrant-{erza,natsu}
```

These VMs are locally accessible through `ssh` and mirror the result of the snapshot.

### Automated tests

[ServerSpec](https://serverspec.org/) is used for automated testing. Both the local setup and the remote server can be tested.

```
rake spec:{natsu,erza} # Remote
rake spec:{natsu,erza}-vagrant # Local
```

## Auth0

See [auth0](./auth0)

## Applications

### Restoring an application

TODO: right now it's a bit manual, using the pipeline is the best bet

### Backup

See [the backup script](./bin/backup) is used for the DBs mainly
    
### Serving a new subdomain

Everything is parametrized using [gomplate](https://docs.gomplate.ca/). Adding a new domain should require minimal effort, basicallly a variable for the `server_name`. If there is a backend it will need extending the [docker-compose configuration](./erza/docker-compose.yml).

In order to serve a new subdomain using https, we need to complete the challenge from the `certbot`. The call that we are aiming to make from the server looks like this:

```
docker run -it --rm -v /cert:/etc/letsencrypt -v /srv/${subdomain}_public:/var/www deliverous/certbot certonly --webroot -d ${subdomain}.${domain} --register-unsafely-without-email --agree-tos -w /var/www
```

The configuration needs to be started in two steps: First the http part, then the https once we have a certificate.
