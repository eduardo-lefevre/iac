resource "sonarqube_project" "iac" {
  name       = "IaC Projects"
  project    = "org.elefevre:iac"
  tags       = ["lefevre"]
  visibility = "public"
}

# __generated__ by Terraform from "org.elefevre:iac/main"
resource "sonarqube_project_main_branch" "iac-main" {
  name    = "main"
  project = "org.elefevre:iac"
}

# Not supported by community edition
#resource "sonarqube_github_binding" "iac-github" {
#  alm_setting = sonarqube_alm_github.github-alm.key
#  project    = "org.elefevre:iac"
#  repository = "${var.gh-org}/iac"
#}
