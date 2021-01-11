variable "vultr_api_key" {
  description = "The API Key to interact with Vultr. Beware of IP restrictions"
}

variable "region" {
  default = "ams"
}

variable "instance_type" {
  default = "vc2-1c-1gb"
}
