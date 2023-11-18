resource "sonarqube_permissions" "global_group_sonar_administrators" {
    group_name  = "sonar-administrators"
    permissions = ["admin", "applicationcreator", "gateadmin", "portfoliocreator", "profileadmin", "provisioning"]
}

resource "sonarqube_permissions" "global_group_sonar_users" {
    group_name  = "sonar-users"
    permissions = ["provisioning", "scan"]
}
