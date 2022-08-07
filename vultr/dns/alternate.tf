resource "vultr_dns_domain" "alternate_domain" {
  domain  = var.alternate_domain
  dns_sec = "disabled"
}

resource "vultr_dns_record" "alternate_domain_main" {
  for_each = toset(var.gh_ips)

  domain = vultr_dns_domain.alternate_domain.id
  name   = ""
  data   = each.value
  type   = "A"

  ttl = local.ttl
}

resource "vultr_dns_record" "alternate_domain_cname" {
  domain = vultr_dns_domain.alternate_domain.id
  name   = "www"
  data   = var.gh_domain
  type   = "CNAME"

  ttl = local.ttl
}

resource "vultr_dns_record" "alternate_gh_verification" {
  domain = vultr_dns_domain.alternate_domain.id
  name   = var.gh_verification_domain
  data   = var.gh_alternate_verification_code
  type   = "TXT"

  ttl = local.ttl
}