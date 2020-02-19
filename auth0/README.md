# Auth0

This is an [auth0](https://auth0.com/) configuration to enable OAuth authz, managed through [terraform](https://www.terraform.io/).

## Setup

The state is stored remotely. To set up credentials, check [this](https://learn.hashicorp.com/terraform/getting-started/remote.html#how-to-store-state-remotely).

Additionally, some variables are expected to be available.

- auth0/client_id: Client_id of an API with access to the Auth0 Management API
- auth0/client_secret: The secret for the same API
- auth0/domain: The auth0 domain
- auth0/my_host: hostname of the target server (without subdomains)
