data "vultr_instance" "natsu" {
  filter {
    name   = "label"
    values = ["natsu"]
  }
}

data "vultr_instance" "erza" {
  filter {
    name   = "label"
    values = ["erza"]
  }
}
