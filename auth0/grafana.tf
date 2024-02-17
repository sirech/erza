resource "auth0_client" "grafana-frontend" {
  name        = "grafana"
  description = "Grafana - Terraform generated"
  app_type    = "regular_web"
  callbacks   = ["https://${local.grafana_host}/login/generic_oauth"]
  web_origins = ["https://${local.grafana_host}"]
}

resource "auth0_client_credentials" "grafana-frontend" {
  client_id             = auth0_client.grafana-frontend.id
  authentication_method = "client_secret_post"
}

resource "auth0_role" "grafana-user" {
  name = "Grafana - User"
}

resource "auth0_action" "grafana-drop-unauthorized" {
  name    = "grafana-drop-unauthorized"
  runtime = "node18"

  deploy = true
  code = templatefile("${path.module}/drop-unauthorized-grafana.js", {
    application : auth0_client.grafana-frontend.name,
    role : auth0_role.grafana-user.name
  })

  supported_triggers {
    id      = "post-login"
    version = "v3"
  }
}

resource "auth0_trigger_action" "grafana-drop-unauthorized" {
  trigger   = "post-login"
  action_id = auth0_action.grafana-drop-unauthorized.id
}

output "grafana-client-id" {
  value = auth0_client.grafana-frontend.client_id
}

output "grafana-client-secret" {
  value     = auth0_client_credentials.grafana-frontend.client_secret
  sensitive = true
}
