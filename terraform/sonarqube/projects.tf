# GitHub Project
resource "sonarqube_project" "iac" {
  name       = "IaC Projects"
  project    = "org.elefevre:iac"
  tags       = ["team-lefevre"]
  visibility = "public"
}

# __generated__ by Terraform from "org.elefevre:iac/main"
resource "sonarqube_project_main_branch" "iac-main" {
  name    = "main"
  project = sonarqube_project.iac.project
}

# Not supported by community edition
resource "sonarqube_github_binding" "iac-github" {
  alm_setting = "github"
  project     = sonarqube_project.iac.project
  repository  = "${var.gh-org}/iac"
}

# -----------------------

# GitLab Project

resource "sonarqube_project" "go" {
  name       = "Go"
  project    = "org.elefevre:go"
  tags       = ["team-lefevre"]
  visibility = "private"
}

resource "sonarqube_project_main_branch" "go-main" {
  name    = "main"
  project = sonarqube_project.go.project
}

resource "sonarqube_gitlab_binding" "go-gitlab" {
  alm_setting = sonarqube_alm_gitlab.gitlab-alm.key
  project     = sonarqube_project.go.project
  repository  = "32044637"
}
