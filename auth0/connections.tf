resource "auth0_connection" "google" {
  name     = "google"
  strategy = "google-oauth2"

  # basic profile
  # extended profile
  # sync user profile attributes at each login
}

resource "auth0_connection_clients" "google" {
  connection_id = auth0_connection.google.id

  enabled_clients = [
    auth0_client.cookery2-frontend.id,
    auth0_client.shelf2-frontend.id,
    auth0_client.grafana-frontend.id
  ]
}
