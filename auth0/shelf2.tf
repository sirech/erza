resource "auth0_client" "shelf2-frontend" {
  name        = "shelf2-frontend"
  description = "Shelf2 Application - Terraform generated"
  app_type    = "spa"
  callbacks   = ["http://localhost:3000/callback", "https://${local.shelf2_host}/callback"]
  web_origins = ["http://localhost:3000", "https://${local.shelf2_host}"]

  oidc_conformant = true

  grant_types = [
    "authorization_code",
    "refresh_token",
  ]

  jwt_configuration {
    alg = "RS256"
  }
}

resource "auth0_client" "shelf2-frontend-test" {
  name        = "shelf2-frontend-test"
  description = "Shelf2 Application (Test) - Terraform generated"
  app_type    = "non_interactive"
}

resource "auth0_client_credentials" "shelf2-frontend-test" {
  client_id             = auth0_client.shelf2-frontend-test.id
  authentication_method = "client_secret_post"
}

resource "auth0_client_grant" "shelf2-frontend-test" {
  client_id = auth0_client.shelf2-frontend-test.id
  audience  = auth0_resource_server.shelf2-backend.identifier
  scopes    = []
}

resource "auth0_resource_server" "shelf2-backend" {
  name             = "shelf2-backend"
  identifier       = local.shelf2_host
  signing_alg      = "RS256"
  enforce_policies = true

  token_lifetime         = 86400
  token_lifetime_for_web = 7200

  skip_consent_for_verifiable_first_party_clients = true

}

resource "auth0_resource_server_scopes" "shelf2-backend" {
  resource_server_identifier = auth0_resource_server.shelf2-backend.identifier

  scopes {
    name        = "create:books"
    description = "Can create a book"
  }
}

resource "auth0_role" "shelf2-editor" {
  name = "Shelf2 - Editor"
}

resource "auth0_role_permissions" "shelf2-editor" {
  role_id = auth0_role.shelf2-editor.id

  permissions {
    name                       = "create:books"
    resource_server_identifier = auth0_resource_server.shelf2-backend.identifier
  }
}
