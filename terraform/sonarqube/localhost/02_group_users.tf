import {
  id = "sonar-administrators[admin]"
  to = sonarqube_group_member.sonar_administrators_admin
}


import {
  id = "team-users[saml-user]"
  to = sonarqube_group_member.team_users_saml_user
}


import {
  id = "team-users[user]"
  to = sonarqube_group_member.team_users_user
}

# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform from "team-users[saml-user]"
resource "sonarqube_group_member" "team_users_saml_user" {
  login_name = "saml-user"
  name       = "team-users"
}

# __generated__ by Terraform from "team-users[user]"
resource "sonarqube_group_member" "team_users_user" {
  login_name = "user"
  name       = "team-users"
}

# __generated__ by Terraform from "sonar-administrators[admin]"
resource "sonarqube_group_member" "sonar_administrators_admin" {
  login_name = "admin"
  name       = "sonar-administrators"
}
