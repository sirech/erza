terraform {
  required_providers {
    vultr = {
      source  = "vultr/vultr"
      version = "~> 2.0.0"
    }
  }
}

provider "vultr" {
  api_key    = var.vultr_api_key
  rate_limit = 2000
}
