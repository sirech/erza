terraform {
  backend "remote" {
    organization = "sirech"

    workspaces {
      name = "erza"
    }
  }
}
