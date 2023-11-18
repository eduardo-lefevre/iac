import {
  id = "AYhOOat2ldTlkWPd86zc"
  to = sonarqube_group.sonar_administrators
}


import {
  id = "AYhOOat3ldTlkWPd86zd"
  to = sonarqube_group.sonar_users
}


import {
  id = "AYsq6qpujVxmbgG13ueg"
  to = sonarqube_group.team_users
}

# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform from "AYhOOat3ldTlkWPd86zd"
resource "sonarqube_group" "sonar_users" {
  description = "Every authenticated user automatically belongs to this group"
  name        = "sonar-users"
}

# __generated__ by Terraform from "AYsq6qpujVxmbgG13ueg"
resource "sonarqube_group" "team_users" {
  description = "This is a generic group created for Terraform testing and modified by me"
  name        = "team-users"
}

# __generated__ by Terraform from "AYhOOat2ldTlkWPd86zc"
resource "sonarqube_group" "sonar_administrators" {
  description = "System administrators"
  name        = "sonar-administrators"
}
