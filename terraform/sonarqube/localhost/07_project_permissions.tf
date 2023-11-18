################################################################
## Project: Go (org.elefevre:go)
################################################################

resource "sonarqube_permissions" "go_user_user" {
    login_name  = "user"
    project_key = "org.elefevre:go"
    permissions = ["codeviewer", "scan", "user"]
}

resource "sonarqube_permissions" "go_group_sonar_users" {
    group_name  = "sonar-users"
    project_key = "org.elefevre:go"
    permissions = ["codeviewer", "issueadmin", "securityhotspotadmin", "user"]
}

resource "sonarqube_permissions" "go_group_team_users" {
    group_name  = "team-users"
    project_key = "org.elefevre:go"
    permissions = ["admin", "codeviewer", "issueadmin", "scan", "securityhotspotadmin", "user"]
}

################################################################
## Project: IaC Projects (org.elefevre:iac)
################################################################

resource "sonarqube_permissions" "iac_projects_user_eduardo_lefevre" {
    login_name  = "eduardo.lefevre"
    project_key = "org.elefevre:iac"
    permissions = ["issueadmin", "securityhotspotadmin"]
}

resource "sonarqube_permissions" "iac_projects_group_sonar_users" {
    group_name  = "sonar-users"
    project_key = "org.elefevre:iac"
    permissions = ["issueadmin", "securityhotspotadmin"]
}
