resource "auth0_client" "cookery2-frontend" {
  name        = "cookery2-frontend"
  description = "Cookery2 Application - Terraform generated"
  app_type    = "spa"
  callbacks   = ["http://localhost:3003/callback", "https://${local.cookery2_host}/callback"]
  web_origins = ["http://localhost:3003", "https://${local.cookery2_host}"]

  oidc_conformant = true

  grant_types = [
    "authorization_code",
    "refresh_token",
  ]

  jwt_configuration {
    alg = "RS256"
  }
}

resource "auth0_client" "cookery2-frontend-test" {
  name        = "cookery2-frontend-test"
  description = "Cookery2 Application (Test) - Terraform generated"
  app_type    = "non_interactive"
}

resource "auth0_client_credentials" "cookery2-frontend-test" {
  client_id             = auth0_client.cookery2-frontend-test.id
  authentication_method = "client_secret_post"
}

resource "auth0_client_grant" "cookery2-frontend-test" {
  client_id = auth0_client.cookery2-frontend-test.id
  audience  = auth0_resource_server.cookery2-backend.identifier
  scopes    = []
}

resource "auth0_resource_server" "cookery2-backend" {
  name             = "cookery2-backend"
  identifier       = local.cookery2_host
  signing_alg      = "RS256"
  enforce_policies = true

  token_lifetime         = 86400
  token_lifetime_for_web = 7200

  skip_consent_for_verifiable_first_party_clients = true
}

resource "auth0_resource_server_scopes" "cookery2-backend" {
  resource_server_identifier = auth0_resource_server.cookery2-backend.identifier

  scopes {
    name        = "create:recipes"
    description = "Can create a recipe"
  }
}

resource "auth0_role" "cookery2-editor" {
  name = "Cookery2 - Editor"
}

resource "auth0_role_permissions" "cookery2-editor" {
  role_id = auth0_role.cookery2-editor.id

  permissions {
    name                       = "create:recipes"
    resource_server_identifier = auth0_resource_server.cookery2-backend.identifier
  }
}
