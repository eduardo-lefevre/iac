resource "sonarqube_group" "team-users" {
  description = "This is a generic group created for Terraform testing and modified by me"
  name        = "team-users"
}

resource "sonarqube_group_member" "team-users_saml-user" {
  login_name = "saml-user"
  name       = "team-users"
}

resource "sonarqube_group_member" "team-users_user" {
  login_name = "user"
  name       = "team-users"
}

resource "sonarqube_group_member" "sonar-administrators_admin" {
  login_name = "admin"
  name       = "sonar-administrators"
}
