provider "vultr" {
  version = "~> 2.0.0"

  api_key    = var.vultr_api_key
  rate_limit = 2000
}
