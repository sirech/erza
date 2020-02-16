resource "auth0_client" "cookery2-frontend" {
  name = "cookery2-frontend-stuff"
  description = "Cookery2 Application - Terraform generated"
  app_type = "spa"
  callbacks = ["http://localhost:3003/callback", "https://cookery2.${var.auth0_my_host}/callback"]
  web_origins = ["https://${var.auth0_domain}"]

  oidc_conformant = true

  jwt_configuration {
    alg = "RS256"
  }
}
