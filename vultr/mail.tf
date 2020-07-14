locals {
  mail_sub_domains = {
    "alt1.aspmx.l.google.com" = 5,
    "alt2.aspmx.l.google.com" = 5,
    "aspmx.l.google.com"      = 1,
    "aspmx2.googlemail.com"   = 10,
    "aspmx3.googlemail.com"   = 10,
  }
}

resource "vultr_dns_record" "mail_cname" {
  domain = vultr_dns_domain.domain.id
  name   = "mail"
  data   = "ghs.google.com"
  type   = "CNAME"

  ttl = local.ttl
}

resource "vultr_dns_record" "mail_subdomain" {
  for_each = local.mail_sub_domains

  domain = vultr_dns_domain.domain.id
  name   = ""
  data   = each.key
  type   = "MX"

  ttl      = local.ttl
  priority = each.value
}

resource "vultr_dns_record" "mail_site_verification" {
  domain = vultr_dns_domain.domain.id
  name   = ""
  data   = var.site_verification
  type   = "TXT"

  ttl = local.ttl
}

resource "vultr_dns_record" "mail_spf1" {
  domain = vultr_dns_domain.domain.id
  name   = ""
  data   = "\"v=spf1 include:aspmx.googlemail.com ~all\""
  type   = "TXT"

  ttl = local.ttl
}
