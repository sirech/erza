data "vultr_instance" "erza" {
  filter {
    name   = "label"
    values = ["erza"]
  }
}
