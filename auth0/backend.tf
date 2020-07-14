terraform {
  backend "remote" {
    organization = "sirech"

    workspaces {
      name = "auth0"
    }
  }
}
