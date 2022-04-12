variable "vultr_api_key" {
  description = "The API Key to interact with Vultr. Beware of IP restrictions"
}

variable "domain" {
  description = "The main domain without subdomains"
}

variable "alternate_domain" {
  description = "The alternate domain without subdomains"
}

variable "cani_domain" {
  description = "The netlify domain hosting cani"
}

variable "site_verification" {
  description = "The verification string for gmail"
}

variable "ck_id" {
  description = "The id for convertkit"
}

variable "gh_verification_domain" {
  description = "GH domain"
}

variable "gh_verification_code" {
  description = "GH code"
}

variable "gh_ips" {
  description = "IPs for GH"
}
