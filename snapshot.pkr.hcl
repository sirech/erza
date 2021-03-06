variable "vultr_api_key" {
  type    = string
  default = env("VULTR_API_KEY")
}

variable "host" {
  type = string
  default = env("HOST")
}

source "vultr" "base-image" {
  api_key              = var.vultr_api_key
  os_id                = "387" // Ubuntu 20.04
  # plan_id              = "vc2-1c-1gb"
  # region_id            = "ams"
  plan_id = 201 // 1 core 1GB
  region_id = 7 // AMS
  snapshot_description = "Snapshot - ${var.host}"

  ssh_username = "root"
}

build {
  sources = ["source.vultr.base-image"]

  provisioner "ansible" {
    playbook_file = "playbook.yml"
    extra_arguments = [
      "--extra-vars", "host=${var.host}"
    ]
  }
}
