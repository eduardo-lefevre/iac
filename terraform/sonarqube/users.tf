# Please run this before applying the change:
# terraform import -var-file=sonarqube.tfvars sonarqube_user.admin admin
# --------------------------------
# This is not possible, because it tries to recreate the user,
# but SQ doesn't allow that, giving this error:
# Error: error deleting (deactivating) Sonarqube user: API returned an error: Self-deactivation is not possible
# resource "sonarqube_user" "admin" {
#   login_name = "admin"
#   name       = "SonarQube Administrator"
#   password   = var.admin_password
# }

resource "sonarqube_user" "superuser" {
  login_name = "superuser"
  name       = "Safeguard Admin User"
  password   = var.admin_password
}

# resource "sonarqube_user" "saml_user" {
#   login_name = "saml-user"
#   name       = "SAML User"
#   is_local   = false
# }

## Need to configure saml first
# resource "sonarqube_user_external_identity" "saml_user" {
#   login_name        = sonarqube_user.saml_user.login_name
#   external_identity = "saml.user@invalid.email.com"
#   external_provider = "saml"
# }
