# vultr

This is a configuration for [vultr](https://www.vultr.com/), managed through [terraform](https://www.terraform.io/).

## Setup

The state is stored remotely. To set up credentials, check [this](https://learn.hashicorp.com/terraform/getting-started/remote.html#how-to-store-state-remotely).

The variables defined in the [variables.tf](./variables.tf) file can be fetched from the remote state.

## Usage

Run `./go`

## Modules

- [machines](./machines): Provision new instances
- [dns](./dns): Set DNS routing to point to these instances, plus some extra settings for mail and similar
