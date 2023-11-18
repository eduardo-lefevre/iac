# resource "sonarqube_permissions" "global_user_jenkins" {
#     login_name  = "jenkins"
#     permissions = ["provisioning", "scan"]
# }

# resource "sonarqube_permissions" "global_group_portfolio_administrators" {
#     group_name  = "portfolio-administrators"
#     permissions = ["applicationcreator", "gateadmin", "portfoliocreator", "profileadmin", "provisioning", "scan"]
# }

# resource "sonarqube_permissions" "global_group_sonar_administrators" {
#     group_name  = "sonar-administrators"
#     permissions = ["admin", "applicationcreator", "gateadmin", "portfoliocreator", "profileadmin", "provisioning", "scan"]
# }
