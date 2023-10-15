

#import {
#  id = "CLOUD"
#  to = sonarqube_portfolio.cloud
#}
#
#--------------

# Done
#import {
#  id = "org.elefevre:iac"
#  to = sonarqube_project.iac
#}

# Done
#import {
#  id = "org.elefevre:iac/main"
#  to = sonarqube_project_main_branch.iac-main
#}

# TODO Test ALM with Enterprise Edition and GitLab
#import {
#  id = "org.elefevre:iac/${var.org}/iac"
#  to = sonarqube_github_binding.achievement-service-github
#}

# import {
#   id = "AYsgFgdsjVxmbgG13ueS"
#   to = sonarqube_group.team-users
# }

# import {
#   id = "sonar-administrators[admin]"
#   to = sonarqube_group_member.sonar-administrators_admin
# }


# import {
#   id = "team-users[saml-user]"
#   to = sonarqube_group_member.team-users_saml-user
# }


# import {
#   id = "team-users[user]"
#   to = sonarqube_group_member.team-users_user
# }
