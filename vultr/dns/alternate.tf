resource "vultr_dns_domain" "alternate" {
  domain  = var.alternate_domain
  dns_sec = "disabled"
}

resource "vultr_dns_record" "alternate_main" {
  domain = vultr_dns_domain.alternate.id
  name   = ""
  data   = data.vultr_instance.natsu.main_ip
  type   = "A"

  ttl = local.ttl
}

resource "vultr_dns_record" "alternate_cname" {
  domain = vultr_dns_domain.alternate.id
  name   = "*"
  data   = var.alternate_domain
  type   = "CNAME"

  ttl = local.ttl
}

resource "vultr_dns_record" "alternate_mx" {
  domain = vultr_dns_domain.alternate.id
  name   = ""
  data   = var.alternate_domain
  type   = "MX"

  ttl      = local.ttl
  priority = local.priority
}
