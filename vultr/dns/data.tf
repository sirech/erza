data "vultr_instance" "natsu" {
  filter {
    name   = "label"
    values = ["natsu"]
  }
}