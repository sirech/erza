resource "auth0_client" "grafana-frontend" {
  name        = "grafana"
  description = "Grafana - Terraform generated"
  app_type    = "regular_web"
  callbacks   = ["https://${local.grafana_host}/login/generic_oauth"]
  web_origins = ["https://${local.grafana_host}"]
}

resource "auth0_role" "grafana-user" {
  name = "Grafana - User"
}

resource "auth0_rule" "grafana-drop-unauthorized" {
  name = "grafana-drop-unauthorized"
  script = templatefile("${path.module}/drop-unauthorized-grafana.js", {
    application : auth0_client.grafana-frontend.name,
    role : auth0_role.grafana-user.name
  })

  enabled = true
}

output "grafana-client-id" {
  value = auth0_client.grafana-frontend.client_id
}

output "grafana-client-secret" {
  value     = auth0_client.grafana-frontend.client_secret
  sensitive = true
}
