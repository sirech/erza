terraform {
  backend "remote" {
    organization = "sirech"

    workspaces {
      name = "vultr"
    }
  }
}
