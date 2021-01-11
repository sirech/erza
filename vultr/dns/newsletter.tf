resource "vultr_dns_record" "newsletter_domainkey" {
  domain = vultr_dns_domain.domain.id
  name   = "cka._domainkey"
  data   = "dkim.${var.ck_id}.sg.convertkit.com"
  type   = "CNAME"

  ttl = local.ttl
}

resource "vultr_dns_record" "newsletter_espa" {
  domain = vultr_dns_domain.domain.id
  name   = "ckespa"
  data   = "spf.${var.ck_id}.sg.convertkit.com"
  type   = "CNAME"

  ttl = local.ttl
}
