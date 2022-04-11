locals {
  sub_domains = toset(["cookery2", "echo", "shelf2", "grafana"])
}

resource "vultr_dns_domain" "domain" {
  domain  = var.domain
  dns_sec = "disabled"
}

resource "vultr_dns_record" "domain_main" {
  domain = vultr_dns_domain.domain.id
  name   = ""
  data   = data.vultr_instance.natsu.main_ip
  type   = "A"

  ttl = local.ttl
}

resource "vultr_dns_record" "domain_cname" {
  domain = vultr_dns_domain.domain.id
  name   = "*"
  data   = var.domain
  type   = "CNAME"

  ttl = local.ttl
}

resource "vultr_dns_record" "domain_subdomain" {
  for_each = local.sub_domains

  domain = vultr_dns_domain.domain.id
  name   = each.value
  data   = data.vultr_instance.erza.main_ip
  type   = "A"

  ttl = local.ttl
}

resource "vultr_dns_record" "domain_cname_cani" {
  domain = vultr_dns_domain.domain.id
  name   = "cani"
  data   = var.cani_domain
  type   = "CNAME"

  ttl = local.ttl
}

resource "vultr_dns_record" "gh_verification" {
  domain = vultr_dns_domain.domain.id
  name   = var.gh_verification_domain
  data   = var.gh_verification_code
  type   = "TXT"

  ttl = local.ttl
}
