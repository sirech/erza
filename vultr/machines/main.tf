data "vultr_snapshot" "natsu-snapshot" {
  filter {
    name   = "description"
    values = ["Snapshot - natsu"]
  }
}

resource "vultr_instance" "natsu" {
  plan        = var.instance_type
  region      = var.region
  snapshot_id = data.vultr_snapshot.natsu-snapshot.id

  hostname = "natsu"
  label    = "natsu"
}
