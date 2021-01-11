variable "vultr_api_key" {
  description = "The API Key to interact with Vultr. Beware of IP restrictions"
}

variable "domain" {
  description = "The main domain without subdomains"
}
variable "alternate_domain" {
  description = "The alternate domain without subdomains"
}
variable "server_ip" {
  description = "The IP of the server"
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
