# import {
#   id = "monitoring[monitor]"
#   to = sonarqube_group_member.monitoring_monitor
# }


# import {
#   id = "portfolio-administrators[portfolio-admin]"
#   to = sonarqube_group_member.portfolio_administrators_portfolio_admin
# }


# import {
#   id = "sonar-administrators[admin]"
#   to = sonarqube_group_member.sonar_administrators_admin
# }


# import {
#   id = "sonar-administrators[elefevre]"
#   to = sonarqube_group_member.sonar_administrators_elefevre
# }


# import {
#   id = "sonar-administrators[paulo97772]"
#   to = sonarqube_group_member.sonar_administrators_paulo97772
# }

# # __generated__ by Terraform
# # Please review these resources and move them into your main configuration files.

# # __generated__ by Terraform from "sonar-administrators[admin]"
# resource "sonarqube_group_member" "sonar_administrators_admin" {
#   login_name = "admin"
#   name       = "sonar-administrators"
# }

# # __generated__ by Terraform from "monitoring[monitor]"
# resource "sonarqube_group_member" "monitoring_monitor" {
#   login_name = "monitor"
#   name       = "monitoring"
# }

# # __generated__ by Terraform from "sonar-administrators[paulo97772]"
# resource "sonarqube_group_member" "sonar_administrators_paulo97772" {
#   login_name = "paulo97772"
#   name       = "sonar-administrators"
# }

# # __generated__ by Terraform from "sonar-administrators[elefevre]"
# resource "sonarqube_group_member" "sonar_administrators_elefevre" {
#   login_name = "elefevre"
#   name       = "sonar-administrators"
# }

# # __generated__ by Terraform from "portfolio-administrators[portfolio-admin]"
# resource "sonarqube_group_member" "portfolio_administrators_portfolio_admin" {
#   login_name = "portfolio-admin"
#   name       = "portfolio-administrators"
# }
