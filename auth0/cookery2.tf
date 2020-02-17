resource "auth0_client" "cookery2-frontend" {
  name        = "cookery2-frontend-stuff"
  description = "Cookery2 Application - Terraform generated"
  app_type    = "spa"
  callbacks   = ["http://localhost:3003/callback", "https://${local.cookery2_host}/callback"]
  web_origins = ["https://${var.auth0_domain}"]

  oidc_conformant = true

  jwt_configuration {
    alg = "RS256"
  }
}

resource "auth0_client" "cookery2-frontend-test" {
  name        = "cookery2-frontend-stuff-test"
  description = "Cookery2 Application (Test) - Terraform generated"
  app_type    = "non_interactive"

  token_endpoint_auth_method = "client_secret_post"
}

resource "auth0_client_grant" "cookery2-frontend-test" {
  client_id = "${auth0_client.cookery2-frontend-test.id}"
  audience  = "${auth0_resource_server.cookery2-backend.identifier}"
  scope     = []
}

resource "auth0_resource_server" "cookery2-backend" {
  name        = "cookery2-backend-stuff"
  identifier  = "temp.${local.cookery2_host}"
  signing_alg = "RS256"

  token_lifetime         = 86400
  token_lifetime_for_web = 7200

  skip_consent_for_verifiable_first_party_clients = true

  scopes {
    value       = "create:recipes"
    description = "Can create a recipe"
  }
}
