terraform {
  required_providers {
    auth0 = {
      source  = "auth0/auth0"
      version = "~> 1.1.1"
    }
  }
}

provider "auth0" {
  domain        = var.auth0_domain
  client_id     = var.auth0_client_id
  client_secret = var.auth0_client_secret
}
