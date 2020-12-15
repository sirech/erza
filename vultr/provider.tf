provider "vultr" {
  version = "~> 1.5.0"

  api_key    = var.vultr_api_key
  rate_limit = 2000
}
